var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}

var tblMovimientos;
function listarMovimientos() {
    var fechaInicio = document.querySelector('#txtFechaInicio').value;
    var fechaFin = document.querySelector('#txtFechaFin').value;
    tblMovimientos = $("#tblMovimientos").DataTable({
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
            "url": "../controlador/movimientos/controlador_movimiento.php?opcion=listar",
            data: {
                fechaInicio: fechaInicio,
                fechaFin: fechaFin,
            }
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "usuario_nombre" },
            { "data": "transaccion_fecha" },
            { "data": "transaccion_observaciones" },
            {
                "data": "transaccion_estatus",
                render: function (data, type, row) {
                    if (data === "MOVIMIENTO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5 px-3'>Anulado</span>";
                    }
                }
            },
            {
                "data": "transaccion_estatus",
                render: function (data) {
                    if (data == "MOVIMIENTO") {
                        return "<button class='imprimir btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;"
                            + "<button class='anular btn btn-danger'><i class='fa fa-times-circle'></i></button>&nbsp; " +
                            "<button class='btn btn-warning btnViewMovimiento'><i class='fa fa-eye'></i></button>&nbsp; " +
                            "<button class='btn btn-info editar'><i class='fa fa-edit'></i></button>";
                    } else {
                        return "<button class='imprimir btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;"
                            + "<button class='btn btn-danger disabled'><i class='fa fa-times-circle'></i></button>&nbsp; " +
                            "<button class='btn btn-warning btnViewMovimiento'><i class='fa fa-eye'></i></button>&nbsp; " +
                            "<button class='btn btn-info editar' disabled><i class='fa fa-edit'></i></button>";
                    }
                }
            }
        ],
        "fnRowCallback": function (nRow) {
            $($(nRow).find("td")[4]).css('text-align', 'center');
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tblMovimientos.on('draw.dt', function () {
        var PageInfo = $('#tblMovimientos').DataTable().page.info();
        tblMovimientos.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

$('#txtFechaInicio, #txtFechaFin').change(function () {
    listarMovimientos();
});

$('#btnAgregarMovimiento').click(function (e) {
    if (!accesos.includes('14-2')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    $("#contenido-principal").load('../vista/movimientos/vista_movimiento_registro.php');
});

$('#tblMovimientos').on('click', '.anular', function () {
    if (!accesos.includes('14-4')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }

    var data = tblMovimientos.row($(this).parents('tr')).data();
    if (tblMovimientos.row(this).child.isShown()) {
        var data = tblMovimientos.row(this).data();
    }

    Swal.fire({
        title: '¿Desea anular el movimiento?',
        text: "Esta seguro de anular el movimiento, no se podran reventir los cambios!",
        icon: 'success',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Anular Movimiento'
    }).then((result) => {
        if (result.value) {
            $.ajax({
                url: '../controlador/movimientos/controlador_movimiento.php?opcion=anular',
                type: 'POST',
                data: {
                    idTransaccion: data.transaccion_id
                }
            }).done(function (resp) {
                if (resp > 0) {
                    construirConfirmacion();
                    Swal.fire('Mensaje de Confirmacíon', 'Movimiento Anulado Correctamente', 'success');
                    $("#contenido-principal").load('../vista/movimientos/vista_mantenimiento_movimiento.php');
                } else {
                    Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
                }
            });
        }
    });

});

$('#btnModalProducto').click(function (e) {
    $('#modal_producto').modal('show');
});

var tablaProd;
function listProductModal() {
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

//FUNCIONES PARA EL DETALLE INGRESO
$('#tablaProd').on('click', '#btnAgregarProducto', function () {
    let cantidad = 1;

    var data = tablaProd.row($(this).parents('tr')).data();

    if (tablaProd.row(this).child.isShown()) {
        var data = tablaProd.row(this).data();
    }

    const { producto_id, producto_nombre, producto_stock, producto_estatus } = data;

    if (producto_stock == "0") {
        return Swal.fire('Mensaje de advertencia', 'El producto ya no tiene stock no es posible aplicarle un movimiento', 'warning');
    }

    if (producto_estatus == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'Debe seleccionar un producto que este activo', 'warning');
    }
    if (verificarProductoExistente(producto_id)) {
        return Swal.fire('Mensaje de advertencia', 'El producto ya fue agregado a la tabla', 'warning');
    }

    let datosAgregar = document.createElement('tr');
    datosAgregar.innerHTML = `
        <td for="id">${producto_id}</td>
        <td class='name'>${producto_nombre}</td>
        <td  style="width: 10%;">
            <input type="number" class="form-control txtCantidad${producto_id}" data-stock='${producto_stock}' data-name='${producto_nombre}' min="1" value="${cantidad}" style="width: 85%;">
        </td>
        <td class="text-center">
            <button class="btn btn-danger" onclick="remove(this)"><i class="fa fa-trash"></i></button>
        </td>`;

    $("#tbodyDetalleMovimiento").append(datosAgregar);
});

$('#tablaDetalleMovimientos tbody#tbodyDetalleMovimiento').on('mouseover', 'tr', function (e) {
    for (let i = 0; i < longitudTabla(); i++) {
        let x = $(this).find('td').eq(0).text();

        $(this).on('change', '.txtCantidad' + x, function () {
            let count = $('.txtCantidad' + x).val();
            let stockByRow = $('.txtCantidad' + x).attr('data-stock');

            if (parseFloat(count) > parseFloat(stockByRow)) {
                let nameProduct = $('.txtCantidad' + x).attr('data-name');
                $('.txtCantidad' + x).val(stockByRow);
                return Swal.fire('Mensaje de advertenica', 'La cantidad no debe superar el stock existente del producto ' + nameProduct, 'warning');
            }
        });
    }
});

$('#btnActualizarSalida').click(function (e) {
    if (longitudTabla() == 0) {
        return Swal.fire('Mensaje de advertencia', 'El detalle de movimientos debe tener productos para poder ser registrada', 'warning');
    }
    let motivo = document.querySelector('#txtDescripcion').value;
    let idUsuario = document.querySelector('#txtIdUsuarioLogeado').value;
    let idTransaccion = $('#txtDescripcion').attr('data-idtrans');

    if (motivo.length == 0 || motivo.length <= 100) {
        return Swal.fire('Mensaje de advertencia', 'Debe ingresar un motivo de la salida y debe ser mayor a 100 caracteres', 'warning');
    }
    $.ajax({
        url: '../controlador/movimientos/controlador_movimiento.php?opcion=editarMovimiento',
        type: 'POST',
        data: {
            motivo: motivo,
            idUsuario: idUsuario,
            idTransaccion: idTransaccion
        }
    }).done(function (resp) {
        if (resp > 0) {
            registrarDetalleMovimiento(parseInt(resp), 'editar');
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });

});

$('#tblMovimientos').on('click', '.imprimir', function () {
    if (!accesos.includes('14-3')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tblMovimientos.row($(this).parents('tr')).data();

    if (tblMovimientos.row(this).child.isShown()) {
        var data = tblMovimientos.row(this).data();
    }
    window.open("../MPDF/reporte_movimientos.php?codigo=" + parseInt(data.transaccion_id)
        + "#zoom=100", "Reporte Movimiento", "scrollbards=NO");
});

function registrarMovimiento() {
    if (longitudTabla() == 0) {
        return Swal.fire('Mensaje de advertencia', 'El detalle de movimientos debe tener productos para poder ser registrada', 'warning');
    }
    let motivo = document.querySelector('#txtDescripcion').value;
    let idUsuario = document.querySelector('#txtIdUsuarioLogeado').value;

    if (motivo.length == 0 || motivo.length <= 100) {
        return Swal.fire('Mensaje de advertencia', 'Debe ingresar un motivo de la salida y debe ser mayor a 100 caracteres', 'warning');
    }

    $.ajax({
        url: '../controlador/movimientos/controlador_movimiento.php?opcion=registrarMovimiento',
        type: 'POST',
        data: {
            motivo: motivo,
            idUsuario: idUsuario
        }
    }).done(function (resp) {
        if (resp > 0) {
            registrarDetalleMovimiento(parseInt(resp), 'guardar');
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });
}

function registrarDetalleMovimiento(idMovimiento, accion) {
    let arregloProducto = [];
    let arregloCantidad = [];
    $("#tablaDetalleMovimientos tbody#tbodyDetalleMovimiento tr").each(function (index, valor) {
        arregloProducto.push($(this).find('td').eq(0).text());
        arregloCantidad.push($('#tablaDetalleMovimientos tbody#tbodyDetalleMovimiento tr .txtCantidad' + $(this).find('td').eq(0).text()).val());
    });

    let producto = arregloProducto.toString();
    let cantidad = arregloCantidad.toString();
    
    $.ajax({
        url: '../controlador/movimientos/controlador_movimiento.php?opcion=registrarDetalleMovimiento',
        type: 'POST',
        data: {
            idMovimiento: idMovimiento,
            producto: producto,
            cantidad: cantidad,
            accion: accion
        }
    }).done(function (resp) {
        if (resp > 0) {
            Swal.fire({
                title: 'Datos de Confimacíon',
                text: "Datos guardados correctamente, nuevo movimiento registrado!",
                icon: 'success',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Imprimir Comprobante'
            }).then((result) => {
                if (result.value) {

                    window.open("../MPDF/reporte_movimientos.php?codigo=" + parseInt(idMovimiento)
                        + "#zoom=100", "Reporte Movimiento", "scrollbards=NO");
                }
            });

            $("#contenido-principal").load('../vista/movimientos/vista_mantenimiento_movimiento.php');
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

function llenarInputs(data, tipo) {
    return new Promise((resolve) => {
        setTimeout(() => {
            let { transaccion_observaciones, transaccion_id } = data;
            $('#txtDescripcion').val(transaccion_observaciones);
            if (tipo == 'Editar') {
                $('#cont__guardar').css('display', 'none');
                $('#cont__actualizar').css('display', 'block');
                $('#txtDescripcion').attr('data-idtrans', transaccion_id);
            } else {
                $('#btnGuardarSalida, #btnModalProducto').prop('disabled', true);
            }

            resolve(transaccion_id);
        }, 200);
    });
}

$('#tblMovimientos').on('click', '.btnViewMovimiento', async function () {
    if (!accesos.includes('14-5')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tblMovimientos.row($(this).parents('tr')).data();
    if (tblMovimientos.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tblMovimientos.row(this).data();
    }
    try {
        $("#contenido-principal").load('../vista/movimientos/vista_movimiento_registro.php');
        let idTransaccion = await llenarInputs(data, 'Ver');
        llenartablaDetalleMovimientos(idTransaccion);
        $('#tablaDetalleMovimientos .borrarMov').prop('disabled', false);
    } catch (error) {
        console.log(error);
    }
});

$('#tblMovimientos').on('click', '.editar', async function () {
    if (!accesos.includes('14-6')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tblMovimientos.row($(this).parents('tr')).data();
    if (tblMovimientos.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tblMovimientos.row(this).data();
    }
    try {
        $("#contenido-principal").load('../vista/movimientos/vista_movimiento_registro.php');
        let idTransaccion = await llenarInputs(data, 'Editar');
        getAllDetailByMovement(idTransaccion);
    } catch (error) {
        console.log(error);
    }
});

var tablaDetalleMovimientos;
function llenartablaDetalleMovimientos(idTransaccion) {
    tablaDetalleMovimientos = $("#tablaDetalleMovimientos").DataTable({
        "columnDefs": [
            {
                "targets": [4],
                "visible": false,
                "searchable": true
            }
        ],
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controlador/movimientos/controlador_movimiento.php?opcion=listarDetalleMovimiento",
            data: {
                idTransaccion: idTransaccion
            }
        },
        "columns": [
            { "data": "producto_id" },
            { "data": "producto_nombre" },
            { "data": "detallemovimiento_cantidad" },
            { "defaultContent": "<button class='btn btn-danger borrarMov' disabled><i class='fa fa-trash'></i></button>" },
            { "data": "detalletransaccion_id" },
        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[0]).css('text-align', 'center');
            $($(nRow).find("td")[1]).css('text-align', 'center');
            $($(nRow).find("td")[2]).css('text-align', 'center');
            $($(nRow).find("td")[3]).css('text-align', 'center');
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        }
    });
}

function getAllDetailByMovement(idTransaccion) {
    $.ajax({
        url: "../controlador/movimientos/controlador_movimiento.php?opcion=listarDetalleMovimiento",
        type: 'POST',
        data: { idTransaccion: idTransaccion }
    }).done(function (resp) {
        let rows = JSON.parse(resp).data;
        if (rows != null) {
            for (x of rows) {
                loadDataMovement(x);
            }
        }
    });
}

function loadDataMovement(data) {
    const { producto_id, producto_nombre, detallemovimiento_cantidad, producto_stock } = data;
    let datosAgregar = document.createElement('tr');
    datosAgregar.innerHTML = `
        <td for="id">${producto_id}</td>
        <td class='name'>${producto_nombre}</td>
        <td  style="width: 10%;">
            <input type="number" class="form-control txtCantidad${producto_id}" data-stock='${producto_stock}' data-name='${producto_nombre}' min="1" value="${detallemovimiento_cantidad}" style="width: 85%;">
        </td>
        <td class="text-center">
            <button class="btn btn-danger" onclick="remove(this)"><i class="fa fa-trash"></i></button>
        </td>`;

    $("#tbodyDetalleMovimiento").append(datosAgregar);
}

function verificarProductoExistente(id) {
    let idVerificar = document.querySelectorAll('#tablaDetalleMovimientos td[for="id"]');
    return [].filter.call(idVerificar, td => td.textContent === id).length === 1;
}

function longitudTabla() {
    let contador = 0;
    $("#tablaDetalleMovimientos tbody#tbodyDetalleMovimiento tr").each(function () {
        contador++;
    });
    return contador;
}

function remove(t) {
    var dt = t.parentNode;
    var tr = dt.parentNode;
    var table = tr.parentNode;
    table.removeChild(tr);
}