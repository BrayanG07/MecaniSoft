var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}

$('#btnAgregarIngreso').click(function (e) { 
    if (!accesos.includes('10-2')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    $("#contenido-principal").load('../vista/ingreso/vista_ingreso_registro.php');
});

var tablaIngreso;
function listarIngreso() {
    var fechaInicio = document.querySelector('#txtFechaInicio').value;
    var fechaFin = document.querySelector('#txtFechaFin').value;
    var filtro = document.querySelector('#cboFiltro').value;

    tablaIngreso = $("#tablaIngreso").DataTable({
        dom: 'lftiprB',
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
            "url": "../controlador/ingreso/controlador_ingreso.php?opcion=listar",
            data: {
                fechaInicio: fechaInicio,
                fechaFin: fechaFin,
                filtro: filtro
            }
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "usuario_nombre" },
            { "data": "NOMBRE_PROVEEDOR" },
            { "data": "ingreso_tipcomprobante" },
            { "data": "ingreso_seriecomprobante" },
            { "data": "ingreso_numcomprobante" },
            { "data": "ingreso_fecha" },
            { "data": "ingreso_total" },
            { "data": "ingreso_impuesto" },
            {
                "data": "ingreso_estatus",
                render: function (data, type, row) {
                    if (data === "INGRESADO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else if (data == "AJUSTE") {
                        return "<span class='badge badge-warning badge-pill m-r-5 m-b-5 px-3'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },
            {
                "data": "ingreso_estatus",
                render: function (data) {
                    if (data == "INGRESADO" || data == "AJUSTE") {
                        return "<button class='imprimir btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;"
                            + "<button class='" + data + " btn btn-danger'><i class='fa fa-times-circle'></i></button>&nbsp; " +
                            "<button class='btn btn-warning btnViewIngreso'><i class='fa fa-eye'></i></button>";
                    } else {
                        return "<button class='imprimir btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;"
                            + "<button class='btn btn-danger disabled'><i class='fa fa-times-circle'></i></button>&nbsp; " +
                            "<button class='btn btn-warning btnViewIngreso'><i class='fa fa-eye'></i></button>";
                    }
                }

            }

        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[3]).css('text-align', 'center');
            $($(nRow).find("td")[4]).css('text-align', 'center');
            $($(nRow).find("td")[5]).css('text-align', 'center');
            $($(nRow).find("td")[8]).css('text-align', 'center');
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaIngreso.on('draw.dt', function () {
        var PageInfo = $('#tablaIngreso').DataTable().page.info();
        tablaIngreso.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

$('#txtFechaInicio, #txtFechaFin, #cboFiltro').change(function () {
    listarIngreso();
});

$('#tablaIngreso').on('click', '.imprimir', function () {
    if (!accesos.includes('10-3')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tablaIngreso.row($(this).parents('tr')).data();

    if (tablaIngreso.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tablaIngreso.row(this).data();
    }
    window.open("../MPDF/reporte_ingreso.php?codigo=" + parseInt(data.ingreso_id)
        + "#zoom=100", "Reporte Ingreso", "scrollbards=NO"); //'scrollbards=NO' Para que no deje editar la ruta
});

function redirect() {
    return new Promise((resolve) => {
        $("#contenido-principal").load('../vista/ingreso/vista_ingreso_registro.php');
        resolve('OK');
    });
}

function llenarInputs(data, classAjuste) {
    return new Promise((resolve) => {
        setTimeout(() => {
            let { NOMBRE_PROVEEDOR, ingreso_tipcomprobante, ingreso_seriecomprobante, ingreso_numcomprobante, porcentaje, ingreso_id, proveedor_razonsocial, ingreso_estatus, proveedor_id } = data;
            $('#txtProveedor').val(NOMBRE_PROVEEDOR + ' - ' + proveedor_razonsocial);
            $('#txtImpuesto').val((porcentaje * 100));

            $('#txtSerieComprobante').val(ingreso_seriecomprobante);
            $('#txtNumeroComprobante').val(ingreso_numcomprobante);
            $('#txtIdProveedor').val(proveedor_id);
            $('#txtAccion').val('AJUSTE');
            $('#btnGuardarIngreso').attr('data-idajuste', ingreso_id);

            if (classAjuste == 'AJUSTE') {
                $('#cbmTipoComprobante').val('FACTURA').trigger('change');
                $('#btnModalProveedor, #btnModalProducto').prop('disabled', true);
            } else {
                $('#cbmTipoComprobante').val(ingreso_tipcomprobante).trigger('change');
                $('#btnGuardarIngreso, #btnModalProveedor, #btnModalProducto').prop('disabled', true);
            }
            resolve(ingreso_id);
        }, 900);
    });
}

$('#tablaIngreso').on('click', '.btnViewIngreso, .AJUSTE', async function () {
    if (!accesos.includes('10-5')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tablaIngreso.row($(this).parents('tr')).data();
    if (tablaIngreso.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tablaIngreso.row(this).data();
    }
    let classAjuste = $(this).attr('class').split(' ')[0];
    try {
        let respuesta = await redirect();
        if (respuesta == 'OK') {
            let idIngreso = await llenarInputs(data, classAjuste);
            llenarTablaDetalleIngreso(idIngreso);
            setTimeout(() => {
                sumarTotalNeto();    
            }, 1500);     
            // await calcularTotales();
        }
    } catch (error) {
        console.log(error);
    }
});

// function calcularTotales() {
//     return new Promise(resolve => {
//         setTimeout(() => {
//             sumarTotalNeto();
//             resolve();
//         }, 1500);
//     });
// }

var tablaDetalleIngreso;
function llenarTablaDetalleIngreso(idIngreso) {
    tablaDetalleIngreso = $("#tablaDetalleIngreso").DataTable({
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controlador/ingreso/controlador_ingreso.php?opcion=listarDetalleIngreso",
            data: {
                idIngreso: idIngreso
            }
        },
        "columns": [
            { "data": "producto_id" },
            { "data": "producto_nombre" },
            { "data": "detalleingreso_precio" },
            { "data": "detalleingreso_cantidad" },
            { "data": "SUB_TOTAL" },
            { "defaultContent": "<button class='btn btn-danger' disabled><i class='fa fa-trash'></i></button>" }
        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[3]).css('text-align', 'center');
            $($(nRow).find("td")[4]).css('text-align', 'center');
            $($(nRow).find("td")[5]).css('text-align', 'center');
            $($(nRow).find("td")[8]).css('text-align', 'center');
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        }    
    });
}

$('#tablaIngreso').on('click', '.INGRESADO', function () {
    if (!accesos.includes('10-4')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tablaIngreso.row($(this).parents('tr')).data();

    if (tablaIngreso.row(this).child.isShown()) {
        var data = tablaIngreso.row(this).data();
    }

    Swal.fire({
        title: '¿Desea anular el ingreso?',
        text: "Esta seguro de anular el ingreso, no se podran reventir los cambios!",
        icon: 'success',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Anular Ingreso'
    }).then((result) => {
        if (result.value) {
            $.ajax({
                url: '../controlador/ingreso/controlador_ingreso.php?opcion=anular',
                type: 'POST',
                data: {
                    idIngreso: data.ingreso_id
                }
            }).done(function (resp) {
                if (resp > 0) {
                    Swal.fire('Mensaje de Confirmacíon', 'Ingreso anulado correctamente', 'success');
                    // tablaIngreso.ajax.reload();
                    construirConfirmacion();
                    $("#contenido-principal").load('../vista/ingreso/vista_mantenimiento_ingreso.php');

                } else {
                    Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
                }
            });
        }
    });

});

function ultimoSerieComprobante() {
    $.ajax({
        url: "../controlador/ingreso/controlador_ingreso.php?opcion=serieComprobante",
        type: "POST"
    }).done(function (resp) {
        if (resp != 0) {
            document.querySelector('#txtNumeroComprobante').value = resp.trim();
        } else {
            return Swal.fire('Mensaje de advertencia', 'Ocurrio un error al obtener el serie comprobante de la base de datos', 'warning');
        }
    });
}

function ultimoNumeroComprobante() {
    $.ajax({
        url: "../controlador/ingreso/controlador_ingreso.php?opcion=numeroComprobante",
        type: "POST"
    }).done(function (resp) {
        if (resp != 0) {
            document.querySelector('#txtSerieComprobante').value = resp.trim();
        } else {
            return Swal.fire('Mensaje de advertencia', 'Ocurrio un error al obtener el serie comprobante de la base de datos', 'warning');
        }
    });
}

function setISV() {
    $.ajax({
        url: "../controlador/ingreso/controlador_ingreso.php?opcion=isv",
        type: "POST"
    }).done(function (resp) {
        if (resp != 'error') {
            ultimoSerieComprobante();
            ultimoNumeroComprobante();
            $('#lblISV').html(`Impuesto (${(resp * 100)}% - ${resp})`);
            $('#txtImpuesto').val(resp.trim());
        } else {
            return Swal.fire('Mensaje de advertencia', 'Ocurrio un error al setear el ISV de la base de datos', 'warning');
        }
    });
}

//FUNCIONES PARA EL DETALLE INGRESO
$('#tablaProd').on('click', '#btnAgregarProducto', function () {
    var data = tablaProd.row($(this).parents('tr')).data();

    if (tablaProd.row(this).child.isShown()) {
        var data = tablaProd.row(this).data();
    }
    let { producto_id, producto_nombre, producto_precioventa, producto_estatus, producto_stock } = data;

    if (producto_estatus == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'Debe seleccionar un producto que este activo', 'warning');
    }
    if (verificarProductoExistente(producto_id)) {
        return Swal.fire('Mensaje de advertencia', 'El producto ya fue agregado a la tabla', 'warning');
    }

    let cantidad = 1;
    let datosAgregar = document.createElement('tr');
    datosAgregar.innerHTML = `
        <td for="id">${producto_id}</td>
        <td>${producto_nombre}</td>
        <td class="precio${producto_id}">${producto_precioventa}</td>
        <td  style="width: 10%;">
            <input type="number" class="form-control txtCantidad${producto_id}" data-stock='${producto_stock}' data-name='${producto_nombre}' min="1" value="${cantidad}" style="width: 85%;">
        </td>
        <td class="subTotal${producto_id}">${(producto_precioventa * cantidad)}</td>
        <td class="text-center">
            <button class="btn btn-danger" onclick="remove(this)"><i class="fa fa-trash"></i></button>
        </td>
    `;

    $("#tbodyDetalleIngreso").append(datosAgregar);
    sumarTotalNeto();
});

$('#tablaDetalleIngreso tbody#tbodyDetalleIngreso').on('mouseover', 'tr', function (e) {
    for (let i = 0; i < longitudTabla(); i++) {
        let x = $(this).find('td').eq(0).text();

        $(this).on('change', '.txtCantidad' + x, function () {
            let cantidad = document.querySelector('.txtCantidad' + x).value;
            let stockByRow = $('.txtCantidad' + x).attr('data-stock');
            let filaSeleccionada = e.target.parentNode.parentNode;

            let precio = filaSeleccionada.querySelector('.precio' + x).textContent;
            let subTotal = parseFloat(precio) * parseFloat(cantidad);
            filaSeleccionada.querySelector('.subTotal' + x).textContent = subTotal.toFixed(2);
            sumarTotalNeto();
        });

    }
});

function sumarTotalNeto() {
    let arregloTotal = new Array();
    let contador = 0;
    let total = 0;
    let subTotal = 0;
    let impuestoTotal = 0;
    let impuesto = document.querySelector('#txtImpuesto').value;
    let tipoComprobante = document.querySelector('#cbmTipoComprobante').value;

    $("#tablaDetalleIngreso tbody#tbodyDetalleIngreso tr").each(function () {
        arregloTotal.push($(this).find('td').eq(4).text()); //eq(4) = SubTotal, obtenemos el subtotal por cada fila que tenga la tabla
        contador++;
    });

    for (let i = 0; i < contador; i++) {
        var suma = arregloTotal[i];
        subTotal = ((parseFloat(subTotal) + parseFloat(suma)).toFixed(2)); //toFixed(2) = dos numeros decimales despues del punto
        impuestoTotal = parseFloat(subTotal * impuesto).toFixed(2);
    }
    total = parseFloat(subTotal) + parseFloat(impuestoTotal);

    if (tipoComprobante == "FACTURA" || tipoComprobante == "AJUSTE") {
        $('#lblImpuesto').html("<b>ISV " + (impuesto * 100) + "% : </b>L. " + impuestoTotal);
        $('#lblSubtotal').html("<b>Sub Total: </b> L. " + subTotal);
        $('#lblTotalNeto').html("<b>Total Neto: </b> L. " + total.toFixed(2));
    } else {
        $('#lblTotalNeto').html("<b>Total Neto: </b> L. " + total.toFixed(2));
    }
}

function verificarProductoExistente(id) {
    let idVerificar = document.querySelectorAll('#tablaDetalleIngreso td[for="id"]');
    return [].filter.call(idVerificar, td => td.textContent === id).length === 1;
}

function remove(t) {
    var dt = t.parentNode;
    var tr = dt.parentNode;
    var table = tr.parentNode;
    table.removeChild(tr);
    sumarTotalNeto();
}

function registrarIngreso() {
    if (longitudTabla() == 0) {
        return Swal.fire('Mensaje de advertencia', 'El detalle del ingreso debe tener productos para poder ser registrada', 'warning');
    }

    let impuesto = "";
    let porcentaje = "";
    let idProveedor = document.querySelector('#txtIdProveedor').value;
    let idUsuario = document.querySelector('#txtIdUsuarioLogeado').value;
    let tipoComprobante = document.querySelector('#cbmTipoComprobante').value;
    let serieComprobante = document.querySelector('#txtSerieComprobante').value;
    let numeroComprobante = document.querySelector('#txtNumeroComprobante').value;
    let idAjuste = $('#btnGuardarIngreso').attr('data-idajuste');
    let accion = $('#txtAccion').val();    

    if (idProveedor.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor seleccione un proveedor', 'warning');
    }
    if (serieComprobante.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'El campo tipo de comprobante no debe estar vacio', 'warning');
    }
    if (numeroComprobante.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'El campo numero de comprobante no debe estar vacio', 'warning');
    }


    let total = document.querySelector('#lblTotalNeto').innerHTML.substr(22);
    impuesto = document.querySelector('#lblImpuesto').innerHTML.substr(20);

    if (tipoComprobante == "FACTURA" || tipoComprobante == "TICKET" || tipoComprobante == "AJUSTE") {
        porcentaje = document.querySelector('#txtImpuesto').value;
        if (porcentaje.length == 0) {
            return Swal.fire('Mensaje de advertencia', 'El campo impuesto no debe estar vacio', 'warning');
        }
        //20 = XQ apartir del 20 es el texto del impuesto
        impuesto = document.querySelector('#lblImpuesto').innerHTML.substr(20);
    } else {
        impuesto = "0.00";
        porcentaje = "0.00";
    }


    $.ajax({
        url: '../controlador/ingreso/controlador_ingreso.php?opcion=registrarIngreso',
        type: 'POST',
        data: {
            idProveedor: idProveedor,
            idUsuario: idUsuario,
            tipoComprobante: tipoComprobante,
            serieComprobante: serieComprobante,
            numeroComprobante: numeroComprobante,
            total: total,
            impuesto: impuesto,
            porcentaje: porcentaje,
            idAjuste: idAjuste,
            accion: accion
        }
    }).done(function (resp) {
        if (resp > 0) {
            registrarDetalleIngreso(parseInt(resp), accion);
            document.querySelector('#txtProveedor').value = "";
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });
}

function registrarDetalleIngreso(idIngreso, accion) {
    let arregloProducto = [];
    let arregloCantidad = [];
    let arregloPrecio = [];
    if (longitudTabla() == 0) {
        return Swal.fire('Mensaje de advertencia', 'El detalle del ingreso debe tener productos para poder ser registrada', 'warning');
    }
    
    $("#tablaDetalleIngreso tbody#tbodyDetalleIngreso tr").each(function (index, valor) {
        arregloProducto.push($(this).find('td').eq(0).text()); //eq(0) = es la posicion en la tabla donde se encuentra el idProducto 
        if (accion == 'AJUSTE') {
            arregloCantidad.push($(this).find('td').eq(3).text());
        } else {
            arregloCantidad.push($('#tablaDetalleIngreso tbody#tbodyDetalleIngreso tr .txtCantidad' + $(this).find('td').eq(0).text()).val());
        } 
        arregloPrecio.push($(this).find('td').eq(2).text());
    });

    let producto = arregloProducto.toString(); //Convirtiendo el arreglo en String porque no puedo llevar arreglos en la URL
    let cantidad = arregloCantidad.toString();
    let precio = arregloPrecio.toString();

    $.ajax({
        url: '../controlador/ingreso/controlador_ingreso.php?opcion=registrarDetalleIngreso',
        type: 'POST',
        data: {
            idIngreso: idIngreso,
            producto: producto,
            cantidad: cantidad,
            precio: precio
        }
    }).done(function (resp) {
        if (resp > 0) {
            Swal.fire({
                title: 'Datos de Confimacíon',
                text: "Datos guardados correctamente, nueva entrada registrada!",
                icon: 'success',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Imprimir Reporte'
            }).then((result) => {
                if (result.value) {
                    window.open("../MPDF/reporte_ingreso.php?codigo=" + parseInt(idIngreso)
                        + "#zoom=100", "Reporte Ingreso", "scrollbards=NO"); //'scrollbards=NO' Para que no deje editar la ruta
                }
            });

            $("#contenido-principal").load('../vista/ingreso/vista_mantenimiento_ingreso.php');
            construirConfirmacion();
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });
}
//FIN FUNCIONES PARA EL DETALLE INGRESO
function construirConfirmacion() {
    let div = document.createElement('div');
    div.id = 'ejecutar__notificacion';
    document.querySelector('.wrapper .main-footer').appendChild(div);
}

//TABLAS DE LAS VENTANAS MODALES
var tablaProv;
function listarProveedorModal() {
    tablaProv = $("#tablaProv").DataTable({
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
            { "data": "proveedor_id" },
            { "data": "NOMBRE_PROVEEDOR" },
            { "data": "proveedor_razonsocial" },
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
            { "defaultContent": "<button class='btn btn-secondary' id='btnAgregarProveedor'><i class='fa fa-plus'></i></button>" }
        ],

        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[3]).css('text-align', 'center');
            $($(nRow).find("td")[4]).css('text-align', 'left');
            $($(nRow).find("td")[5]).css('text-align', 'center');
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
}

$('#tablaProv').on('click', '#btnAgregarProveedor', function () {
    var data = tablaProv.row($(this).parents('tr')).data();

    if (tablaProv.row(this).child.isShown()) {
        var data = tablaProv.row(this).data();
    }

    if (data.proveedor_estatus == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'Debe seleccionar un proveedor que este activo', 'warning');
    }
    document.querySelector("#txtProveedor").value = data.NOMBRE_PROVEEDOR;
    document.querySelector("#txtIdProveedor").value = data.proveedor_id;
    $("#modal_proveedor").modal('hide');
});

var tablaProd;
function listarProdModal() {
    tablaProd = $("#tablaProd").DataTable({
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
            { "data": "producto_nombre" }, //NOMBRE_PERSONA = alias que le pusimos a la funcion CONCAT_WS EN EL SP
            { "data": "categoria_nombre" },
            { "data": "producto_stock" },
            { "data": "producto_precioventa" },
            {
                "data": "producto_foto",
                render: function (data, type, row) {
                    return `<img src="../${data}" width="40px" class="img-circle m-r-10">`;
                }

            },
            {
                "data": "producto_estatus",
                render: function (data, type, row) {
                    if (data === "ACTIVO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },
            { "defaultContent": "<button class='btn btn-secondary' id='btnAgregarProducto'><i class='fa fa-plus'></i></button>" }
        ],

        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[7]).css('text-align', 'center');
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaProd.on('draw.dt', function () {
        var PageInfo = $('#tablaProd').DataTable().page.info();
        tablaProd.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

function abrirModal(tipoModal) {
    if (tipoModal == 'proveedor') {
        $("#modal_proveedor").modal('show');
    } else {
        $("#modal_producto").modal('show');
    }
}

function cerrarModal() {
    $("#modal_proveedor").modal('hide');
}

function longitudTabla() {
    let contador = 0;
    $("#tablaDetalleIngreso tbody#tbodyDetalleIngreso tr").each(function () {
        contador++;
    });
    return contador;
}

