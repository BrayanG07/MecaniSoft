//Ejemplo con vehiculos
//Copiar en cada archivo js
var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}

//Copiar en los archivos de las vistas
//<?php
//     session_start();

//     echo "<script> var accesos = [];</script>";

//     foreach ($_SESSION['S_ACCESOS'] as $ac) {

//         echo "<script>  accesos.push('".$ac."')</script>";
//     }
// ?>

//Copiar abajo de los listar en las vistar
// setiarAccesos(accesos);

//Copiar en las acciones poniedo el codigo del modulo creado
// if(accesos.includes('2-3')){

//   }else{
//        Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
//   }

var tablaAccesosUsuario;
function listarAccesoUsuario(idUsuario) {
    tablaAccesosUsuario = $("#tablaAccesosUsuario").DataTable({
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
            "url": "../controlador/acceso/controlador_acceso.php?opcion=listarAccesosUsuario",
            "data": { 'idUsuario': idUsuario },
            // "data":{'idUsuario':document.querySelector("txtIdUsuario").value},
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "modulo_nombre" },
            { "data": "modulo_descripcion" },
            {
                "data": "acceso_estado",
                render: function (data) {
                    if (data === "ACTIVO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },
            {
                "defaultContent": "<button class='editar btn btn-primary'><i class='fas fa-adjust'></i></button>&nbsp;<button class='eliminar btn btn-danger'><i class='fa fa-times-circle'></i></button>"
            }
        ],

        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            // if ( aData['acceso_estado']=='ACTIVO' )//Sombrear algo en especifico de acuerdo a la columna
            // 		{
            // 			$('td', nRow).css('background-color', '#96981C');//Color del Fondo
            // 			$('td', nRow).css('color', 'black');//Color de Letras

            // 		}
            //         // console.log(aData)
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaAccesosUsuario.on('draw.dt', function () {
        var PageInfo = $('#tablaAccesosUsuario').DataTable().page.info();
        tablaAccesosUsuario.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

$('#tablaAccesosUsuario').on('click', '.eliminar', function () {

    if (accesos.includes('2-3')) {

        var data = tablaAccesosUsuario.row($(this).parents('tr')).data();

        if (tablaUsuario.row(this).child.isShown()) {
            var data = tablaAccesosUsuario.row(this).data();
        }


        Swal.fire({
            title: '¿ Esta seguro(a) de quitar este acceso al usuario ?',
            text: "",
            icon: 'warning',
            showCancelButton: true,
            cancelButtonText: 'Cancelar',
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Eliminalo!'
        }).then((result) => {
            if (result.isConfirmed) {
                let usuarioLog = document.querySelector('#idUsuarioLog').value

                eliminarAcceso(data.usuario_id, data.modulo_codigo, usuarioLog)
            }
        })
    } else {
        Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
});

$('#tablaAccesosUsuario').on('click', '.editar', function () {
    var data = tablaAccesosUsuario.row($(this).parents('tr')).data();

    if (tablaUsuario.row(this).child.isShown()) {
        var data = tablaAccesosUsuario.row(this).data();
    }

    if (accesos.includes('2-2')) {
        Swal.fire({
            title: '¿ Esta seguro(a) de cambiar el estado de este acceso ?',
            text: "",
            icon: 'warning',
            showCancelButton: true,
            cancelButtonText: 'Cancelar',
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Cambialo!'
        }).then((result) => {
            if (result.isConfirmed) {

                let usuarioLog = document.querySelector('#idUsuarioLog').value

                editarAcceso(data.usuario_id, data.modulo_codigo, usuarioLog)
            }
        })
    } else {
        Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
});

var tablaAccesos;
function listarAccesoUsuarioNoTiene(idUsuario) {
    tablaAccesos = $("#tablaAccesos").DataTable({
        "ordering": true,
        "paging": false,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controlador/acceso/controlador_acceso.php?opcion=listarAccesosUsuarioNoTiene",
            "data": { 'idUsuario': idUsuario },
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "modulo_nombre" },
            {
                "data": "modulo_codigo",
                render: function (data) {
                    return "<input type='checkbox' value='" + data + "' id='txtValor" + data + "'>"
                }
            },
            { "data": "modulo_descripcion" },
            {
                "data": "modulo_estado",
                render: function (data) {
                    if (data === "ACTIVO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            }
        ],

        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[2]).css('text-align', 'center');
            $($(nRow).find("td")[4]).css('text-align', 'center');
        }
    });
    tablaAccesos.on('draw.dt', function () {
        var PageInfo = $('#tablaAccesos').DataTable().page.info();
        tablaAccesos.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

$('#btnGuardarAccesos').click(function (e) {
    if (accesos.includes('2-1')) {
        tablaAccesos.search("").draw();
        let accesos = valoresCheck().toString();
        let usuario = document.querySelector('#txtIdUsuario').value;
        let usuarioLog = document.querySelector('#idUsuarioLog').value;

        if (accesos.length != 0) {
            registrarAcceso(usuario, accesos, usuarioLog);    
        } else {
           return Swal.fire('Mensaje de advertencia', 'Debes marcar al menos un acceso para poder guardar.', 'warning');            
        }       
    } else {
        Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
});

function valoresCheck() {
    let valoresCheck = [];
    $("#tablaAccesos input[type=checkbox]:checked").each(function (index) {
        valoresCheck = [...valoresCheck, this.value];
    });
    return valoresCheck;
}

//COIGO PARA OBTENER LOS DATOS DE LA TABLA Y PONERLOS EN LOS INPUTS
function selectComboModelEdit() {
    //  alert(document.querySelector("#idModel").value)
    $("#cbmModeloEditar").val(document.querySelector("#idModel").value).trigger("change");
}

function registrarAcceso(idUsuario, idModulo, usuarioLog) {
    let formData = new FormData();
    formData.append('idUsuario', idUsuario);
    formData.append('idModulo', idModulo);
    formData.append('usuarioLog', usuarioLog);

    $.ajax({
        url: '../controlador/acceso/controlador_acceso.php?opcion=registrar',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            if (respuesta != 0) {
                if (respuesta == 1) {
                    tablaAccesosUsuario.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
                    $("#modal_registro").modal('hide'); //Desaparecer la ventana modal

                    Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
                } else {
                    Swal.fire('Mensaje de advertencia', 'No se pudo añadir el acceso', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
    return false;
}

function eliminarAcceso(idUsuario, idModulo, usuarioLog) {
    let formData = new FormData();
    formData.append('idUsuario', idUsuario);
    formData.append('idModulo', idModulo);
    formData.append('usuarioLog', usuarioLog);

    $.ajax({
        url: '../controlador/acceso/controlador_acceso.php?opcion=eliminar',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            // alert(respuesta)

            if (respuesta != 0) {
                if (respuesta == 1) {
                    tablaAccesosUsuario.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador

                    Swal.fire('Mensaje de confirmacion', 'Acceso eliminado correctamente', 'success');
                } else {
                    // Swal.fire('Mensaje de advertencia', 'No se pudo añadir el acceso', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
    return false;
}

function editarAcceso(idUsuario, idModulo, usuarioLog) {

    let formData = new FormData();
    formData.append('idUsuario', idUsuario);
    formData.append('idModulo', idModulo);
    formData.append('usuarioLog', usuarioLog);

    $.ajax({
        url: '../controlador/acceso/controlador_acceso.php?opcion=editar',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            // alert(respuesta)

            if (respuesta != 0) {
                if (respuesta == 1) {
                    tablaAccesosUsuario.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador

                    Swal.fire('Mensaje de confirmacion', 'Acceso editado correctamente', 'success');
                } else {
                    // Swal.fire('Mensaje de advertencia', 'No se pudo añadir el acceso', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });





    return false;
}

//ESTO QUEDA NORMAL
function abrirModal() {

    let idUsuario = document.querySelector('#txtIdUsuario').value;
    if (idUsuario.length == 0) Swal.fire('Mensaje de advertencia', 'Selecciona un usuario', 'warning');
    else {

        listarAccesoUsuarioNoTiene(idUsuario);
        $("#modal_registro").modal('show');
    }
}

//ESTO QUEDA NORMAL
function abrirModalSelecUsuario() {
    $("#modal_seleccionar_usuario").modal({ backdrop: 'static', keyboard: false }); //Para que no se cierre el modal
    $("#modal_seleccionar_usuario").modal('show');
}

//ESTO QUEDA NORMAL
function limpiarModal(tipoModal) {
    if (tipoModal == "registrar") {
        const divError = document.querySelector('#divError');
        document.querySelector('#formularioRegistrarVehiculo').reset();

        while (divError.firstChild) {
            divError.removeChild(divError.firstChild);
        }
        divError.style.display = "none";
    } else {
        const divErrorE = document.querySelector('#divErrorEditar');
        document.querySelector('#formularioEditarVehiculo').reset();

        while (divErrorE.firstChild) {
            divErrorE.removeChild(divErrorE.firstChild);
        }
        divErrorE.style.display = "none";
    }
}

//ESTO QUEDA NORMAL
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
            { "data": "rol_nombre" },
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
            { "defaultContent": "<button class='btn btn-primary' id='btnSeleccionar'><i class='fa fa-check'></i></button>" }

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



    // console.log(accesos);
}

$('#tablaUsuario').on('click', '#btnSeleccionar', function () {
    var data = tablaUsuario.row($(this).parents('tr')).data();

    if (tablaUsuario.row(this).child.isShown()) {
        var data = tablaUsuario.row(this).data();
    }

    if (data.usuario_estatus == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'Debe seleccionar un usuario que este activo', 'warning');
    }

    document.querySelector("#txtNombreUsuario").value = data.NOMBRE_PERSONA;
    document.querySelector("#txtIdUsuario").value = data.usuario_id;

    listarAccesoUsuario(data.usuario_id);
    $("#modal_seleccionar_usuario").modal('hide');
});
