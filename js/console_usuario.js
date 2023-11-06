var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}

function verificarUsuario() {
    let usu = document.querySelector('#usuario').value;
    let pass = document.querySelector('#password').value;

    if (usu.length == 0 || pass.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Llene los campos vacios', 'warning');
    }

    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=verificarUsuario',
        type: 'POST',
        data: {
            usuario_ajax: usu,
            password_ajax: pass
        }
    }).done(function (respuesta) {
        let data = JSON.parse(respuesta);

        if (respuesta == 0) {
            Swal.fire("Mensaje de advertencia", "Usuario y/o contraseña incorrecta", "warning");
        } else {

            if (data[0][8] == 1) {
                $('#login-form')[0].reset();
                $('#cont__login').css('display', 'none');
                $('#cont__crendenciales').css('display', 'block');
                $('#txtIdUser').val(data[0][0]);
                $('#txtUsername').val(data[0][1]);
                $('#txtPasswordCurrent').val(pass);
            } else {
                if (data[0][4] === "ACTIVO") {//data[0][5] = usuario_estatus de la BD
                    $.ajax({
                        url: '../controlador/usuario/controlador_usuario.php?opcion=crearSesion',
                        type: 'POST',
                        data: {
                            idusuario: data[0][0], //data[0][0] = usuario_id de la BD
                            usuario: data[0][1], //data[0][1] = usuario_nombre de la BD
                            rol: data[0][7] //data[0][6] = rol_nombre de la BD
                        }
                    }).done(function (res) {
                        let timerInterval
                        Swal.fire({
                            title: 'Bienvenido al sistema!',
                            html: 'Sera redireccionado en <b></b> milisegundos.',
                            timer: 2000,
                            timerProgressBar: true,
                            didOpen: () => {
                                Swal.showLoading()
                                const b = Swal.getHtmlContainer().querySelector('b')
                                timerInterval = setInterval(() => {
                                    b.textContent = Swal.getTimerLeft()
                                }, 100)
                            },
                            willClose: () => {
                                clearInterval(timerInterval)
                            }
                        }).then((result) => {
                            /* Read more about handling dismissals below */
                            if (result.dismiss === Swal.DismissReason.timer) {

                                location.reload(); //Vuelve a cargar el login

                            }
                        })
                    });

                } else {
                    Swal.fire("Mensaje de advertencia", "El usuario se encuentra inactivo, comuniquese con el administrador", "warning");
                }
            }
        }
    });
}

var tablaUsuario;
function listarUsuario() {
    tablaUsuario = $("#tablaUsuario").DataTable({
        dom: 'lftiprB', //Importante para Imprimir los botones, indica la posicion de los botones
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
            "url": "../controlador/usuario/controlador_usuario.php?opcion=listar",
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "usuario_nombre" },
            { "data": "NOMBRE_PERSONA" },
            { "data": "persona_nrodocumento" },
            { "data": "rol_nombre" },
            { "data": "persona_correo" },
            {
                "data": "usuario_imagen",
                render: function (data, type, row) {
                    return `<img src="../${data}" width="40px" class="img-circle m-r-10">`;
                }
            },
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
            {
                "data": "usuario_estatus",
                render: function (data, type, row) {
                    if (data === "ACTIVO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }

                }

            },
            {
                "defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;" +
                    "<button class='btnViewUser btn btn-warning'><i class='fa fas fa-eye'></i></button>&nbsp;" +
                    "<button class='credenciales btn btn-success'><i class='fas fa-lock'></i></button>&nbsp;"
            }

        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[7]).css('text-align', 'center');
            $($(nRow).find("td")[6]).css('text-align', 'center');
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaUsuario.on('draw.dt', function () {
        var PageInfo = $('#tablaUsuario').DataTable().page.info();
        tablaUsuario.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

function listarRolCombo() {
    $.ajax({
        url: "../controlador/usuario/controlador_usuario.php?opcion=listarComboRol",
        type: "POST"
    }).done(function (resp) {
        let data = JSON.parse(resp);
        let cadena = "";
        if (data.length > 0) {
            for (let i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            document.querySelector('#cbmRol').innerHTML = cadena;
            document.querySelector('#cbmRolEditar').innerHTML = cadena;
        } else {
            document.querySelector('#cbmRol').innerHTML = "No se encontraron datos";
            document.querySelector('#cbmRolEditar').innerHTML = "No se encontraron datos";
        }
    });
}

function registrarUsuario() {
    let usuario = document.querySelector("#txtUsuario").value;
    let password = document.querySelector("#txtPassword").value;
    let email = document.querySelector("#txtEmail").value;
    let idRrol = document.querySelector("#cbmRol").value;
    let archivo = document.querySelector("#txtImagen").value;
    let nombre = document.querySelector("#txtNombre").value;
    let apellidoPaterno = document.querySelector("#txtApellidoPaterno").value;
    let apellidoMaterno = document.querySelector("#txtApellidoMaterno").value;
    let tipoDocumento = document.querySelector("#cbmTipoDocumento").value;
    let numeroDocumento = document.querySelector("#txtNumero").value;
    let telefono = document.querySelector("#txtTelefono").value;
    let genero = document.querySelector("#cbmSexo").value;


    let f = new Date();
    let extension = archivo.split('.').pop();

    //Para que ninguna imagen se repita
    let nombreArchivo = "IMG" + f.getDate() + "" + (f.getMonth() + 1) + "" + f.getFullYear() + "" + f.getHours() + "" + f.getMinutes() + "" + f.getSeconds() + "." + extension;

    let formData = new FormData();
    let foto = $("#txtImagen")[0].files[0];

    if (usuario.length == 0 || password.length == 0 || email.length == 0 || idRrol.length == 0 || nombre.length == 0 || apellidoPaterno.length == 0 || apellidoMaterno.length == 0 || tipoDocumento.length == 0 || numeroDocumento.length == 0 || telefono.length == 0 || genero.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios', 'warning');
    }
    if (password.length < 5) {
        return Swal.fire('Mensaje de Seguridad', 'Ingresa un password con mas caracteres', 'warning');
    }
    if (!validarEmail(email)) {
        return Swal.fire('Mensaje de advertencia', 'El formato de email es incorrecto', 'warning');
    }

    formData.append('usuario', usuario);
    formData.append('password', password);
    formData.append('email', email);
    formData.append('idRol', idRrol);
    formData.append('foto', foto);
    formData.append('nombreArchivo', nombreArchivo);
    formData.append('nombre', nombre);
    formData.append('apellidoPaterno', apellidoPaterno);
    formData.append('apellidoMaterno', apellidoMaterno);
    formData.append('tipoDocumento', tipoDocumento);
    formData.append('numeroDocumento', numeroDocumento);
    formData.append('telefono', telefono);
    formData.append('genero', genero);

    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=registrar',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            if (respuesta != 0) {
                if (respuesta == 1) {
                    tablaUsuario.ajax.reload();
                    $("#modal_registro").modal('hide');
                    document.querySelector('#formularioRegistroUsuario').reset();
                    Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
                } else if (respuesta == 2) {
                    Swal.fire('Mensaje de advertencia', 'El username ingresado ya se encuentran en el sistema', 'warning');
                } else if (respuesta == 3) {
                    Swal.fire('Mensaje de advertencia', 'El correo y/o numero de documento ingresado ya se encuentran en el sistema', 'warning');
                } else {
                    Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
    return false;
}

function editarUsuario() {
    let id = document.querySelector("#txtUsuarioId").value;
    let usuarioNuevo = document.querySelector("#txtUsuarioEditarActual").value;
    let idPersona = document.querySelector("#txtIdPersona").value;
    let idRol = document.querySelector("#cbmRolEditar").value;
    let estatus = document.querySelector("#cbmEstatus").value;

    if (usuarioNuevo.length == 0 || idPersona.length == 0 || idRol.length == 0 || estatus.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios', 'warning');
    }


    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=editar',
        type: 'POST',
        data: {
            id: id,
            idPersona: idPersona,
            idRol: idRol,
            estatus: estatus
        }
    }).done(function (resp) {
        if (resp > 0) {
            if (resp == 1) {
                tablaUsuario.ajax.reload();
                $("#modal_editar").modal('hide');
                Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
            } else {
                Swal.fire('Mensaje de advertencia', 'El email ingresado ya se encuentran en el sistema', 'warning');
            }
        } else {
            Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
        }
    });
}


$('#tablaUsuario').on('click', '.editar', function () {
    if (!accesos.includes('18-2')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("editar");
    var data = tablaUsuario.row($(this).parents('tr')).data();

    if (tablaUsuario.row(this).child.isShown()) {
        var data = tablaUsuario.row(this).data();
    }
    $('.title__user').html('EDITAR USUARIO');
    $('#btnUpdateImage').prop('disabled', false);
    $('#btnUpdateUser').prop('disabled', false);
    $('#cont__img').css('display', 'none');
    loadDataUser(data);
});

$('#tablaUsuario').on('click', '.credenciales', function () {
    if (!accesos.includes('18-8')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tablaUsuario.row($(this).parents('tr')).data();

    if (tablaUsuario.row(this).child.isShown()) {
        var data = tablaUsuario.row(this).data();
    }
    let { NOMBRE_PERSONA, usuario_id } = data;
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
            var newPassword = Math.random().toString(36).slice(-8);
            $.ajax({
                url: '../controlador/usuario/controlador_usuario.php?opcion=newCredentials',
                type: 'POST',
                data: {
                    userId: usuario_id,
                    newPassword: newPassword,
                    temporal: 1
                }
            }).done(function (resp) {                
                if (resp == 1) {
                    Swal.fire('Credenciales registradas', 'Contraseña: ' + newPassword, 'success');
                } else {
                    Swal.fire('Mensaje de advertencia', 'Ocurrio un error inesperado al actualizar las crendeciales.', 'warning');
                }
            });
        }
    });

});

$('#tablaUsuario').on('click', '.btnViewUser', function () {
    if (!accesos.includes('18-3')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("editar");
    var data = tablaUsuario.row($(this).parents('tr')).data();

    if (tablaUsuario.row(this).child.isShown()) {
        var data = tablaUsuario.row(this).data();
    }
    $('.title__user').html('USUARIO SELECCIONADO');
    $('#btnUpdateImage').prop('disabled', true);
    $('#btnUpdateUser').prop('disabled', true);
    $('#cont__img').css('display', 'block');
    loadDataUser(data);
});

function loadDataUser(data) {
    let { usuario_id, usuario_nombre, persona_id, NOMBRE_PERSONA, rol_id, usuario_estatus, usuario_imagen } = data;

    document.querySelector("#txtUsuarioId").value = usuario_id;
    document.querySelector("#txtUsuarioEditarActual").value = usuario_nombre;
    document.querySelector("#txtIdPersona").value = persona_id;
    document.querySelector("#txtPersonaEditar").value = NOMBRE_PERSONA;
    $("#cbmRolEditar").val(rol_id).trigger("change");
    $("#cbmEstatus").val(usuario_estatus).trigger("change");
    $('.img__product').attr('src', '../' + usuario_imagen);
    $("#modal_editar").modal('show');
}

function editarFoto() {
    let usuarioId = document.querySelector("#txtUsuarioId").value;
    let archivo = document.querySelector("#txtImagenEditar").value;

    let f = new Date();
    let extension = archivo.split('.').pop();

    //Para que ninguna imagen se repita
    let nombreArchivo = "IMG" + f.getDate() + "" + (f.getMonth() + 1) + "" + f.getFullYear() + "" + f.getHours() + "" + f.getMinutes() + "" + f.getSeconds() + "." + extension;
    let formData = new FormData();
    let foto = $("#txtImagenEditar")[0].files[0];

    if (archivo.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Debes seleccionar una imagen', 'warning');
    }

    formData.append('id', usuarioId);;
    formData.append('foto', foto);
    formData.append('nombreArchivo', nombreArchivo);
    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=editarFoto',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            if (respuesta != 0) {
                if (respuesta == 1) {
                    tablaUsuario.ajax.reload();
                    $("#modal_editar").modal('hide');

                    Swal.fire('Mensaje de confirmacion', 'Foto actualizada correctamente', 'success');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
    return false;
}

function editarFotoProfile() {
    if (!accesos.includes('18-5')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    let usuarioId = document.querySelector("#txtIdUsuarioLogeado").value;
    let archivo = document.querySelector("#txtImageProfile").value;

    let f = new Date();
    let extension = archivo.split('.').pop();

    //Para que ninguna imagen se repita
    let nombreArchivo = "IMG" + f.getDate() + "" + (f.getMonth() + 1) + "" + f.getFullYear() + "" + f.getHours() + "" + f.getMinutes() + "" + f.getSeconds() + "." + extension;
    let formData = new FormData();
    let foto = $("#txtImageProfile")[0].files[0];

    if (archivo.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Debes seleccionar una imagen', 'warning');
    }

    formData.append('id', usuarioId);;
    formData.append('foto', foto);
    formData.append('nombreArchivo', nombreArchivo);
    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=editarFotoProfile',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            if (respuesta != 0) {
                if (respuesta == 1) {
                    obtenerDatosPerfil();
                    document.querySelector('#formularioFotoProfile').reset();
                    Swal.fire('Mensaje de confirmacion', 'Foto actualizada correctamente', 'success');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
    return false;
}

function obtenerDatosUsuario() {
    let id = document.querySelector('#txtIdUsuarioLogeado').value;
    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=obtenerDatosUsuario',
        type: 'POST',
        data: {
            id: id
        }
    }).done(function (resp) {
        let data = JSON.parse(resp);

        if (data.length > 0) {
            $('#lblUsuarioSidebar').html(data[0][1]);
            $('#txtUsarioDropdown').html(data[0][1]);
            $('#txtRolSidebar').html(data[0][8]);
            $('#txtImagenUsuarioDropdown').attr("src", '../' + data[0][7]);
            $('#imagenUsuarioPrincipal').attr("src", '../' + data[0][7]);
        }
    });
}

function obtenerDatosPerfil() {
    let id = document.querySelector('#txtIdUsuarioLogeado').value;
    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=obtenerDatosPerfil',
        type: 'POST',
        data: {
            id: id
        }
    }).done(function (resp) {
        let data = JSON.parse(resp);

        if (data.length > 0) {
            document.querySelector('#txtImagenPerfil').src = '../' + data[0][7]; //[0][7] = imagen usuario
            document.querySelector('#txtPersonaProfile').innerHTML = data[0][9] + ' ' + data[0][10] + ' ' + data[0][11]; //[0][7] = Nombre Persona 
            document.querySelector('#txtRolProfile').innerHTML = data[0][8];
            document.querySelector('#txtNombresProfile').value = data[0][9];
            document.querySelector('#txtApellidoPaternoProfile').value = data[0][10];
            document.querySelector('#txtApellidoMaternoProfile').value = data[0][11];
            document.querySelector('#txtNumeroDocumentoProfile').value = data[0][12];
            $("#cbmTipoDocumentoProfile").val(data[0][13]).trigger('change');
            $("#cbmSexoProfile").val(data[0][14]).trigger('change');
            document.querySelector('#txtTelefonoProfile').value = data[0][15];
            document.querySelector('#txtPasswordEncriptado').value = data[0][2];
            document.querySelector('#txtCorreoProfile').value = data[0][3];
        }
    });
}

function datosActualizar() {
    if (!accesos.includes('18-6')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var id = document.querySelector('#txtIdUsuarioLogeado').value;
    var nombre = document.querySelector('#txtNombresProfile').value;
    var apellidoPaterno = document.querySelector('#txtApellidoPaternoProfile').value;
    var apellidoMaterno = document.querySelector('#txtApellidoMaternoProfile').value;
    var tipoDocumento = document.querySelector('#cbmTipoDocumentoProfile').value;
    var numeroDocumento = document.querySelector('#txtNumeroDocumentoProfile').value;
    var sexo = document.querySelector('#cbmSexoProfile').value;
    var telefono = document.querySelector('#txtTelefonoProfile').value;
    var telefono = document.querySelector('#txtTelefonoProfile').value;
    var correo = document.querySelector('#txtCorreoProfile').value;

    if (nombre.length == 0 || apellidoPaterno.length == 0 || apellidoMaterno.length == 0 || tipoDocumento.length == 0
        || numeroDocumento.length == 0 || sexo.length == 0 || telefono.length == 0) {
        mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, sexo, telefono);
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios', 'warning');
    }

    if (!validarEmail(correo)) {
        return Swal.fire('Mensaje de advertencia', 'El formato de email es incorrecto', 'warning');
    }

    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=actualizarDatosProfile',
        type: 'POST',
        data: {
            id: id,
            nombre: nombre,
            apellidoPaterno: apellidoPaterno,
            apellidoMaterno: apellidoMaterno,
            tipoDocumento: tipoDocumento,
            numeroDocumento: numeroDocumento,
            sexo: sexo,
            telefono: telefono,
            correo: correo
        }
    }).done(function (resp) {
        if (isNaN(resp)) {
            document.querySelector('#divErrorProfile').style.display = "block";
            document.querySelector('#divErrorProfile').innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + resp;

        } else {
            if (resp > 0) {
                document.querySelector('#divErrorProfile').style.display = "none";
                if (resp == 1) {
                    Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
                    obtenerDatosPerfil();
                } else {
                    Swal.fire('Mensaje de advertencia', 'El numero de documento ya se encuentra registrado en el sistema, esa persona ya esta registrada', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
}

function actualizarPassword() {
    if (!accesos.includes('18-7')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var id = document.querySelector('#txtIdUsuarioLogeado').value;
    var passwordActual = document.querySelector('#txtPasswordEncriptado').value;
    var passwordActualEscrita = document.querySelector('#txtPasswordActualEscrita').value;
    var passwordNuevo = document.querySelector('#txtPasswordNuevo').value;
    var passwordNuevoConf = document.querySelector('#txtPasswordNuevoConfirmacion').value;

    if (passwordActual.length == 0 || passwordNuevo.length == 0 || passwordNuevoConf.length == 0) {
        return Swal.fire('Mensaje de Advertencia', 'Todos los campos son obligatorios', 'warning');
    }
    if (passwordNuevo != passwordNuevoConf) {
        return Swal.fire('Mensaje de Advertencia', 'Las contraseñas no coinciden', 'warning');
    }

    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=actualizarPassword',
        type: 'POST',
        data: {
            id: id,
            passwordActual: passwordActual,
            passwordActualEscrita: passwordActualEscrita,
            passwordNuevo: passwordNuevo,
        }
    }).done(function (resp) {
        if (resp > 0) {
            if (resp == 1) {
                Swal.fire('Mensaje de confirmacion', 'Contraseña actualizada correctamente', 'success');
                obtenerDatosPerfil();
                document.querySelector('#formularioModificarPassword').reset();
            } else {
                Swal.fire('Mensaje de advertencia', 'La contraseña actual ingresada no coincide con la registrada en el sistema', 'warning');
            }
        } else {
            return Swal.fire('Mensaje de Advertencia', 'La actualizacion no se pudo completar', 'warning');
        }
    });
}

//DASHBOARD Y REPORTES
$('#txtFechaInicioDash, #txtFechaFinDash').change(function () {
    obtenerDatosWidgets();
});

function obtenerDatosWidgets() {
    let fechaInicio = $('#txtFechaInicioDash').val();
    let fechaFin = $('#txtFechaFinDash').val();
    if (fechaInicio > fechaFin) {
        return Swal.fire('Mensaje de advertencia', 'La fecha de inicio no debe superar la fecha fin', 'warning');
    }
    top10ProductosMasVendidos();
    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=obtenerDatosWidgets',
        type: 'POST',
        data: {
            fechaInicio: fechaInicio,
            fechaFin: fechaFin
        }
    }).done(function (resp) {
        let data = JSON.parse(resp);
        let cadena = "";
        if (data.length > 0) {
            cadena += `<div class="col-lg-3 col-6">
            <div class="small-box" id="caja1">
                <div class="inner">
                    <h4>L. ${parseFloat(data[0][0]).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')}</h4>

                    <b>Dinero total de ventas</b>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-6">
            <div class="small-box" id="caja2">
                <div class="inner">
                    <h4>L. ${parseFloat(data[0][1]).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')}</h4>

                    <b>Dinero total de ingresos</b>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-6">
            <div class="small-box" id="caja3">
                <div class="inner">
                    <h4>${data[0][2]}</h4>

                    <b>Ventas realizadas</b>
                </div>
                <div class="icon">
                    <i class="ion ion-person-add"></i>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-6">
            <div class="small-box" id="caja4">
                <div class="inner">
                    <h4>${data[0][3]}</h4>

                    <b>Ingresos realizados</b>
                </div>
                <div class="icon">
                    <i class="ion ion-pie-graph"></i>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-6">
            <div class="small-box" id="caja4">
                <div class="inner">
                    <h4>${data[0][4]}</h4>

                    <b>Cotizaciones realizados</b>
                </div>
                <div class="icon">
                    <i class="ion ion-pie-graph"></i>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-6">
            <div class="small-box" id="caja6">
                <div class="inner">
                    <h4>${data[0][5]}</h4>

                    <b>Productos existentes</b>
                </div>
                <div class="icon">
                    <i class="ion ion-pie-graph"></i>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-7">
            <div class="small-box" id="caja5">
                <div class="inner">
                    <h4>${data[0][6]}</h4>

                    <b>Servicios existentes</b>
                </div>
                <div class="icon">
                    <i class="ion ion-pie-graph"></i>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-6">
            <div class="small-box" id="caja8">
                <div class="inner">
                    <h4> ${data[0][7]}</h4>

                    <b>Productos/servicios en oferta</b>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-6">
            <div class="small-box" id="caja9">
                <div class="inner">
                    <h6 class="py-2">${data[0][8] == null ? `Ninguno` : data[0][8]}</h6>

                    <b>Persona con mas ventas</b>
                </div>
                <div class="icon">
                    <i class="ion in-stats-bars"></i>
                </div>
            </div>
        </div>
        
        <div class="col-lg-3 col-6">
            <div class="small-box" id="caja10">
                <div class="inner">
                    <h4>${data[0][9]}</h4>

                    <b>Movimientos realizados</b>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                </div>
            </div>
        </div>
        
        <div class="col-lg-3 col-6">
            <div class="small-box" id="caja11">
                <div class="inner">
                    <h4>${data[0][10]}</h4>

                    <b>Ajustes realizados</b>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                </div>
            </div>
        </div>
        

        `;
            $('#divWidget').html(cadena);
        }
    });
}

function generarNumero(numero) {
    return (Math.random() * numero).toFixed(0);
}

function colorRGB() {
    var color = "(" + generarNumero(255) + "," + generarNumero(255) + "," + generarNumero(255) + ")";
    return "rgb" + color;
}

var arregloReportes = [];
var chartVenta;
function top10ProductosMasVendidos() {
    let fechaInicio = $('#txtFechaInicioDash').val();
    let fechaFin = $('#txtFechaFinDash').val();

    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=productosMasVendidos',
        type: 'POST',
        data: {
            fechaInicio: fechaInicio,
            fechaFin: fechaFin
        }
    }).done(function (resp) {
        arregloReportes = JSON.parse(resp);
        top10ServiciosMasSolicitados(arregloReportes[1]);
        top10Ingreso(arregloReportes[2]);
        top10productoMenosVendidos(arregloReportes[3]);
        top10ProductosMenosIngresados(arregloReportes[4]);
        top10ServiciosMenosSolicitados(arregloReportes[5]);
        mesesMasVentas(arregloReportes[6]);

        let data = arregloReportes[0];
        let ejecutarGraficos = document.querySelector('.wrapper #contenido-principal  #ejecutarGraficos');

        if (!ejecutarGraficos) {
            return;
        }

        if (data.length > 0) {
            let producto = [];
            let cantidad = [];
            let color = [];

            for (let i = 0; i < data.length; i++) {
                producto = [...producto, data[i][0]];
                cantidad = [...cantidad, data[i][1]];
                color = [...color, colorRGB()];
            }
            var ctx = document.getElementById('canvasTop10Ventas').getContext('2d');
            if (chartVenta) {
                chartVenta.reset();
                chartVenta.destroy();
            }
            chartVenta = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: producto,
                    datasets: [{
                        label: 'Top 10 Productos más vendidos',
                        data: cantidad,
                        backgroundColor: color,
                        borderColor: color,
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        } else {
            var ctx = document.getElementById('canvasTop10Ventas').getContext('2d');
            if (chartVenta) {
                chartVenta.reset();
                chartVenta.destroy();
            }
            chartVenta = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['SIN RESULTADOS.'],
                    datasets: [{
                        label: 'Top 10 Productos más vendidos',
                        data: [0],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    });
}

var chartServicios;
function top10ServiciosMasSolicitados(data) {
    let ejecutarGraficos = document.querySelector('.wrapper #contenido-principal  #ejecutarGraficos')

    if (!ejecutarGraficos) {
        return;
    }

    if (data.length > 0) {
        let producto = [];
        let cantidad = [];
        let color = [];

        for (let i = 0; i < data.length; i++) {
            producto = [...producto, data[i][0]];
            cantidad = [...cantidad, data[i][1]];
            color = [...color, colorRGB()];
        }
        var ctx = document.getElementById('canvasTop10Servicios').getContext('2d');
        if (chartServicios) {
            chartServicios.reset();
            chartServicios.destroy();
        }
        chartServicios = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: producto,
                datasets: [{
                    label: 'Top 10 Servicios más solicitados',
                    data: cantidad,
                    backgroundColor: color,
                    borderColor: color,
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    } else {
        var ctx = document.getElementById('canvasTop10Servicios').getContext('2d');
        if (chartServicios) {
            chartServicios.reset();
            chartServicios.destroy();
        }
        chartServicios = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['SIN RESULTADOS.'],
                datasets: [{
                    label: 'Top 10 Servicios más solicitados',
                    data: [''],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

}

var chartIngreso;
function top10Ingreso(data) {
    let ejecutarGraficos = document.querySelector('.wrapper #contenido-principal  #ejecutarGraficos')

    if (!ejecutarGraficos) {
        return;
    }

    if (data.length > 0) {
        let producto = [];
        let cantidad = [];
        let color = [];

        for (let i = 0; i < data.length; i++) {
            producto = [...producto, data[i][0]];
            cantidad = [...cantidad, data[i][1]];
            color = [...color, colorRGB()];
        }
        var ctx = document.getElementById('canvasTop10Ingresos').getContext('2d');
        if (chartIngreso) {
            chartIngreso.reset();
            chartIngreso.destroy();
        }
        chartIngreso = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: producto,
                datasets: [{
                    label: 'Top 10 Productos más ingresados',
                    data: cantidad,
                    backgroundColor: color,
                    borderColor: color,
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    } else {
        var ctx = document.getElementById('canvasTop10Ingresos').getContext('2d');
        if (chartIngreso) {
            chartIngreso.reset();
            chartIngreso.destroy();
        }
        chartIngreso = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['SIN RESULTADOS.'],
                datasets: [{
                    label: 'Top 10 Productos más ingresados',
                    data: [0],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

}

var chartMenosVentas;
function top10productoMenosVendidos(data) {
    let ejecutarGraficos = document.querySelector('.wrapper #contenido-principal  #ejecutarGraficos')

    if (!ejecutarGraficos) {
        return;
    }

    if (data.length > 0) {
        let producto = [];
        let cantidad = [];
        let color = [];

        for (let i = 0; i < data.length; i++) {
            producto = [...producto, data[i][0]];
            cantidad = [...cantidad, data[i][1]];
            color = [...color, colorRGB()];
        }
        var ctx = document.getElementById('canvasTop10MenosVendidos').getContext('2d');
        if (chartMenosVentas) {
            chartMenosVentas.reset();
            chartMenosVentas.destroy();
        }
        chartMenosVentas = new Chart(ctx, {
            type: 'polarArea',
            data: {
                labels: producto,
                datasets: [{
                    data: cantidad,
                    backgroundColor: color,
                    borderColor: color,
                    borderWidth: 1
                }]
            },
            options: {}
        });
    } else {
        var ctx = document.getElementById('canvasTop10MenosVendidos').getContext('2d');
        if (chartMenosVentas) {
            chartMenosVentas.reset();
            chartMenosVentas.destroy();
        }
        chartMenosVentas = new Chart(ctx, {
            type: 'polarArea',
            data: {
                labels: ['SIN RESULTADOS.'],
                datasets: [{
                    label: 'Top 10 Productos menos vendidos',
                    data: [0],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {}

        });
    }
}

var chartMenosIngresados;
function top10ProductosMenosIngresados(data) {
    let ejecutarGraficos = document.querySelector('.wrapper #contenido-principal  #ejecutarGraficos')

    if (!ejecutarGraficos) {
        return;
    }

    if (data.length > 0) {
        let producto = [];
        let cantidad = [];
        let color = [];

        for (let i = 0; i < data.length; i++) {
            producto = [...producto, data[i][0]];
            cantidad = [...cantidad, data[i][1]];
            color = [...color, colorRGB()];
        }
        var ctx = document.getElementById('canvasTop10MenosIngresados').getContext('2d');
        if (chartMenosIngresados) {
            chartMenosIngresados.reset();
            chartMenosIngresados.destroy();
        }
        chartMenosIngresados = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: producto,
                datasets: [{
                    label: 'Top 10 Productos menos ingresados',
                    data: cantidad,
                    backgroundColor: color,
                    borderColor: color,
                    hoverOffset: 4
                }]
            },
            options: {}
        });
    } else {
        var ctx = document.getElementById('canvasTop10MenosIngresados').getContext('2d');
        if (chartMenosIngresados) {
            chartMenosIngresados.reset();
            chartMenosIngresados.destroy();
        }
        chartMenosIngresados = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['SIN RESULTADOS.'],
                datasets: [{
                    label: 'Top 10 Productos menos ingresados',
                    data: [0],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    hoverOffset: 4
                }]
            },
            options: {}

        });
    }

}

var chartServiciosMenos;
function top10ServiciosMenosSolicitados(data) {
    let ejecutarGraficos = document.querySelector('.wrapper #contenido-principal  #ejecutarGraficos')

    if (!ejecutarGraficos) {
        return;
    }

    if (data.length > 0) {
        let producto = [];
        let cantidad = [];
        let color = [];

        for (let i = 0; i < data.length; i++) {
            producto = [...producto, data[i][0]];
            cantidad = [...cantidad, data[i][1]];
            color = [...color, colorRGB()];
        }
        var ctx = document.getElementById('top10ServiciosMenosSolicitados').getContext('2d');
        if (chartServiciosMenos) {
            chartServiciosMenos.reset();
            chartServiciosMenos.destroy();
        }
        chartServiciosMenos = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: producto,
                datasets: [{
                    label: 'Top 10 Servicios menos solicitados',
                    data: cantidad,
                    backgroundColor: color,
                    borderColor: color,
                    hoverOffset: 4
                }]
            },
            options: {}
        });
    } else {
        var ctx = document.getElementById('top10ServiciosMenosSolicitados').getContext('2d');
        if (chartServiciosMenos) {
            chartServiciosMenos.reset();
            chartServiciosMenos.destroy();
        }
        chartServiciosMenos = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['SIN RESULTADOS.'],
                datasets: [{
                    label: 'Top 10 Servicios menos solicitados',
                    data: [0],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    hoverOffset: 4
                }]
            },
            options: {}
        });
    }

}

var chartMesesMasVentas;
function mesesMasVentas(data) {
    let ejecutarGraficos = document.querySelector('.wrapper #contenido-principal  #ejecutarGraficos')

    if (!ejecutarGraficos) {
        return;
    }

    if (data.length > 0) {
        let meses = [];
        let cantidad = [];

        for (let i = 0; i < data.length; i++) {
            meses = [...meses, data[i][0]];
            cantidad = [...cantidad, data[i][1]];
        }
        var ctx = document.getElementById('canvasMesesMasVentas').getContext('2d');
        if (chartMesesMasVentas) {
            chartMesesMasVentas.reset();
            chartMesesMasVentas.destroy();
        }
        chartMesesMasVentas = new Chart(ctx, {
            type: 'line',
            data: {
                labels: meses,
                datasets: [{
                    label: 'Meses con mas ventas',
                    data: cantidad,
                    borderColor: 'rgb(75, 192, 192)',
                    fill: false,
                    tension: 0.1
                }]
            },
            options: {}
        });
    } else {
        var ctx = document.getElementById('canvasMesesMasVentas').getContext('2d');
        if (chartMesesMasVentas) {
            chartMesesMasVentas.reset();
            chartMesesMasVentas.destroy();
        }
        chartMesesMasVentas = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['SIN RESULTADOS.'],
                datasets: [{
                    label: 'Meses con mas ventas',
                    data: [0],
                    borderColor: 'rgb(75, 192, 192)',
                    fill: false,
                    tension: 0.1
                }]
            },
            options: {}

        });
    }
}

//FUNCIONES BASICAS DE CONFIGURACION
function abrirModal() {
    if (!accesos.includes('18-1')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    $("#modal_registro").modal('show');
    limpiarModal("registrar");
}

function limpiarModal(tipoModal) {
    if (tipoModal == "registrar") {
        document.querySelector('#formularioRegistroUsuario').reset();
    } else {
        document.querySelector('#formularioEditarUsuario').reset();
    }
}

function validarEmail(email) {
    const er = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return er.test(email) ? true : false;
}

function mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, sexo, telefono) {
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

    document.querySelector("#divErrorProfile").style.display = "block";
    document.querySelector("#divErrorProfile").innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + cadena;
}


$('#btnGeneratePassword').click(function (e) {
    let username = $('#txtUsername').val();
    let email = $('#txtEmail').val();

    if (username == '') {
        return Swal.fire('Mensaje de advertencia', 'Debe ingresar su username.', 'warning');
    }
    if (email == '') {
        return Swal.fire('Mensaje de advertencia', 'Debe ingresar su correo electronico.', 'warning');
    }

    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=validateDataRecuperation',
        type: 'POST',
        data: {
            username: username.trim(),
            email: email.trim()
        }
    }).done(function (resp) {
        if (resp != "") {
            if (resp == 1) {
                Swal.fire('Enviado', 'El Password se envio a su correo electronico.', 'success');
            } else {
                Swal.fire('Mensaje de advertencia', 'Las credenciales proporcionadas son incorrectas, username y/o correo electronico no existen en el sistema.', 'warning');
            }
        } else {
            return Swal.fire('Mensaje de Advertencia', 'La verificacion no se pudo completar.', 'warning');
        }
    });

});

$('#btnSaveCredentials').click(function (e) {
    let userId = $('#txtIdUser').val();
    let passwordTemp = $('#txtPasswordTemporal').val();
    let passwordCurrent = $('#txtPasswordCurrent').val();
    let newPassword = $('#txtNuevoPassword').val();
    let confirmationNewPass = $('#txtConfirmacionPassword').val();

    if (passwordTemp.length == 0 || newPassword.length == 0 || confirmationNewPass.length == 0 || userId.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Debe llenar todos los campos, es obligatorio.', 'warning');
    }
    if (passwordCurrent != passwordTemp) {
        return Swal.fire('Mensaje de advertencia', 'El password temporal no coincide con el correcto.', 'warning');
    }

    if (newPassword == confirmationNewPass) {
        $.ajax({
            url: '../controlador/usuario/controlador_usuario.php?opcion=newCredentials',
            type: 'POST',
            data: {
                userId: userId.trim(),
                newPassword: newPassword,
                temporal: 0
            }
        }).done(function (resp) {
            if (resp == 1) {
                $('#frmCredentials')[0].reset();
                $('#cont__crendenciales').css('display', 'none');
                $('#cont__login').css('display', 'block');
                Swal.fire('Mensaje de Confimación', 'Credenciales actualizadas correctamente.', 'success');
            } else {
                Swal.fire('Mensaje de advertencia', 'Ocurrio un error inesperado al actualizar las crendeciales.', 'warning');
            }
        });
    } else {
        return Swal.fire('Mensaje de advertencia', 'El password nuevo no coincide con su confirmación.', 'warning');
    }
});