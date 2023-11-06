var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}

var tablaServicio;
function listarServicio() {
    tablaServicio = $("#tablaServicio").DataTable({
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
            "url": "../controlador/servicio/controlador_servicio.php?opcion=listar",
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "producto_nombre" },
            { "data": "producto_codigo" },
            { "data": "categoria_nombre" },
            { "data": "prod_serv_tipo" },
            { "data": "producto_precioventa" },
            {
                "data": "producto_foto",
                render: function (data) {
                    return `<img src="../${data}" width="40px" class="img-circle m-r-10">`;
                }
            },
            {
                "data": "producto_oferta",
                render: function (data) {
                    if (data == 0) {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>NO</span>";
                    } else {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>SI</span>";
                    }
                }
            },
            {
                "data": "producto_estatus",
                render: function (data) {
                    if (data === "ACTIVO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },
            { "defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;<button class='imprimir btn btn-primary' ><i class='fa fa-print'></i></button>&nbsp;<button class='btn btn-warning btnViewServices'><i class='fas fa-eye'></i></button>"+
            "&nbsp;<button class='oferta btn btn-primary'><i class='fas fa-bell'></i></button>" }
        ],

        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaServicio.on('draw.dt', function () {
        var PageInfo = $('#tablaServicio').DataTable().page.info();
        tablaServicio.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

function listarCategoriaCombo() {
    $.ajax({
        url: "../controlador/servicio/controlador_servicio.php?opcion=listarComboCategoria",
        type: "POST"
    }).done(function (resp) {
        let data = JSON.parse(resp);
        let cadena = "";
        if (data.length > 0) {
            for (let i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            document.querySelector('#cbmCategoria').innerHTML = cadena;
            document.querySelector('#cbmCategoriaEditar').innerHTML = cadena;
        } else {
            document.querySelector('#cbmCategoria').innerHTML = "No se encontraron datos";
            document.querySelector('#cbmCategoriaEditar').innerHTML = "No se encontraron datos";
        }
    });
}
function codigoGenerar() {
    $.ajax({
        url: "../controlador/producto/controlador_producto.php?opcion=generarCodigo",
        type: "POST"

    }).done(function (resp) {
        let data = JSON.parse(resp);
        //let cadena = "";
        if (data.length > 0) {
            document.querySelector('#txtcodigo').value = data[0][0];
        }

    });
}
$('#tablaServicio').on('click', '.imprimir', function () {
    var data = tablaServicio.row($(this).parents('tr')).data();
    
    if (tablaServicio.row(this).child.isShown()) {
        var data = tablaServicio.row(this).data();
    }
   
    window.open("../MPDF/reporte_historial_servicio.php?codigo=" + parseInt(data.producto_codigo)
        + "#zoom=100", "Reporte Historial Cambio Servicio", "scrollbards=NO"); 
});

$('#tablaServicio').on('click', '.editar', function () {
    if (!accesos.includes('19-2')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("editar");
    var data = tablaServicio.row($(this).parents('tr')).data(); 

    if (tablaServicio.row(this).child.isShown()) { 
        var data = tablaServicio.row(this).data();
    }
    $('title__services').html('EDITAR SERVICIO');
    $('#btnUpdateImage').prop('disabled', false);
    $('#btnUpdateServices').prop('disabled', false);
    $('#cont__img').css('display', 'none');
    loadDataServices(data);
});

$('#tablaServicio').on('click', '.btnViewServices', function () {
    if (!accesos.includes('19-3')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("editar");
    var data = tablaServicio.row($(this).parents('tr')).data(); 

    if (tablaServicio.row(this).child.isShown()) { 
        var data = tablaServicio.row(this).data();
    }
    $('title__services').html('EDITAR SERVICIO');
    $('#btnUpdateImage').prop('disabled', true);
    $('#btnUpdateServices').prop('disabled', true);
    $('#cont__img').css('display', 'block');
    loadDataServices(data);
});

function loadDataServices(data) {
    let {producto_id, producto_nombre, producto_precioventa, producto_descripcion, categoria_id, producto_estatus, producto_foto} = data;
    $("#modal_editar").modal('show');
    document.querySelector("#txtIdProducto").value = producto_id;
    document.querySelector("#txtServicioEditar").value = producto_nombre;
    document.querySelector("#txtPrecioEditar").value = producto_precioventa;
    document.querySelector("#txtDescripcionEditar").value = producto_descripcion;
    $("#cbmCategoriaEditar").val(categoria_id).trigger("change");
    $("#cbmEstatus").val(producto_estatus).trigger("change");
    $('.img__product').attr('src', '../'+producto_foto);
}

$('#tablaServicio').on('click', '.oferta', function () {
    if (!accesos.includes('19-4')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("oferta");
    var data = tablaServicio.row($(this).parents('tr')).data(); 

    if (tablaServicio.row(this).child.isShown()) { 
        var data = tablaServicio.row(this).data();
    }

    if (data.producto_estatus == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'El producto esta inactivo, no se le puede agregar una oferta, debe activarlo', 'warning');
    }
 
    $("#modal_oferta").modal('show');
    $("#cbmOferta").val(data.producto_oferta == 0 ? "0" : "1").trigger("change");
    document.querySelector("#txtDescuento").value = data.producto_descuento;
    document.querySelector("#txtIdProductoOferta").value = data.producto_id;
    var oferta = document.querySelector("#cbmOferta").value;
    if (oferta == "0") {
        $("#divDescuento").hide();
    }
});

$("#cbmOferta").on('change', function () {
    var oferta = document.querySelector("#cbmOferta").value;

    if (oferta == "0") {
        $("#divDescuento").hide();
    } else {
        $("#divDescuento").show();
    }
})

function agregarOferta() {
    var oferta = document.querySelector("#cbmOferta").value;
    var descuento = document.querySelector("#txtDescuento").value;
    var idProducto = document.querySelector("#txtIdProductoOferta").value;

    if (parseFloat(descuento) >= 1) {
        return Swal.fire('Mensaje de advertencia', 'Ingrese un descuento menor a 1', 'warning');
    }

    if (oferta == "1") {
        if (descuento.length == 0 || descuento == "0.00" || descuento == "0" || descuento == "00.00") {
            return Swal.fire('Mensaje de advertencia', 'La oferta debe de llevar un descuento, ingreselo por favor', 'warning');
        }
    }

    $.ajax({
        url: '../controlador/servicio/controlador_servicio.php?opcion=oferta',
        type: 'POST',
        data: {
            oferta: oferta,
            descuento: descuento,
            idProducto: idProducto
        }
    }).done(function (resp) {
        if (resp == 1) {
            tablaServicio.ajax.reload();
            $("#modal_oferta").modal('hide');
            document.querySelector('#formularioOferta').reset();
            Swal.fire('Mensaje de confirmacion', 'Registrado Correctamente', 'success');
        } else {
            Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
        }
    });
}

function registrarServicio() {
    let servicio = document.querySelector("#txtServicio").value;
    let idCategoria = document.querySelector("#cbmCategoria").value;
    let precio = document.querySelector("#txtPrecio").value;
    let archivo = document.querySelector("#txtImagen").value;
    let descripcion = document.querySelector("#txtDescripcion").value;
    let tipo = 'SERVICIO';
    let codigo = document.querySelector("#txtcodigo").value;

    let f = new Date();
    let extension = archivo.split('.').pop();

    //Para que ninguna imagen se repita
    let nombreArchivo = "SER" + f.getDate() + "" + (f.getMonth() + 1) + "" + f.getFullYear() + "" + f.getHours() + "" + f.getMinutes() + "" + f.getSeconds() + "." + extension;

    let formData = new FormData();
    let foto = $("#txtImagen")[0].files[0];

    if (servicio.length == 0 || idCategoria.length == 0 || precio.length == 0) {

        mensajeError(servicio, idCategoria, precio, 'NADA', 'divError');
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios, favor de llenarlos', 'warning');
    }

    formData.append('servicio', servicio);
    formData.append('idCategoria', idCategoria);
    formData.append('foto', foto);
    formData.append('precio', precio);
    formData.append('nombreArchivo', nombreArchivo);
    formData.append('descripcion', descripcion);
    formData.append('tipo', tipo);
    formData.append('codigo', codigo);

    $.ajax({
        url: '../controlador/servicio/controlador_servicio.php?opcion=registrar',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            if (respuesta != 0) {
                if (respuesta == 1) {
                    tablaServicio.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
                    $("#modal_registro").modal('hide'); //Desaparecer la ventana modal
                    document.querySelector('#formularioRegistrarServicio').reset(); //Limpiamos todos los inputs

                    Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente.', 'success');
                } else if (respuesta == 3) {
                    Swal.fire('Mensaje de advertencia', 'El codigo ingresado ya pertenece a un servicio.', 'warning');
                } else {
                    Swal.fire('Mensaje de advertencia', 'El servicio ya se encuentra ingresado en la base de datos.', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
    return false;
}

function editarServicio() {
    let idProducto = document.querySelector("#txtIdProducto").value;
    let servicio = document.querySelector("#txtServicioEditar").value;
    let idCategoria = document.querySelector("#cbmCategoriaEditar").value;
    let precio = document.querySelector('#txtPrecioEditar').value;
    let estatus = document.querySelector('#cbmEstatus').value;;
    let descripcion = document.querySelector('#txtDescripcionEditar').value;


    if (idProducto.lenth == 0 || servicio.length == 0 || idCategoria.length == 0 || precio.length == 0 || estatus.length == 0) {
        mensajeError(servicio, idCategoria, precio, estatus, 'divErrorEditar');
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios, favor de llenarlos', 'warning');
    }

    $.ajax({
        url: '../controlador/servicio/controlador_servicio.php?opcion=editar',
        type: 'POST',
        data: {
            idProducto: idProducto,
            servicio: servicio,
            idCategoria: idCategoria,
            precio: precio,
            estatus: estatus,
            descripcion: descripcion,
        }
    }).done(function (resp) {
        if (isNaN(resp)) {
            document.querySelector('#divErrorEditar').style.display = "block";
            document.querySelector('#divErrorEditar').innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + resp;
        } else {
            if (resp > 0) {
                document.querySelector('#divErrorEditar').style.display = "none";
                if (resp == 1) {
                    tablaServicio.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
                    $("#modal_editar").modal('hide'); //Desaparecer la ventana modal
                    document.querySelector('#formularioEditarServicio').reset();
                    Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
                } else {
                    Swal.fire('Mensaje de advertencia', 'El Servicio ya se encuentra ingresado en la base de datos', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
            }
        }
    });
}

function editarFotoServicio() {
    let idProducto = document.querySelector("#txtIdProducto").value;
    let archivo = document.querySelector("#txtImagenEditar").value;

    let f = new Date();
    let extension = archivo.split('.').pop();

    //Para que ninguna imagen se repita
    let nombreArchivo = "SER" + f.getDate() + "" + (f.getMonth() + 1) + "" + f.getFullYear() + "" + f.getHours() + "" + f.getMinutes() + "" + f.getSeconds() + "." + extension;
    let formData = new FormData();
    let foto = $("#txtImagenEditar")[0].files[0];

    if (archivo.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Debes seleccionar una imagen', 'warning');
    }

    formData.append('id', idProducto);;
    formData.append('foto', foto);
    formData.append('nombreArchivo', nombreArchivo);
    $.ajax({
        url: '../controlador/servicio/controlador_servicio.php?opcion=editarFoto',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            if (respuesta != 0) {
                if (respuesta == 1) {
                    tablaServicio.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
                    $("#modal_editar").modal('hide'); //Desaparecer la ventana modal

                    Swal.fire('Mensaje de confirmacion', 'Foto actualizada correctamente', 'success');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
    return false;
}

function abrirModal() {
    if (!accesos.includes('19-1')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    $("#modal_registro").modal('show');
    limpiarModal("registrar");
    codigoGenerar();
}
//producto, idCategoria, idUnidadMedida, precio, precioCompra, idFabricante, stockMinimo,codigo,  'NADA', 'divError'
function mensajeError(producto, idCategoria, precio, estatus, div) {
    let cadena = "";
    if (producto.length === 0 || producto.value == "") {
        cadena += "El campo servicio no debe estar vacio. <br>";
    }
    if (idCategoria.length === 0) {
        cadena += "Seleccione una opcion de id categoria. <br>";
    }
    if (precio.length === 0) {
        cadena += "El campo precio  no debe estar vacio. <br>";
    }
    if (div == 'divErrorEditar') {
        if (estatus.length === 0) {
            cadena += "Seleccione una opcion de estatus. <br>";
        }
    }

    document.querySelector("#" + div).style.display = "block";
    document.querySelector("#" + div).innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + cadena;
}

function limpiarModal(tipoModal) {
    if (tipoModal == "registrar") {
        const divError = document.querySelector('#divError');
        document.querySelector('#formularioRegistrarServicio').reset();

        while (divError.firstChild) {
            divError.removeChild(divError.firstChild);
        }
        divError.style.display = "none";
    } else {
        const divErrorE = document.querySelector('#divErrorEditar');
        document.querySelector('#formularioEditarServicio').reset();

        while (divErrorE.firstChild) {
            divErrorE.removeChild(divErrorE.firstChild);
        }
        divErrorE.style.display = "none";
    }
}