var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}

var tablaPersona;
function listarPersona() {
    tablaPersona = $("#tabla_persona").DataTable({
        dom: 'lftiprB', //Importante para Imprimir los botones
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        "ordering": true,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controlador/persona/controlador_persona.php?opcion=listar",
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "NOMBRE_PERSONA" }, //NOMBRE_PERSONA = alias que le pusimos a la funcion CONCAT_WS EN EL SP
            { "data": "persona_nrodocumento" },
            { "data": "persona_tipodocumento" },
            {
                "data": "persona_sexo",
                render: function (data, type, row) {
                    if (data === "MASCULINO") {
                        return "<i class='fa fa-male' style=' font-size: 23px;'></i>"
                    } else {
                        return "<i class='fa fa-female' style=' font-size: 23px;'></i>";
                    }
                }
            },
            { "data": "persona_telefono" },
            { "data": "persona_correo" },
            { "data": "tipo_persona" },
            { "defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;<button class='credenciales btn btn-success'><i class='fa fa-user'></i></button>" }
        ],

        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[5]).css('text-align', 'left');
            $($(nRow).find("td")[4]).css('text-align', 'center');
            $($(nRow).find("td")[3]).css('text-align', 'center');

        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaPersona.on('draw.dt', function () {
        var PageInfo = $('#tabla_persona').DataTable().page.info();
        tablaPersona.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

$('#tabla_persona').on('click', '.editar', function () {
    if (!accesos.includes('17-2')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("editar");
    var data = tablaPersona.row($(this).parents('tr')).data();

    if (tablaPersona.row(this).child.isShown()) {
        var data = tablaPersona.row(this).data();
    }

    $("#modal_editar").modal('show');
    document.querySelector("#txtIdPersona").value = data.persona_id;
    document.querySelector("#txtNombreEditar").value = data.persona_nombre;
    document.querySelector("#txtApellidoPaternoEditar").value = data.persona_apepat;
    document.querySelector("#txtApellidoMaternoEditar").value = data.persona_apmat;
    document.querySelector("#txtNumeroEditarActual").value = data.persona_nrodocumento;
    document.querySelector("#txtNumeroEditarNuevo").value = data.persona_nrodocumento;
    document.querySelector("#txtTelefonoEditar").value = data.persona_telefono;

    //Setear la data A LOS OPTIONS
    $("#cbmTipoDocumentoEditar").val(data.persona_tipodocumento).trigger("change");
    $("#cbmSexoEditar").val(data.persona_sexo).trigger("change");
    $("#cbmEstatus").val(data.persona_estatus).trigger("change");
});

$('#tabla_persona').on('click', '.credenciales', function () {
    let existeCorreo = 0;
    var data = tablaPersona.row($(this).parents('tr')).data();
    if (tablaPersona.row(this).child.isShown()) {
        var data = tablaPersona.row(this).data();
    }
    let { persona_id, persona_nrodocumento, persona_correo, NOMBRE_PERSONA } = data;

    if (persona_correo == null || persona_correo == '') {
        existeCorreo = 1;
    } else {
        existeCorreo = 2;
    }

    Swal.fire({
        title: '¿Esta seguro de asignarle credenciales a: ' + NOMBRE_PERSONA + ' ?',
        text: "Tenga en cuenta lo que esto significa!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, asignar credenciales!'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '../controlador/persona/controlador_persona.php?opcion=credenciales',
                type: 'POST',
                data: {
                    personaId: persona_id,
                    username: persona_nrodocumento,
                    correo: persona_correo,
                    nombrePersona: NOMBRE_PERSONA,
                    existeCorreo: existeCorreo
                }
            }).done(function (resp) {
                if (resp > 0) {
                    if (resp == 1) {
                        if (existeCorreo == 1) {
                            Swal.fire('Credenciales registradas', 'Usuario: '+persona_nrodocumento+' -  Contraseña: '+persona_nrodocumento, 'success');
                        } else {
                            Swal.fire('Mensaje de confirmacion', 'Credenciales registradas y enviadas al correo de la persona de forma exitosa.', 'success');   
                        }
                    } else {
                        Swal.fire('Mensaje de advertencia', 'La persona ya tiene credenciales asignadas.', 'warning');
                    }

                } else {
                    Swal.fire('Mensaje de advertencia', 'No se pudo completar el proceso de generacion de credenciales', 'warning');
                }
            });
        }
    });

});

function registrarPersona() {
    var nombre = document.querySelector('#txtNombre').value;
    var apellidoPaterno = document.querySelector('#txtApellidoPaterno').value;
    var apellidoMaterno = document.querySelector('#txtApellidoMaterno').value;
    var tipoDocumento = document.querySelector('#cbmTipoDocumento').value;
    var numeroDocumento = document.querySelector('#txtNumero').value;
    var sexo = document.querySelector('#cbmSexo').value;
    var telefono = document.querySelector('#txtTelefono').value;

    if (nombre.length == 0 || apellidoPaterno.length == 0 || apellidoMaterno.length == 0 || tipoDocumento.length == 0
        || numeroDocumento.length == 0 || sexo.length == 0 || telefono.length == 0) {
        mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, sexo, telefono, 'divError');
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios', 'warning');
    }

    $.ajax({
        url: '../controlador/persona/controlador_persona.php?opcion=registrar',
        type: 'POST',
        data: {
            nombre: nombre,
            apellidoPaterno: apellidoPaterno,
            apellidoMaterno: apellidoMaterno,
            tipoDocumento: tipoDocumento,
            numeroDocumento: numeroDocumento,
            sexo: sexo,
            telefono: telefono
        }
    }).done(function (resp) {
        if (isNaN(resp)) {
            document.querySelector('#divError').style.display = "block";
            document.querySelector('#divError').innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + resp;

            // setTimeout(() => {
            //     document.querySelector('#divError').style.display = "none";
            // }, 5000);
        } else {
            if (resp > 0) {
                document.querySelector('#divError').style.display = "none";
                if (resp == 1) {
                    tablaPersona.ajax.reload();
                    $("#modal_registro").modal('hide');
                    document.querySelector('#formularioRegistroPersona').reset();
                    Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
                } else {
                    Swal.fire('Mensaje de advertencia', 'El numero de documento ya se encuentra registrado en el sistema, esa persona ya esta registrada', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
}

function editarPersona() {
    var idPersona = document.querySelector("#txtIdPersona").value;
    var nombre = document.querySelector("#txtNombreEditar").value;
    var apellidoPaterno = document.querySelector("#txtApellidoPaternoEditar").value;
    var apellidoMaterno = document.querySelector("#txtApellidoMaternoEditar").value;
    var tipoDocumento = document.querySelector('#cbmTipoDocumentoEditar').value;
    var numeroDocumentoActual = document.querySelector('#txtNumeroEditarActual').value;
    var numeroDocumentoNuevo = document.querySelector('#txtNumeroEditarNuevo').value;
    var sexo = document.querySelector('#cbmSexoEditar').value;
    var telefono = document.querySelector('#txtTelefonoEditar').value;
    var estatus = document.querySelector('#cbmEstatus').value;

    if (idPersona.lenth == 0 || nombre.length == 0 || apellidoPaterno.length == 0 || apellidoMaterno.length == 0 || tipoDocumento.length == 0
        || numeroDocumentoActual.length == 0 || numeroDocumentoNuevo.length == 0 || sexo.length == 0 || telefono.length == 0 || estatus.length == 0) {
        mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumentoNuevo, sexo, telefono, 'divErrorEditar');
        return Swal.fire('Mensaje de advertencia', 'Llene el campo vacio', 'warning');
    }

    $.ajax({
        url: '../controlador/persona/controlador_persona.php?opcion=editar',
        type: 'POST',
        data: {
            id: idPersona,
            nombre: nombre,
            apellidoPaterno: apellidoPaterno,
            apellidoMaterno: apellidoMaterno,
            tipoDocumento: tipoDocumento,
            numeroDocumentoActual: numeroDocumentoActual,
            numeroDocumentoNuevo: numeroDocumentoNuevo,
            sexo: sexo,
            telefono: telefono,
            estatus: estatus
        }
    }).done(function (resp) {
        if (isNaN(resp)) {
            document.querySelector('#divErrorEditar').style.display = "block";
            document.querySelector('#divErrorEditar').innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + resp;
        } else {
            if (resp > 0) {
                document.querySelector('#divErrorEditar').style.display = "none";
                if (resp == 1) {
                    tablaPersona.ajax.reload();
                    $("#modal_editar").modal('hide');
                    document.querySelector('#formularioEditarPersona').reset();
                    Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
                } else {
                    Swal.fire('Mensaje de advertencia', 'El numero de documento ya se encuentra registrado en el sistema, esa persona ya esta registrada', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
            }
        }
    });
}

function abrirModal() {
    if (!accesos.includes('17-1')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }

    $("#modal_registro").modal('show');
    limpiarModal("registrar");
}

function mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, sexo, telefono, div) {
    let cadena = "";
    if (nombre.length === 0) {
        cadena += "El campo nombre no debe estar vacio. <br>";
    }
    if (apellidoPaterno.length === 0) {
        cadena += "El campo apelido paterno no debe estar vacio. <br>";
    }
    if (apellidoMaterno.length === 0) {
        cadena += "El campo apellido materno no debe estar vacio. <br>";
    }
    if (tipoDocumento.length === 0) {
        cadena += "El campo tipo de documento no debe estar vacio. <br>";
    }
    if (numeroDocumento.length === 0) {
        cadena += "El campo numero de documento no debe estar vacio. <br>";
    }
    if (sexo.length === 0) {
        cadena += "El campo sexo no debe estar vacio. <br>";
    }
    if (telefono.length === 0) {
        cadena += "El campo numero de telefono no debe estar vacio. <br>";
    }

    document.querySelector("#" + div).style.display = "block";
    document.querySelector("#" + div).innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + cadena;
}

function limpiarModal(tipoModal) {
    if (tipoModal == "registrar") {
        const divError = document.querySelector('#divError');
        document.querySelector('#formularioRegistroPersona').reset();

        while (divError.firstChild) {
            divError.removeChild(divError.firstChild);
        }
        divError.style.display = "none";
    } else {
        const divErrorE = document.querySelector('#divErrorEditar');
        document.querySelector('#formularioEditarPersona').reset();

        while (divErrorE.firstChild) {
            divErrorE.removeChild(divErrorE.firstChild);
        }
        divErrorE.style.display = "none";
    }
}