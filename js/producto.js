var accesos;
function setiarAccesos(acc){
    accesos = acc;
}

var tablaProducto;
function listarProducto() {
    tablaProducto = $("#tablaProducto").DataTable({
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
            "url": "../controlador/producto/controlador_producto.php?opcion=listar",
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "producto_nombre" },
            { "data": "producto_codigo" },
            { "data": "categoria_nombre" },
            { "data": "fabricante_nombre" },
            { "data": "unidad_nombre" },
            { "data": "producto_stock" },
            // { "data": "prod_serv_tipo" },
            { "data": "producto_preciocompra" },
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
            { "defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;<button class='imprimir btn btn-primary' ><i class='fa fa-print'></i></button>&nbsp;<button class='btn btn-warning' id='btnViewProduct'><i class='fas fa-eye'></i></button>&nbsp;<button class='oferta btn btn-info'><i class='fas fa-bell'></i></button>" }
        ],
        
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaProducto.on('draw.dt', function () {
        var PageInfo = $('#tablaProducto').DataTable().page.info();
        tablaProducto.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

function listarCategoriaCombo() {
    $.ajax({
        url: "../controlador/producto/controlador_producto.php?opcion=listarComboCategoria",
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

function listarFabricanteCombo() {
    $.ajax({
        url: "../controlador/producto/controlador_producto.php?opcion=listarComboFabricante",
        type: "POST"
    }).done(function (resp) {
        let data = JSON.parse(resp);
        let cadena = "";
        if (data.length > 0) {
            for (let i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            document.querySelector('#cbmFabricante').innerHTML = cadena;
            document.querySelector('#cbmFabricanteEditar').innerHTML = cadena;
        } else {
            document.querySelector('#cbmFabricante').innerHTML = "No se encontraron datos";
            document.querySelector('#cbmFabricanteEditar').innerHTML = "No se encontraron datos";
        }
    });
}

function listarUnidadMedidaCombo() {
    $.ajax({
        url: "../controlador/producto/controlador_producto.php?opcion=listarUnidadCombo",
        type: "POST"
    }).done(function (resp) {
        let data = JSON.parse(resp);
        let cadena = "";
        if (data.length > 0) {
            for (let i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            document.querySelector('#cbmUnidad').innerHTML = cadena;
            document.querySelector('#cbmUnidadEditar').innerHTML = cadena;
        } else {
            document.querySelector('#cbmUnidad').innerHTML = "No se encontraron datos";
            document.querySelector('#cbmUnidadEditar').innerHTML = "No se encontraron datos";
        }
    });
}

$('#tablaProducto').on('click', '.imprimir', function () {
    var data = tablaProducto.row($(this).parents('tr')).data();
    
    if (tablaProducto.row(this).child.isShown()) {
        var data = tablaProducto.row(this).data();
    }
   
    window.open("../MPDF/reporte_historial_producto.php?codigo=" + parseInt(data.producto_codigo)
        + "#zoom=100", "Reporte Historial Cambio Producto", "scrollbards=NO"); 
});

//COIGO PARA OBTENER LOS DATOS DE LA TABLA Y PONERLOS EN LOS INPUTS
$('#tablaProducto').on('click', '.editar', function () {
    if (!accesos.includes('5-2')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }

    limpiarModal("editar");
    var data = tablaProducto.row($(this).parents('tr')).data(); 

    if (tablaProducto.row(this).child.isShown()) { 
        var data = tablaProducto.row(this).data();
    }
    $(".title__modal").html("Editar Producto");
    $("#btnActualizarProd").prop('disabled', false);
    $("#btnUpdateImage").prop('disabled', false);
    $("#cont__img").css('display', 'none');
    loadData(data);
    
});

$('#tablaProducto').on('click', '#btnViewProduct', function () {
    if (!accesos.includes('5-3')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("editar");
    var data = tablaProducto.row($(this).parents('tr')).data(); 
    if (tablaProducto.row(this).child.isShown()) { 
        var data = tablaProducto.row(this).data();
    }

    $(".title__modal").html("Vista Producto");
    $("#btnActualizarProd").prop('disabled', true);
    $("#btnUpdateImage").prop('disabled', true);
    loadData(data, 'OK');
});

function loadData(data, imagen = ''){
    let {producto_id, producto_nombre, producto_precioventa, producto_descripcion, producto_preciocompra, producto_stock_minimo, categoria_id, unidad_id, id_fabricante, producto_estatus, codigo, producto_foto} = data;
    $("#modal_editar").modal('show');
    document.querySelector("#txtIdProducto").value = producto_id;
    document.querySelector("#txtProductoEditar").value = producto_nombre;
    document.querySelector("#txtPrecioEditar").value = producto_precioventa;
    document.querySelector("#txtDescripcionEditar").value = producto_descripcion;
    document.querySelector("#txtPrecioCompraEditar").value = producto_preciocompra;
    document.querySelector("#txtStockMinimoEditar").value = producto_stock_minimo;
    
    //Setear la data A LOS OPTIONS
    $("#cbmCategoriaEditar").val(categoria_id).trigger("change");
    $("#cbmUnidadEditar").val(unidad_id).trigger("change");
    $("#cbmFabricanteEditar").val(id_fabricante).trigger("change");
    $("#cbmEstatus").val(producto_estatus).trigger("change");
    $("#txtCodigoEditar").val(codigo).trigger("change");

    if (imagen == 'OK') {
        $(".img__product").attr("src", "../"+producto_foto);
        $("#cont__img").css('display', 'block');
    }
}

$('#tablaProducto').on('click', '.oferta', function () {
    if (!accesos.includes('5-4')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("oferta");
    var data = tablaProducto.row($(this).parents('tr')).data(); 

    if (tablaProducto.row(this).child.isShown()) { 
        var data = tablaProducto.row(this).data();
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
    }else {
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
        url: '../controlador/producto/controlador_producto.php?opcion=oferta',
        type: 'POST',
        data: {
            oferta: oferta,
            descuento: descuento,
            idProducto: idProducto
        }
    }).done(function (resp) {
        if (resp == 1) {
            tablaProducto.ajax.reload();
            $("#modal_oferta").modal('hide'); 
            document.querySelector('#formularioOferta').reset();
            Swal.fire('Mensaje de confirmacion', 'Registrado Correctamente', 'success');
        } else {
            Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
        }
    });
}

function registrarProducto() {
    let producto = document.querySelector("#txtProducto").value;
    let stockMinimo = document.querySelector("#txtStockMinimo").value;
    let idCategoria = document.querySelector("#cbmCategoria").value;
    let idFabricante = document.querySelector("#cbmFabricante").value;
    let idUnidadMedida = document.querySelector("#cbmUnidad").value;
    let precioCompra = document.querySelector("#txtPrecioCompra").value;
    let precio = document.querySelector("#txtPrecio").value;
    let archivo = document.querySelector("#txtImagen").value;
    let descripcion = document.querySelector("#txtDescripcion").value;
    let tipo = 'PRODUCTO';
    let codigo = document.querySelector("#txtcodigo").value;
    let extension = null;
    let nombreArchivo = null;
    let foto = null;

    if (parseFloat(precio) < parseFloat(precioCompra)) {
        return Swal.fire('Mensaje de advertencia', 'El precio de venta es menor al precio de compra', 'warning');
    }

    if (archivo.length > 0) {
        let f = new Date();
        extension = archivo.split('.').pop();

        //Para que ninguna imagen se repita
        nombreArchivo = "PRO" + f.getDate() + "" + (f.getMonth() + 1) + "" + f.getFullYear() + "" + f.getHours() + "" + f.getMinutes() + "" + f.getSeconds() + "." + extension;
        foto = $("#txtImagen")[0].files[0];
    }
    let formData = new FormData();
    

    if (producto.length == 0 || idCategoria.length == 0 || idUnidadMedida.length == 0 || precio.length == 0
        || idFabricante.length ==0 || precioCompra.length == 0 || stockMinimo.length == 0 ) {
            
        mensajeError(producto, idCategoria, idUnidadMedida, precio, precioCompra, idFabricante, stockMinimo,codigo,  'NADA', 'divError');
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios, favor de llenarlos', 'warning');
    }

    formData.append('producto', producto);
    formData.append('stockMinimo', stockMinimo);
    formData.append('idCategoria', idCategoria);
    formData.append('idFabricante', idFabricante);
    formData.append('idUnidadMedida', idUnidadMedida);
    formData.append('foto', foto);
    formData.append('precioCompra', precioCompra);
    formData.append('precio', precio);
    formData.append('nombreArchivo', nombreArchivo);
    formData.append('descripcion', descripcion);
    formData.append('tipo', tipo);
    formData.append('codigo',codigo);  
    

    $.ajax({
        url: '../controlador/producto/controlador_producto.php?opcion=registrar',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            if (respuesta != 0) {
                if (respuesta == 1) {
                    tablaProducto.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
                    $("#modal_registro").modal('hide'); //Desaparecer la ventana modal
                    document.querySelector('#formularioRegistrarProducto').reset(); //Limpiamos todos los inputs

                    Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
                } else if(respuesta == 3) {
                    Swal.fire('Mensaje de advertencia', 'El codigo ingresado ya pertenece a un producto', 'warning');
                } else {
                    Swal.fire('Mensaje de advertencia', 'El producto ya se encuentra ingresado en la base de datos', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
    return false;
}

function editarProducto() {
    let idProducto = document.querySelector("#txtIdProducto").value;
    let producto = document.querySelector("#txtProductoEditar").value;
    let idCategoria = document.querySelector("#cbmCategoriaEditar").value;
    let idUnidad = document.querySelector('#cbmUnidadEditar').value;
    let precio = document.querySelector('#txtPrecioEditar').value;
    let estatus = document.querySelector('#cbmEstatus').value;;
    let descripcion = document.querySelector('#txtDescripcionEditar').value;
    let precioCompra = document.querySelector('#txtPrecioCompraEditar').value;
    let stockMinimo = document.querySelector('#txtStockMinimoEditar').value;
    let idFabricante = document.querySelector('#cbmFabricanteEditar').value;

    if (idProducto.lenth == 0 || producto.length == 0 || idCategoria.length == 0 || idUnidad.length == 0
        || precio.length == 0 || estatus.length == 0 || idFabricante.length ==0 || precioCompra.length == 0 || stockMinimo.length == 0) {

        mensajeError(producto, idCategoria, idUnidad, precio, precioCompra, idFabricante, stockMinimo, "", estatus, 'divErrorEditar');
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios, favor de llenarlos', 'warning');
    }

    if (parseFloat(precio) < parseFloat(precioCompra)) {
        return Swal.fire('Mensaje de advertencia', 'El precio de venta es menor al precio de compra', 'warning');
    }

    $.ajax({
        url: '../controlador/producto/controlador_producto.php?opcion=editar',
        type: 'POST',
        data: {
            idProducto: idProducto,
            producto: producto,
            idCategoria: idCategoria,
            idUnidad: idUnidad,
            precio: precio,
            estatus: estatus,
            descripcion: descripcion,
            precioCompra: precioCompra,
            stockMinimo: stockMinimo,
            idFabricante: idFabricante
        }
    }).done(function (resp) {
        if (isNaN(resp)) {
            document.querySelector('#divErrorEditar').style.display = "block";
            document.querySelector('#divErrorEditar').innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + resp;
        } else {
            if (resp > 0) {
                document.querySelector('#divErrorEditar').style.display = "none";
                if (resp == 1) {
                    tablaProducto.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
                    $("#modal_editar").modal('hide'); //Desaparecer la ventana modal
                    document.querySelector('#formularioEditarProducto').reset();
                    Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
                } else {
                    Swal.fire('Mensaje de advertencia', 'El producto ya se encuentra ingresado en la base de datos', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
            }
        }
    });
}

function editarFotoProducto() {
    let idProducto = document.querySelector("#txtIdProducto").value;
    let archivo = document.querySelector("#txtImagenEditar").value;

    let f = new Date();
    let extension = archivo.split('.').pop();

    //Para que ninguna imagen se repita
    let nombreArchivo = "PRO" + f.getDate() + "" + (f.getMonth() + 1) + "" + f.getFullYear() + "" + f.getHours() + "" + f.getMinutes() + "" + f.getSeconds() + "." + extension;
    let formData = new FormData();
    let foto = $("#txtImagenEditar")[0].files[0];

    if (archivo.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Debes seleccionar una imagen', 'warning');
    }

    formData.append('id', idProducto);;
    formData.append('foto', foto);
    formData.append('nombreArchivo', nombreArchivo);
    $.ajax({
        url: '../controlador/producto/controlador_producto.php?opcion=editarFoto',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            if (respuesta != 0) {
                if (respuesta == 1) {
                    tablaProducto.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
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
    if (!accesos.includes('5-1')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    $("#modal_registro").modal('show');
    limpiarModal("registrar");
    codigoGenerar();
}
//producto, idCategoria, idUnidadMedida, precio, precioCompra, idFabricante, stockMinimo,codigo,  'NADA', 'divError'
function mensajeError(producto, idCategoria, idUnidadMedida, precio, precioCompra, idFabricante, stockMinimo,codigo, estatus, div) {
    let cadena = "";
    if (producto.length === 0) {
        cadena += "El campo producto no debe estar vacio. <br>";
    }
    if (idCategoria.length === 0) {
        cadena += "Seleccione una opcion de id categoria. <br>";
    }
    if (idUnidadMedida.length === 0) {
        cadena += "Seleccione una opcion de unidad de medida. <br>";
    }
    if (precio.length === 0) {
        cadena += "El campo precio venta no debe estar vacio. <br>";
    }
    if (precioCompra.length === 0) {
        cadena += "El campo precio compra no debe estar vacio. <br>";
    }
    if (idFabricante.length === 0) {
        cadena += "El campo fabricante no debe estar vacio. <br>";
    }
    if (stockMinimo.length === 0) {
        cadena += "El campo stock minimo no debe estar vacio. <br>";
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
        document.querySelector('#formularioRegistrarProducto').reset();

        while (divError.firstChild) {
            divError.removeChild(divError.firstChild);
        }
        divError.style.display = "none";
    }else {
        const divErrorE = document.querySelector('#divErrorEditar');
        document.querySelector('#formularioEditarProducto').reset();

        while (divErrorE.firstChild) {
            divErrorE.removeChild(divErrorE.firstChild);
        }
        divErrorE.style.display = "none";
    }
}

$('#btnBarcodes').click(function (e) { 
    window.open("../MPDF/bardcode_productos.php#zoom=100", "Codigos de Barras", "scrollbards=NO"); 
});