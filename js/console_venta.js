var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}

var tablaVenta;
function listarVenta() {
    var fechaInicio = document.querySelector('#txtFechaInicio').value;
    var fechaFin = document.querySelector('#txtFechaFin').value;
    tablaVenta = $("#tablaVenta").DataTable({
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
            "url": "../controlador/venta/controlador_venta.php?opcion=listar",
            data: {
                fechaInicio: fechaInicio,
                fechaFin: fechaFin,
            }
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "usuario_nombre" },
            { "data": "NOMBRE_CLIENTE" },
            { "data": "venta_ticomprobante" },
            { "data": "venta_numcomprobante" },
            { "data": "venta_fecha" },
            { "data": "venta_total" },
            { "data": "venta_impuesto" },
            {
                "data": "venta_estatus",
                render: function (data, type, row) {
                    if (data === "FACTURADO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },
            {
                "data": "venta_estatus",
                render: function (data) {
                    if (data == "FACTURADO") {
                        return "<button class='imprimir btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;"
                            + "<button class='anular btn btn-danger'><i class='fa fa-times-circle'></i></button>&nbsp; " +
                            "<button class='btn btn-warning btnViewVenta'><i class='fa fa-eye'></i></button>";
                    } else {
                        return "<button class='imprimir btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;"
                            + "<button class='btn btn-danger disabled'><i class='fa fa-times-circle'></i></button>&nbsp; " +
                            "<button class='btn btn-warning btnViewVenta'><i class='fa fa-eye'></i></button>";
                    }
                }

            }

        ],
        "fnRowCallback": function (nRow) {
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
    tablaVenta.on('draw.dt', function () {
        var PageInfo = $('#tablaVenta').DataTable().page.info();
        tablaVenta.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

$('#txtFechaInicio, #txtFechaFin').change(function () {
    listarVenta();
});


$('#tablaVenta').on('click', '.imprimir', function () {
    if (!accesos.includes('12-3')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tablaVenta.row($(this).parents('tr')).data();

    if (tablaVenta.row(this).child.isShown()) {
        var data = tablaVenta.row(this).data();
    }
    window.open("../MPDF/reporte_venta.php?codigo=" + parseInt(data.venta_id)
        + "#zoom=90", "Reporte Ingreso", "scrollbards=NO"); //'scrollbards=NO' Para que no deje editar la ruta
});

$('#tablaVenta').on('click', '.anular', function () {
    if (!accesos.includes('12-4')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tablaVenta.row($(this).parents('tr')).data();

    if (tablaVenta.row(this).child.isShown()) {
        var data = tablaVenta.row(this).data();
    }

    Swal.fire({
        title: '¿Desea anular la venta?',
        text: "Esta seguro de anular la venta, no se podran reventir los cambios!",
        icon: 'success',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Anular Venta'
    }).then((result) => {
        if (result.value) {
            $.ajax({
                url: '../controlador/venta/controlador_venta.php?opcion=anular',
                type: 'POST',
                data: {
                    idVenta: data.venta_id
                }
            }).done(function (resp) {
                if (resp > 0) {
                    Swal.fire('Mensaje de Confirmacíon', 'Venta anulada correctamente', 'success');
                    // tablaVenta.ajax.reload();
                    $("#contenido-principal").load('../vista/venta/vista_mantenimiento_venta.php');
                    construirConfirmacion();

                } else {
                    Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
                }
            });
        }
    });

});

function lastInvoiceNumber() {
    $.ajax({
        url: "../controlador/venta/controlador_venta.php?opcion=lastInvoice",
        type: "POST"
    }).done(function (resp) {
        if (resp != 0) {
            document.querySelector('#txtNumeroComprobante').value = resp;
        } else {
            return Swal.fire('Mensaje de advertencia', 'Ocurrio un error al obtener el serie comprobante de la base de datos', 'warning');
        }
    });
}

function maximumInvoiceNumber() {
    $.ajax({
        url: "../controlador/venta/controlador_venta.php?opcion=maximumInvoice",
        type: "POST"
    }).done(function (resp) {
        if (resp != 0) {
            document.querySelector('#txtSerieComprobante').value = resp;
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
            $('#lblISV').html(`Impuesto (${(resp * 100)}% - ${resp})`);
            $('#txtImpuesto').val(resp.trim());
        } else {
            return Swal.fire('Mensaje de advertencia', 'Ocurrio un error al setear el ISV de la base de datos', 'warning');
        }
    });
}

//FUNCIONES PARA EL DETALLE INGRESO
$('#tablaProd').on('click', '#btnAgregarProducto', function () {
    let cantidad = 1;
    let descuento;
    var data = tablaProd.row($(this).parents('tr')).data();

    if (tablaProd.row(this).child.isShown()) {
        var data = tablaProd.row(this).data();
    }

    const { producto_id, producto_nombre, producto_precioventa, producto_descuento, producto_oferta, producto_stock } = data;

    if (producto_stock == "0") {
        return Swal.fire('Mensaje de advertencia', 'El producto ya no tiene stock, no se puede vender', 'warning');
    }

    if (producto_oferta == "0") {
        descuento = 0;
    } else {
        descuento = (producto_precioventa * producto_descuento).toFixed(2);
    }

    if (data.producto_estatus == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'Debe seleccionar un producto que este activo', 'warning');
    }
    if (verificarProductoExistente(producto_id)) {
        return Swal.fire('Mensaje de advertencia', 'El producto ya fue agregado a la tabla', 'warning');
    }


    let datosAgregar = document.createElement('tr');
    datosAgregar.innerHTML = `
        <td for="id">${producto_id}</td>
        <td>${producto_nombre}</td>
        <td class="precio${producto_id}">${producto_precioventa}</td>
        <td  style="width: 10%;">
            <input type="number" class="form-control txtCantidad${producto_id}" data-stock='${producto_stock}' data-name='${producto_nombre}' min="1" value="${cantidad}" style="width: 85%;">
        </td>
        <td class="descuento${producto_id}">${(descuento)}</td>
        <td class="subTotal${producto_id}">${(producto_precioventa)}</td>
        <td class="porcentaje${producto_id}" style="display: none;">${(producto_descuento)}</td>
        <td class="text-center">
            <button class="btn btn-danger" onclick="remove(this)"><i class="fa fa-trash"></i></button>
        </td>
    `;

    $("#tbodyDetalleVenta").append(datosAgregar);
    sumarTotalNeto();
});

$('#tablaDetalleVenta tbody#tbodyDetalleVenta').on('mouseover', 'tr', function (e) {
    for (let i = 0; i < longitudTabla(); i++) {
        let x = $(this).find('td').eq(0).text();
        $(this).on('change', '.txtCantidad' + x, function () {
            let cantidad = document.querySelector('.txtCantidad' + x).value;
            let stockByRow = $('.txtCantidad' + x).attr('data-stock');
            let filaSeleccionada = e.target.parentNode.parentNode;

            if (parseFloat(cantidad) > parseFloat(stockByRow)) {
                let nameProduct = $('.txtCantidad' + x).attr('data-name');
                $('.txtCantidad' + x).val(stockByRow);
                return Swal.fire('Mensaje de advertenica', 'La cantidad no debe superar el stock existente del producto ' + nameProduct, 'warning');
            }

            let precio = filaSeleccionada.querySelector('.precio' + x).textContent;
            let porcentajeDescuento = filaSeleccionada.querySelector('.porcentaje' + x).textContent;
            let subTotal = parseFloat(precio) * parseFloat(cantidad);
            let descuento = parseFloat(subTotal) * parseFloat(porcentajeDescuento);

            filaSeleccionada.querySelector('.subTotal' + x).textContent = subTotal.toFixed(2);
            filaSeleccionada.querySelector('.descuento' + x).textContent = descuento.toFixed(2);
            sumarTotalNeto();
        });
    }
});

function sumarTotalNeto() {
    let arregloTotal = new Array();
    let arregloDescuento = new Array();
    let contador = 0;
    let total = 0;
    let subTotal = 0;
    let descuentoTotal = 0;
    let impuestoTotal = 0;
    let impuesto = document.querySelector('#txtImpuesto').value;
    let tipoComprobante = document.querySelector('#cbmTipoComprobante').value;

    $("#tablaDetalleVenta tbody#tbodyDetalleVenta tr").each(function () {
        arregloDescuento.push($(this).find('td').eq(4).text()); //eq(4) = Descuento, obtenemos el subtotal por cada fila que tenga la tabla
        arregloTotal.push($(this).find('td').eq(5).text()); //eq(5) = SubTotal, obtenemos el subtotal por cada fila que tenga la tabla
        contador++;
    });

    for (let i = 0; i < contador; i++) {
        var suma = arregloTotal[i];
        subTotal = ((parseFloat(subTotal) + parseFloat(suma)).toFixed(2)); //toFixed(2) = dos numeros decimales despues del punto
        descuentoTotal = (parseFloat(descuentoTotal) + parseFloat(arregloDescuento[i]));
        impuestoTotal = parseFloat(subTotal * impuesto).toFixed(2);
    }
    total = (parseFloat(subTotal) + parseFloat(impuestoTotal)) - parseFloat(descuentoTotal);

    if (tipoComprobante == "FACTURA") {
        $('#lblImpuesto').html("<b>ISV " + (impuesto * 100) + "% : </b>L. " + impuestoTotal);
        $('#lblDescuento').html("<b>Descuento: </b>L. " + parseFloat(descuentoTotal).toFixed(2));
        $('#lblSubtotal').html("<b>Sub Total: </b> L. " + subTotal);
        $('#lblTotalNeto').html("<b>Total Neto: </b> L. " + total.toFixed(2));
    } else {
        $('#lblTotalNeto').html("<b>Total Neto: </b> L. " + total.toFixed(2));
    }
}

function verificarProductoExistente(id) {
    let idVerificar = document.querySelectorAll('#tablaDetalleVenta td[for="id"]');
    return [].filter.call(idVerificar, td => td.textContent === id).length === 1;
}

function remove(t) {
    var dt = t.parentNode;
    var tr = dt.parentNode;
    var table = tr.parentNode;
    table.removeChild(tr);
    sumarTotalNeto();
}

function registrarVenta() {
    if (longitudTabla() == 0) {
        return Swal.fire('Mensaje de advertencia', 'El detalle de la venta debe tener productos para poder ser registrada', 'warning');
    }

    let impuesto = "";
    let porcentaje = "";
    let descuento = "";
    let idCliente = document.querySelector('#txtIdCliente').value;
    let idUsuario = document.querySelector('#txtIdUsuarioLogeado').value;
    let tipoComprobante = document.querySelector('#cbmTipoComprobante').value;
    let serieComprobante = document.querySelector('#txtSerieComprobante').value;
    let numeroComprobante = document.querySelector('#txtNumeroComprobante').value;
    let dineroCliente = document.querySelector('#txtMoneyClient').value;

    if (idCliente.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor seleccione un cliente', 'warning');
    }
    if (serieComprobante.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'El campo tipo de comprobante no debe estar vacio', 'warning');
    }
    if (numeroComprobante.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'El campo numero de comprobante no debe estar vacio', 'warning');
    }
    if (dineroCliente.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Debe ingresar el monto de dinero a pagar.', 'warning');
    }

    let total = document.querySelector('#lblTotalNeto').innerHTML.substr(22);
    impuesto = document.querySelector('#lblImpuesto').innerHTML.substr(20);
    descuento = document.querySelector('#lblDescuento').innerHTML.substr(21);

    if (parseFloat(dineroCliente) < parseFloat(total)) {
        return Swal.fire('Mensaje de advertencia', 'El monto de dinero ingresado no debe ser menor al total a facturar.', 'warning');
    }
    let cambio = (parseFloat(dineroCliente) - parseFloat(total)).toFixed(2);

    if (tipoComprobante == "FACTURA") {
        porcentaje = document.querySelector('#txtImpuesto').value;
        if (porcentaje.length == 0) {
            return Swal.fire('Mensaje de advertencia', 'El campo impuesto no debe estar vacio', 'warning');
        }
    } else {
        impuesto = "0.00";
        porcentaje = "0.00";
        descuento = "0.00";
    }
    $.ajax({
        url: '../controlador/venta/controlador_venta.php?opcion=registrarVenta',
        type: 'POST',
        data: {
            idCliente: idCliente,
            idUsuario: idUsuario,
            tipoComprobante: tipoComprobante,
            serieComprobante: serieComprobante,
            numeroComprobante: numeroComprobante,
            total: total,
            impuesto: impuesto,
            porcentaje: porcentaje,
            descuento: descuento,
            dineroCliente: dineroCliente
        }
    }).done(function (resp) {
        if (resp > 0) {
            registrarDetalleVenta(parseInt(resp), cambio);
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });
}


function registrarDetalleVenta(idVenta, cambio) {
    let arregloDescuento = [];
    let arregloProducto = [];
    let arregloCantidad = [];
    let arregloPrecio = [];

    if (longitudTabla() == 0) {
        return Swal.fire('Mensaje de advertencia', 'El detalle del ingreso debe tener productos para poder ser registrada', 'warning');
    }

    $("#tablaDetalleVenta tbody#tbodyDetalleVenta tr").each(function (index, valor) {
        arregloProducto.push($(this).find('td').eq(0).text()); //eq(0) = es la posicion en la tabla donde se encuentra el idProducto 
        arregloCantidad.push($('#tablaDetalleVenta tbody#tbodyDetalleVenta tr .txtCantidad' + $(this).find('td').eq(0).text()).val());
        arregloPrecio.push($(this).find('td').eq(2).text());
        arregloDescuento.push($(this).find('td').eq(4).text());
    });

    let producto = arregloProducto.toString(); //Convirtiendo el arreglo en String porque no puedo llevar arreglos en la URL
    let cantidad = arregloCantidad.toString();
    let precio = arregloPrecio.toString();
    let descuento = arregloDescuento.toString();

    $.ajax({
        url: '../controlador/venta/controlador_venta.php?opcion=registrarDetalleVenta',
        type: 'POST',
        data: {
            idVenta: idVenta,
            producto: producto,
            cantidad: cantidad,
            precio: precio,
            descuento: descuento
        }
    }).done(function (resp) {
        if (resp > 0) {
            Swal.fire({
                title: 'Datos de Confimacíon',
                text: "Datos guardados correctamente, nueva venta registrada, el cambio del cliente es: L." + cambio,
                icon: 'success',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Imprimir Factura'
            }).then((result) => {
                if (result.value) {
                    window.open("../MPDF/reporte_venta.php?codigo=" + parseInt(idVenta)
                        + "#zoom=90", "Reporte Venta", "scrollbards=NO"); //'scrollbards=NO' Para que no deje editar la ruta
                }
            });

            $("#contenido-principal").load('../vista/venta/vista_mantenimiento_venta.php');
            construirConfirmacion();
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });
}

function construirConfirmacion() {
    let div = document.createElement('div');
    div.id = 'ejecutar__notificacion';
    document.querySelector('.wrapper .main-footer').appendChild(div);
}
//FIN FUNCIONES PARA EL DETALLE INGRESO

function redirect() {
    return new Promise((resolve) => {
        $("#contenido-principal").load('../vista/venta/vista_venta_registro.php');
        resolve('OK');
    });
}

function llenarInputs(data) {
    return new Promise((resolve) => {
        setTimeout(() => {
            let { NOMBRE_CLIENTE, venta_ticomprobante, venta_seriecomprobante, venta_numcomprobante, transaccion_porcentaje, venta_id } = data;
            $('#txtCliente').val(NOMBRE_CLIENTE);
            $('#txtImpuesto').val((transaccion_porcentaje * 100) + '%');
            $('#cbmTipoComprobante').val(venta_ticomprobante).trigger('change');
            $('#txtSerieComprobante').val(venta_seriecomprobante);
            $('#txtNumeroComprobante').val(venta_numcomprobante);
            $('#btnGuardarVenta, #btnModalCliente, #btnModalProducto').prop('disabled', true);
            $('#cont__porcentaje').remove();
            setISV();
            resolve(venta_id);
        }, 200);
    });
}

$('#tablaVenta').on('click', '.btnViewVenta', async function () {
    if (!accesos.includes('12-5')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tablaVenta.row($(this).parents('tr')).data();
    if (tablaVenta.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tablaVenta.row(this).data();
    }
    try {
        let respuesta = await redirect();
        if (respuesta == 'OK') {
            let idVenta = await llenarInputs(data);
            llenartablaDetalleVenta(idVenta);
            await calcularTotales();
        }
    } catch (error) {
        console.log(error);
    }
});

function calcularTotales() {
    return new Promise(resolve => {
        setTimeout(() => {
            sumarTotalNeto();
            resolve();
        }, 1500);
    });
}

var tablaDetalleVenta;
function llenartablaDetalleVenta(idVenta) {
    tablaDetalleVenta = $("#tablaDetalleVenta").DataTable({
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controlador/venta/controlador_venta.php?opcion=listarDetalleventa",
            data: {
                idVenta: idVenta
            }
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "producto_nombre" },
            { "data": "detalleventa_precio" },
            { "data": "detalleventa_cantidad" },
            { "data": "detalleventa_descuento" },
            { "data": "SUB_TOTAL" },
            { "defaultContent": "<button class='btn btn-danger' disabled><i class='fa fa-trash'></i></button>" }
        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[0]).css('text-align', 'center');
            $($(nRow).find("td")[1]).css('text-align', 'center');
            $($(nRow).find("td")[2]).css('text-align', 'center');
            $($(nRow).find("td")[3]).css('text-align', 'center');
            $($(nRow).find("td")[4]).css('text-align', 'center');
            $($(nRow).find("td")[5]).css('text-align', 'center');
            $($(nRow).find("td")[6]).css('text-align', 'center');
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        }
    });
    tablaDetalleVenta.on('draw.dt', function () {
        var PageInfo = $('#tablaDetalleVenta').DataTable().page.info();
        tablaDetalleVenta.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

//TABLAS DE LAS VENTANAS MODALES
var tablaCliente;
function listarClienteModal() {
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
            {
                "data": "persona_estatus",
                render: function (data, type, row) {
                    if (data === "ACTIVO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }

                }
            },
            {
                "data": "persona_estatus",
                render: function (data, type, row) {
                    if (data === "ACTIVO") {
                        return "<button class='btn btn-secondary' id='btnAgregarCliente'><i class='fa fa-plus'></i></button>&nbsp;<button class='btn btn-success' disabled><i class='fa fa-check'></i></button>&nbsp;<button class='desactivar btn btn-danger'><i class='fa fa-times-circle'></i></button>";
                    } else {
                        return "<button class='btn btn-secondary' id='btnAgregarCliente'><i class='fa fa-plus'></i></button>&nbsp;<button class='activar btn btn-success'><i class='fa fa-check'></i></button>&nbsp;<button class='btn btn-danger' disabled><i class='fa fa-times-circle'></i></button>";
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

$('#tablaCliente').on('click', '#btnAgregarCliente', function () {
    var data = tablaCliente.row($(this).parents('tr')).data();

    if (tablaCliente.row(this).child.isShown()) {
        var data = tablaCliente.row(this).data();
    }

    if (data.cliente_estatus == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'Debe seleccionar un cliente que este activo', 'warning');
    }
    document.querySelector("#txtCliente").value = data.NOMBRE_PERSONA;
    document.querySelector("#txtIdCliente").value = data.persona_id;
    $("#modal_cliente").modal('hide');
});

$('#tablaCliente').on('click', '.activar', function () {
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
            updateStatePerson(data.persona_id, 'ACTIVO');
        }
    })
});

$('#tablaCliente').on('click', '.desactivar', function () {
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
            updateStatePerson(data.persona_id, 'INACTIVO');
        }
    })
});

function updateStatePerson(idCliente, estatus) {
    $.ajax({
        url: '../controlador/persona/controlador_persona.php?opcion=estatus',
        type: 'POST',
        data: {
            idCliente: idCliente,
            estatus: estatus,
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

function registrarCliente() {
    var nombre = document.querySelector('#txtNombre').value;
    var apellidoPaterno = document.querySelector('#txtApellidoPaterno').value;
    var apellidoMaterno = document.querySelector('#txtApellidoMaterno').value;
    var tipoDocumento = document.querySelector('#cbmTipoDocumento').value;
    var numeroDocumento = document.querySelector('#txtNumero').value;
    var sexo = document.querySelector('#cbmSexo').value;
    var telefono = document.querySelector('#txtTelefono').value;
    var correo = document.querySelector('#txtCorreo').value;

    if (nombre.length == 0 || apellidoPaterno.length == 0 || apellidoMaterno.length == 0 || tipoDocumento.length == 0
        || numeroDocumento.length == 0 || sexo.length == 0 || telefono.length == 0 || correo.length == 0) {
        mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, sexo, telefono, correo, 'divError');
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios', 'warning');
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
                    tablaCliente.ajax.reload();
                    document.querySelector('#formularioRegistroCliente').reset();
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
    if (tipoModal == 'cliente') {
        $("#modal_cliente").modal('show');
    } else {
        $("#modal_producto").modal('show');
    }
}

function cerrarModal() {
    $("#modal_cliente").modal('hide');
}

function longitudTabla() {
    let contador = 0;
    $("#tablaDetalleVenta tbody#tbodyDetalleVenta tr").each(function () {
        contador++;
    });
    return contador;
}

function mensajeError(nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, sexo, telefono, correo, div) {
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
    if (correo.length === 0) {
        cadena += "El campo de correo electronico no debe estar vacio. <br>";
    }

    document.querySelector("#" + div).style.display = "block";
    document.querySelector("#" + div).innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + cadena;
}

$('#btnNewVenta').click(function (e) {
    if (!accesos.includes('12-2')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }

    $("#contenido-principal").load('venta/vista_venta_registro.php');
    lastInvoiceNumber();
    maximumInvoiceNumber();
    setISV();
    setTimeout(() => {
        listarClienteModal();
        listarProdModal();
    }, 500);
});

$('#btnReporteVenta').click(function (e) { 
    window.open("../MPDF/estadisticas_ventas.php#zoom=100", "Reporte Venta", "scrollbards=NO");
    
});