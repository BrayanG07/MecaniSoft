var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}

var tablaCliente;
function listarCliente() {
    tablaCliente = $("#tablaCliente").DataTable({
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
            "url": "../controlador/cliente/controlador_cliente.php?opcion=listar",
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "NOMBRE_PERSONA" }, 
            { "data": "persona_nrodocumento" },
            { "data": "persona_tipodocumento" },
            {
                "data": "persona_sexo",
                render: function (data, type, row) {
                    if (data === "MASCULINO") {
                        return "<i class='fa fa-male' style=' font-size: 23px;'></i>"
                    } else if (data === "FEMENINO") {
                        return "<i class='fa fa-female' style=' font-size: 23px;'></i>";
                    } else {
                        return data;
                    }
                }
            },
            { "data": "persona_telefono" },
            { "data": "persona_correo" },
            {
                "data": "cliente_estatus",
                render: function (data, type, row) {
                    if (data === "ACTIVO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }

                }

            },
            {
                "data": "cliente_estatus",
                render: function (data, type, row) {
                    if (data === "ACTIVO") {
                        return "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;<button class='btn btn-success' disabled><i class='fa fa-check'></i></button>&nbsp;<button class='desactivar btn btn-danger'><i class='fa fa-times-circle'></i></button>"+
                        "&nbsp;<button class='btnViewCustomer btn btn-warning'><i class='fa fas fa-eye'></i></button>";
                    } else {
                        return "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;<button class='activar btn btn-success'><i class='fa fa-check'></i></button>&nbsp;<button class='btn btn-danger' disabled><i class='fa fa-times-circle'></i></button>"+
                        "&nbsp;<button class='btnViewCustomer btn btn-warning'><i class='fa fas fa-eye'></i></button>";
                    }

                }

            }
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
    tablaCliente.on('draw.dt', function () {
        var PageInfo = $('#tablaCliente').DataTable().page.info();
        tablaCliente.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

function registrarCliente() {
    var nombre = document.querySelector('#txtNombre').value;
    var apellidoPaterno = document.querySelector('#txtApellidoPaterno').value;
    var apellidoMaterno = document.querySelector('#txtApellidoMaterno').value;
    var tipoDocumento = document.querySelector('#cbmTipoDocumento').value;
    var numeroDocumento = document.querySelector('#txtNumero').value;
    var sexo = document.querySelector('#cbmSexo').value;
    var telefono = document.querySelector('#txtTelefono').value;
    var correo = document.querySelector('#txtCorreo').value;
    var empresa = document.querySelector('#txtNombreEmpresa').value;

    var usuarioLog = document.querySelector('#idUsuarioLog').value;

    if ($("#txtRepresenta").is(':checked')) {
        if (empresa == "") {
            return Swal.fire('Mensaje de advertencia', 'Tiene seleccionado la empresa por lo tanto debe llenar el campo de nombre de empresa', 'warning');
        }
    }

    if (nombre.length == 0 || apellidoPaterno.length == 0 || apellidoMaterno.length == 0 || tipoDocumento.length == 0
        || numeroDocumento.length == 0 || sexo.length == 0 || telefono.length == 0) {
        mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, sexo, telefono, 'divError');
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios', 'warning');
    }

    if (correo.length > 0 ) {
        if (!validarEmail(correo)) {
            return Swal.fire('Mensaje de advertencia', 'El formato de email es incorrecto.', 'warning');
        }
    }

    $.ajax({
        url: '../controlador/cliente/controlador_cliente.php?opcion=registrar',
        type: 'POST',
        data: {
            nombre: nombre,
            apellidoPaterno: apellidoPaterno,
            apellidoMaterno: apellidoMaterno,
            tipoDocumento: tipoDocumento,
            numeroDocumento: numeroDocumento,
            sexo: sexo,
            telefono: telefono,
            correo: correo,
            empresa,
            usuarioLog: usuarioLog
        }
    }).done(function (resp) {
        if (isNaN(resp)) {
            document.querySelector('#divError').style.display = "block";
            document.querySelector('#divError').innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + resp;

        } else {
            if (resp > 0) {
                document.querySelector('#divError').style.display = "none";
                if (resp == 1) {
                    tablaCliente.ajax.reload();

                    $("#modal_registro").modal('hide'); 
                    Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
                } else if(resp == 2) {
                    Swal.fire('Mensaje de advertencia', 'El numero de documento ya se encuentra registrado en el sistema, esa persona ya esta registrada', 'warning');
                } else if(resp == 3) {
                    Swal.fire('Mensaje de advertencia', 'El correo electronico ya pertenece a otra persona registrada en el sistema.', 'warning');
                } else {
                    Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');    
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
}

$('#tablaCliente').on('click', '.activar', function () {
    if (!accesos.includes('11-3')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tablaCliente.row($(this).parents('tr')).data(); 

    if (tablaCliente.row(this).child.isShown()) { 
        var data = tablaCliente.row(this).data();
    }

    Swal.fire({
        title: '¿Desea activar al cliente ' + data.persona_nombre + ' ' + data.persona_apepat + ' ' + data.persona_apmat + ' ?',
        text: "Estas seguro de activar al cliente!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, activarlo!'
    }).then((result) => {
        if (result.isConfirmed) {
            modificarEstatusClientes(data.cliente_id, 'ACTIVO');
        }
    })
});

function modificarEstatusClientes(idCliente, estatus) {

        var usuarioLog = document.querySelector('#idUsuarioLog').value;

    $.ajax({
        url: '../controlador/cliente/controlador_cliente.php?opcion=estatus',
        type: 'POST',
        data: {
            idCliente: idCliente,
            estatus: estatus,
            usuarioLog: usuarioLog
        }
    }).done(function (resp) {
        if (resp > 0) {
            if (estatus === 'ACTIVO') {
                Swal.fire('Mensaje de confirmacion', 'Cliente activado correctamente', 'success');
            } else {
                Swal.fire('Mensaje de confirmacion', 'Cliente desactivado correctamente', 'success');
            }
            tablaCliente.ajax.reload();
        } else {
            Swal.fire('Mensaje de Error', 'No se pudo actualizar los datos', 'warning');
        }
    });
}

$('#tablaCliente').on('click', '.desactivar', function () {
    if (!accesos.includes('11-4')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tablaCliente.row($(this).parents('tr')).data(); 

    if (tablaCliente.row(this).child.isShown()) { 
        var data = tablaCliente.row(this).data();
    }

    Swal.fire({
        title: '¿Desea desactivar al cliente ' + data.persona_nombre + ' ' + data.persona_apepat + ' ' + data.persona_apmat + ' ?',
        text: "Estas seguro de desactivar al cliente!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, desactivarlo!'
    }).then((result) => {
        if (result.isConfirmed) {
            modificarEstatusClientes(data.cliente_id, 'INACTIVO');
        }
    })
});

$('#tablaCliente').on('click', '.editar', function () {
    if (!accesos.includes('11-2')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("editar");
    var data = tablaCliente.row($(this).parents('tr')).data(); 

    if (tablaCliente.row(this).child.isShown()) { 
        var data = tablaCliente.row(this).data();
    }
    $('.title__customer').html('EDITAR CLIENTE');
    $('.btnUpdateCustomer').prop('disabled', false);
    loadDataCustomer(data);
});

$('#tablaCliente').on('click', '.btnViewCustomer', function () {
    if (!accesos.includes('11-5')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("editar");
    var data = tablaCliente.row($(this).parents('tr')).data(); 

    if (tablaCliente.row(this).child.isShown()) { 
        var data = tablaCliente.row(this).data();
    }
    $('.title__customer').html('CLIENTE SELECCIONADO');
    $('.btnUpdateCustomer').prop('disabled', true);
    loadDataCustomer(data);
});


function loadDataCustomer(data) {
    let {persona_id, persona_nombre, persona_apepat, persona_apmat, persona_correo, persona_nrodocumento, persona_telefono, persona_empresa, persona_tipodocumento, persona_sexo} = data;
    $("#modal_editar").modal('show');
    document.querySelector("#txtIdPersona").value = persona_id;
    document.querySelector("#txtNombreEditar").value = persona_nombre;
    document.querySelector("#txtApellidoPaternoEditar").value = persona_apepat;
    document.querySelector("#txtApellidoMaternoEditar").value = persona_apmat;
    document.querySelector("#txtCorreoEditar").value = persona_correo;
    document.querySelector("#txtNumeroEditar").value = persona_nrodocumento;
    document.querySelector("#txtTelefonoEditar").value = persona_telefono;
    document.querySelector("#txtNombreEmpresaEdit").value = persona_empresa;

    $("#cbmTipoDocumentoEditar").val(persona_tipodocumento).trigger("change");
    $("#cbmSexoEditar").val(persona_sexo).trigger("change");
}

function editarCliente() {
    let idPersona = document.querySelector("#txtIdPersona").value;
    let nombre = document.querySelector("#txtNombreEditar").value;
    let apellidoPaterno = document.querySelector("#txtApellidoPaternoEditar").value;
    let apellidoMaterno = document.querySelector("#txtApellidoMaternoEditar").value;
    let correo = document.querySelector("#txtCorreoEditar").value;
    let numeroDocumento = document.querySelector("#txtNumeroEditar").value;
    let telefono = document.querySelector("#txtTelefonoEditar").value;
    let tipoDocumento = document.querySelector("#cbmTipoDocumentoEditar").value;
    let genero = document.querySelector("#cbmSexoEditar").value;
    let empresa = document.querySelector("#txtNombreEmpresaEdit").value;
    let usuarioLog = document.querySelector("#idUsuarioLog").value;

    if (nombre.length == 0 || apellidoPaterno.length == 0 || apellidoMaterno.length == 0 || tipoDocumento.length == 0
        || numeroDocumento.length == 0 || genero.length == 0 || telefono.length == 0) {
        mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, genero, telefono, 'divErrorEditar');
        return Swal.fire('Mensaje de advertencia', 'Llene los campo vacio', 'warning');
    }

    if (correo.length > 0 ) {
        if (!validarEmail(correo)) {
            return Swal.fire('Mensaje de advertencia', 'El formato de email es incorrecto.', 'warning');
        }
    }

    $.ajax({
        url: '../controlador/cliente/controlador_cliente.php?opcion=editar',
        type: 'POST',
        data: {
            idPersona: idPersona,
            nombre: nombre,
            apellidoPaterno: apellidoPaterno,
            apellidoMaterno: apellidoMaterno,
            correo: correo,
            numeroDocumento: numeroDocumento,
            telefono: telefono,
            tipoDocumento: tipoDocumento,
            genero: genero,
            empresa: empresa,
            usuarioLog: usuarioLog
        }
    }).done(function (resp) {
        if (isNaN(resp)) {
            document.querySelector('#divErrorEditar').style.display = "block";
            document.querySelector('#divErrorEditar').innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + resp;
        } else {
            if (resp > 0) {
                if (resp == 1) {
                    document.querySelector('#divErrorEditar').style.display = "none";
                    tablaCliente.ajax.reload();
                    $("#modal_editar").modal('hide'); 
                    Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');   
                }else if(resp == 2) {
                    Swal.fire('Mensaje de advertencia', 'El numero de documento ya se encuentra registrado en el sistema, esa persona ya esta registrada.', 'warning');
                } else if(resp == 3) {
                    Swal.fire('Mensaje de advertencia', 'El correo electronico ya pertenece a otra persona registrada en el sistema.', 'warning');
                } else {
                    Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');    
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
            }
        }
    });
}

$("#txtRepresenta").click(function (e) {
    if ($(this).is(':checked')) {
        $("#cont__empresa").css("display", "block");
    } else {
        $("#cont__empresa").css("display", "none");
    }
});

function abrirModal() {
    if (!accesos.includes('11-1')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }

    $("#modal_registro").modal('show');
    limpiarModal("registrar");
}

function mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, sexo, telefono,div) {
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
        document.querySelector('#formularioRegistroCliente').reset();

        while (divError.firstChild) {
            divError.removeChild(divError.firstChild);
        }
        divError.style.display = "none";
    } else {
        const divErrorE = document.querySelector('#divErrorEditar');
        document.querySelector('#formularioEditarCliente').reset();

        while (divErrorE.firstChild) {
            divErrorE.removeChild(divErrorE.firstChild);
        }
        divErrorE.style.display = "none";
    }
}

function validarEmail(email) {
    const er = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return er.test(email) ? true : false;
}