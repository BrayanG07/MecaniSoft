var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}

var tablaProveedor;
function listarProveedor() {
    tablaProveedor = $("#tablaProveedor").DataTable({
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
            "url": "../controlador/proveedor/controlador_proveedor.php?opcion=listar",
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "NOMBRE_PROVEEDOR" },
            { "data": "proveedor_razonsocial" },
            { "data": "persona_correo" },
            { "data": "proveedor_contacto" },
            { "data": "proveedor_numcontacto" },
            { "data": "persona_nrodocumento" },
            { "data": "persona_tipodocumento" },
            {
                "data": "proveedor_estatus",
                render: function (data, type, row) {
                    if (data === "ACTIVO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }

                }

            },
            {
                "data": "proveedor_estatus",
                render: function (data, type, row) {
                    if (data === "ACTIVO") {
                        return "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp; " +
                            "<button class='btn btn-success' disabled><i class='fa fa-check'></i></button>&nbsp; " +
                            "<button class='desactivar btn btn-danger'><i class='fa fa-times-circle'></i></button>" +
                            "&nbsp;<button class='btn btn-warning btnViewSupplier'><i class='fas fa-eye'></i></button>";
                    } else {
                        return "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp; " +
                            "<button class='activar btn btn-success'><i class='fa fa-check'></i></button>&nbsp; " +
                            "<button class='btn btn-danger' disabled><i class='fa fa-times-circle'></i></button>" +
                            "&nbsp;<button class='btn btn-warning btnViewSupplier'><i class='fas fa-eye'></i></button>";
                    }

                }

            }
        ],

        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[4]).css('text-align', 'left');
            $($(nRow).find("td")[5]).css('text-align', 'center');
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaProveedor.on('draw.dt', function () {
        var PageInfo = $('#tablaProveedor').DataTable().page.info();
        tablaProveedor.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

function registrarProveedor() {
    var nombre = document.querySelector('#txtNombre').value;
    var razonSocial = document.querySelector('#txtRazonSocial').value;
    var nombreContacto = document.querySelector('#txtNombreContacto').value;
    var numeroContacto = document.querySelector('#txtNumeroContacto').value;
    var apellidoPaterno = document.querySelector('#txtApellidoPaterno').value;
    var apellidoMaterno = document.querySelector('#txtApellidoMaterno').value;
    var tipoDocumento = document.querySelector('#cbmTipoDocumento').value;
    var numeroDocumento = document.querySelector('#txtNumero').value;
    var sexo = document.querySelector('#cbmSexo').value;
    var telefono = document.querySelector('#txtTelefono').value;
    var correo = document.querySelector('#txtCorreo').value;

    if (nombre.length == 0 || apellidoPaterno.length == 0 || apellidoMaterno.length == 0 || tipoDocumento.length == 0 || numeroDocumento.length == 0
        || sexo.length == 0 || telefono.length == 0 || razonSocial.length == 0 || nombreContacto.length == 0 || numeroContacto.length == 0 || correo.length == 0) {
        mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, sexo, telefono, razonSocial, nombreContacto, numeroContacto, correo, 'divError');
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios', 'warning');
    }

    if (!validarEmail(correo)) {
        return Swal.fire('Mensaje de advertencia', 'El formato de email es incorrecto', 'warning');
    }

    $.ajax({
        url: '../controlador/proveedor/controlador_proveedor.php?opcion=registrar',
        type: 'POST',
        data: {
            nombre: nombre,
            apellidoPaterno: apellidoPaterno,
            apellidoMaterno: apellidoMaterno,
            tipoDocumento: tipoDocumento,
            numeroDocumento: numeroDocumento,
            razonSocial: razonSocial,
            nombreContacto: nombreContacto,
            numeroContacto: numeroContacto,
            sexo: sexo,
            telefono: telefono,
            correo: correo
        }
    }).done(function (resp) {
        if (isNaN(resp)) {
            document.querySelector('#divError').style.display = "block";
            document.querySelector('#divError').innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + resp;

        } else {
            if (resp > 0) {
                document.querySelector('#divError').style.display = "none";
                if (resp == 1) {
                    tablaProveedor.ajax.reload();
                    $("#modal_registro").modal('hide');
                    Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
                } else if (resp == 2) {
                    Swal.fire('Mensaje de advertencia', 'El numero de documento ya se encuentra registrado en el sistema, esa persona ya esta registrada', 'warning');
                } else if (resp == 3) {
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

$('#tablaProveedor').on('click', '.activar', function () {
    if (!accesos.includes('9-3')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }

    var data = tablaProveedor.row($(this).parents('tr')).data();

    if (tablaProveedor.row(this).child.isShown()) {
        var data = tablaProveedor.row(this).data();
    }

    Swal.fire({
        title: '¿Desea activar al proveedor ' + data.persona_nombre + ' ' + data.persona_apepat + ' ' + data.persona_apmat + ' ?',
        text: "Estas seguro de activar al proveedor!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, activarlo!'
    }).then((result) => {
        if (result.isConfirmed) {
            modificarEstatusProveedor(data.proveedor_id, 'ACTIVO');
        }
    })
});

$('#tablaProveedor').on('click', '.desactivar', function () {
    if (!accesos.includes('9-4')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tablaProveedor.row($(this).parents('tr')).data();

    if (tablaProveedor.row(this).child.isShown()) {
        var data = tablaProveedor.row(this).data();
    }

    Swal.fire({
        title: '¿Desea desactivar al proveedor ' + data.persona_nombre + ' ' + data.persona_apepat + ' ' + data.persona_apmat + ' ?',
        text: "Estas seguro de desactivar al proveedor!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, desactivarlo!'
    }).then((result) => {
        if (result.isConfirmed) {
            modificarEstatusProveedor(data.proveedor_id, 'INACTIVO');
        }
    })
});

function modificarEstatusProveedor(idProveedor, estatus) {
    $.ajax({
        url: '../controlador/proveedor/controlador_proveedor.php?opcion=estatus',
        type: 'POST',
        data: {
            idProveedor: idProveedor,
            estatus: estatus,
        }
    }).done(function (resp) {
        if (resp > 0) {
            if (estatus === 'ACTIVO') {
                Swal.fire('Mensaje de confirmacion', 'Proveedor activado correctamente', 'success');
            } else {
                Swal.fire('Mensaje de confirmacion', 'Proveedor desactivado correctamente', 'success');
            }
            tablaProveedor.ajax.reload();
        } else {
            Swal.fire('Mensaje de Error', 'No se pudo actualizar los datos', 'warning');
        }
    });
}

$('#tablaProveedor').on('click', '.editar', function () {
    if (!accesos.includes('9-2')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("editar");
    var data = tablaProveedor.row($(this).parents('tr')).data();

    if (tablaProveedor.row(this).child.isShown()) {
        var data = tablaProveedor.row(this).data();
    }
    $('.title_supplier').html('EDITAR PROVEEDOR');
    $('.btnUpdateSupplier').prop('disabled', false);
    loadDataSupplier(data);
});

$('#tablaProveedor').on('click', '.btnViewSupplier', function () {
    if (!accesos.includes('9-5')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("editar");
    var data = tablaProveedor.row($(this).parents('tr')).data();

    if (tablaProveedor.row(this).child.isShown()) {
        var data = tablaProveedor.row(this).data();
    }
    $('.title_supplier').html('PROVEEDOR SELECCIONADO');
    $('.btnUpdateSupplier').prop('disabled', true);
    loadDataSupplier(data);
});

function loadDataSupplier(data) {
    let { proveedor_id, persona_id, proveedor_razonsocial, proveedor_contacto, proveedor_numcontacto, persona_nombre, persona_apepat, persona_apmat, persona_correo, persona_nrodocumento, persona_telefono, persona_tipodocumento, persona_sexo } = data;
    $("#modal_editar").modal('show');
    document.querySelector("#txtIdProveedor").value = proveedor_id;
    document.querySelector("#txtIdPersona").value = persona_id;
    document.querySelector("#txtRazonSocialEditar").value = proveedor_razonsocial;
    document.querySelector("#txtNombreContactoEditar").value = proveedor_contacto;
    document.querySelector("#txtNumeroContactoEditar").value = proveedor_numcontacto;
    document.querySelector("#txtNombreEditar").value = persona_nombre;
    document.querySelector("#txtApellidoPaternoEditar").value = persona_apepat;
    document.querySelector("#txtApellidoMaternoEditar").value = persona_apmat;
    document.querySelector("#txtCorreoEditar").value = persona_correo;
    document.querySelector("#txtNumeroEditar").value = persona_nrodocumento;
    document.querySelector("#txtTelefonoEditar").value = persona_telefono;
    $("#cbmTipoDocumentoEditar").val(persona_tipodocumento).trigger("change");
    $("#cbmSexoEditar").val(persona_sexo).trigger("change");
}

function editarProveedor() {
    let idProveedor = document.querySelector("#txtIdProveedor").value;
    let idPersona = document.querySelector("#txtIdPersona").value;
    let razonSocial = document.querySelector("#txtRazonSocialEditar").value;
    let nombreContacto = document.querySelector("#txtNombreContactoEditar").value;
    let numeroContacto = document.querySelector("#txtNumeroContactoEditar").value;
    let nombre = document.querySelector("#txtNombreEditar").value;
    let apellidoPaterno = document.querySelector("#txtApellidoPaternoEditar").value;
    let apellidoMaterno = document.querySelector("#txtApellidoMaternoEditar").value;
    let correo = document.querySelector("#txtCorreoEditar").value;
    let numeroDocumento = document.querySelector("#txtNumeroEditar").value;
    let telefono = document.querySelector("#txtTelefonoEditar").value;
    let tipoDocumento = document.querySelector("#cbmTipoDocumentoEditar").value;
    let genero = document.querySelector("#cbmSexoEditar").value;


    if (nombre.length == 0 || apellidoPaterno.length == 0 || apellidoMaterno.length == 0 || tipoDocumento.length == 0 || numeroDocumento.length == 0
        || genero.length == 0 || telefono.length == 0 || razonSocial.length == 0 || nombreContacto.length == 0 || numeroContacto.length == 0 || correo.length == 0) {
        mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, genero, telefono, razonSocial, nombreContacto, numeroContacto, correo, 'divErrorEditar');
        return Swal.fire('Mensaje de advertencia', 'Llene el campo vacio', 'warning');
    }

    if (!validarEmail(correo)) {
        return Swal.fire('Mensaje de advertencia', 'El formato de email es incorrecto', 'warning');
    }

    $.ajax({
        url: '../controlador/proveedor/controlador_proveedor.php?opcion=editar',
        type: 'POST',
        data: {
            id: idProveedor,
            idPersona: idPersona,
            razonSocial: razonSocial,
            nombreContacto: nombreContacto,
            numeroContacto: numeroContacto,
            nombre: nombre,
            apellidoPaterno: apellidoPaterno,
            apellidoMaterno: apellidoMaterno,
            correo: correo,
            numeroDocumento: numeroDocumento,
            telefono: telefono,
            tipoDocumento: tipoDocumento,
            genero: genero
        }
    }).done(function (resp) {
        if (isNaN(resp)) {
            document.querySelector('#divErrorEditar').style.display = "block";
            document.querySelector('#divErrorEditar').innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + resp;
        } else {
            if (resp > 0) {
                if (resp == 1) {
                    document.querySelector('#divErrorEditar').style.display = "none";
                    tablaProveedor.ajax.reload();
                    $("#modal_editar").modal('hide');
                    Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
                } else if (resp == 2) {
                    Swal.fire('Mensaje de advertencia', 'El numero de documento ya se encuentra registrado en el sistema, esa persona ya esta registrada.', 'warning');
                } else if (resp == 3) {
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

function abrirModal() {
    if (!accesos.includes('9-1')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    $("#modal_registro").modal('show');
    limpiarModal("registrar");
}

function mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, sexo, telefono, razonSocial, nombreContacto, numeroContacto, correo, div) {
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
    if (razonSocial.length === 0) {
        cadena += "El campo razon social no debe estar vacio. <br>";
    }
    if (nombreContacto.length === 0) {
        cadena += "El nombre de contacto no debe estar vacio. <br>";
    }
    if (numeroContacto.length === 0) {
        cadena += "El campo numero de contacto no debe estar vacio. <br>";
    }

    if (correo.length === 0) {
        cadena += "El campo de correo electronico no debe estar vacio. <br>";
    }

    document.querySelector("#" + div).style.display = "block";
    document.querySelector("#" + div).innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + cadena;
}

function limpiarModal(tipoModal) {
    if (tipoModal == "registrar") {
        const divError = document.querySelector('#divError');
        document.querySelector('#formularioRegistroProveedor').reset();

        while (divError.firstChild) {
            divError.removeChild(divError.firstChild);
        }
        divError.style.display = "none";
    } else {
        const divErrorE = document.querySelector('#divErrorEditar');
        document.querySelector('#formularioEditarProveedor').reset();

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