var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}


var tablaCotizacion;
function listarCotizacion() {
    var fechaInicio = document.querySelector('#txtFechaInicio').value;
    var fechaFin = document.querySelector('#txtFechaFin').value;

    tablaCotizacion = $("#tablaCotizacion").DataTable({
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
            // "url": "../controlador/ingreso/controlador_ingreso.php?opcion=listar",
            "url": "../controlador/cotizacion/controlador_cotizacion.php?opcion=listar",
            data: {
                fechaInicio: fechaInicio,
                fechaFin: fechaFin,
            }
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "usuario_nombre" },
            { "data": "nombre_cliente" },
            { "data": "cotizacion_fecha" },
            { "data": "cotizacion_total" },
            { "data": "cotizacion_impuesto" },
            {
                "data": "cotizacion_estatus",
                render: function (data, type, row) {
                    // if (data === "INGRESADO") {
                    if (data === "COTIZADO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },
            {
                "data": "cotizacion_estatus",
                render: function (data) {
                    if (data == "COTIZADO") {
                        return "<button class='imprimirc btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;"
                            // + "<button class='anularc btn btn-danger'><i class='fa fa-times-circle'></i></button>&nbsp; "  
                            + "<button class='editarc btn btn-info'><i class='fa fa-edit'></i></button>&nbsp; " +
                            "<button class='btn btn-warning btnViewCotizacion'><i class='fa fa-eye'></i></button>";
                    } else {
                        return
                        "<button class='imprimir btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;"
                            + "<button class='btn btn-danger disabled'><i class='fa fa-edit'></i></button>&nbsp; "
                            + "<button class='btn btn-info'><i class='fa fa-times-circle'></i></button>&nbsp; " +
                            "<button class='btn btn-warning btnViewCotizacion'><i class='fa fa-eye'></i></button>";
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
    tablaCotizacion.on('draw.dt', function () {
        var PageInfo = $('#tablaCotizacion').DataTable().page.info();
        tablaCotizacion.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}


function listarOrden() {
    var fechaInicio = document.querySelector('#txtFechaInicio').value;
    var fechaFin = document.querySelector('#txtFechaFin').value;
    tablaCotizacion = $("#tablaCotizacion").DataTable({
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
            // "url": "../controlador/ingreso/controlador_ingreso.php?opcion=listar",
            "url": "../controlador/orden/controlador_orden.php?opcion=listar",
            data: {
                fechaInicio: fechaInicio,
                fechaFin: fechaFin,
            }
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "usuario_nombre" },
            { "data": "nombre_cliente" },
            { "data": "cotizacion_fecha" },
            { "data": "cotizacion_total" },
            { "data": "cotizacion_impuesto" },
            {
                "data": "cotizacion_estatus",
                render: function (data, type, row) {
                    // if (data === "INGRESADO") {
                    if (data === "INICIADO") {
                        return "<span class='badge badge-info badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else if (data === "ORDEN FACTURADA") {

                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },
            {
                "data": "cotizacion_estatus",
                render: function (data) {
                    if (data == "INICIADO") {
                        return "<button class='imprimirO btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;"
                            + "<button class='facturarOrden btn btn-success'><i class='fas fa-money-bill-wave'></i></button>&nbsp; "
                            + "<button class='anularO btn btn-danger'><i class='fa fa-times-circle'></i></button>&nbsp; "
                            + "<button class='editarO btn btn-info'><i class='fa fa-edit'></i></button>&nbsp; " +
                            "<button class='btn btn-warning btnViewOrden'><i class='fa fa-eye'></i></button>";
                    } else {
                        return "<button class='imprimirO btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;" +
                            // + "<button class='btn btn-danger disabled'><i class='fa fa-times-circle'></i></button>&nbsp; "   
                            // + "<button class='btn btn-info'><i class='fa fa-times-circle'></i></button>&nbsp; "     +
                            "<button class='btn btn-warning btnViewOrden'><i class='fa fa-eye'></i></button>";
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
    tablaCotizacion.on('draw.dt', function () {
        var PageInfo = $('#tablaCotizacion').DataTable().page.info();
        tablaCotizacion.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

function limpiarTablaMantenimiento() {
    tablaCotizacion.clear().draw();
}

async function llevarVistaCotizacion() {
    if (!accesos.includes('13-2')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    // cargarContenido('contenido-principal', 'cotizacion/vista_ingreso_cotizacion.php');
    try {
        let respuesta = await redirect();
        if (respuesta == 'OK') {

            ponerConfiguracion('guardar', 'cotizacion', '')
        }

    } catch (error) {
        console.log(error)
    }

}

async function llevarVistaOrden() {
    // cargarContenido('contenido-principal', 'cotizacion/vista_ingreso_cotizacion.php');
    if (!accesos.includes('13-3')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    try {
        let respuesta = await redirect();
        if (respuesta == 'OK') {

            ponerConfiguracion('guardar', 'orden', '')
        }

    } catch (error) {
        console.log(error)
    }

}

$('#tablaCotizacion').on('click', '.btnViewCotizacion', async function () {
    if (!accesos.includes('13-8')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tablaCotizacion.row($(this).parents('tr')).data();
    if (tablaCotizacion.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tablaCotizacion.row(this).data();
    }

    try {
        let respuesta = await redirect();
        if (respuesta == 'OK') {
            let idCotizacion = await llenarInputs(data);

            // console.log(idCotizacion)
            llenartablaDetalleOrden(idCotizacion);
            // llenartablaDetalleOrdenEditar(idCotizacion);
            CalcularResultadoCotVistar()

            $("#button-addon2").prop('disabled', true);
            $("#btnSelecVehiculo").prop('disabled', true);
            $("#btnGuardar").prop('disabled', true);
            $("#btnSeleccionar").prop('disabled', true);
        }
    } catch (error) {
        console.log(error);
    }
});

$('#tablaCotizacion').on('click', '.editarc', async function () {
    if (!accesos.includes('13-10')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }


    var data = tablaCotizacion.row($(this).parents('tr')).data();
    if (tablaCotizacion.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tablaCotizacion.row(this).data();
    }
    try {
        let respuesta = await redirect();
        if (respuesta == 'OK') {
            let idCotizacion = await llenarInputs(data);

            // console.log(idCotizacion)
            llenartablaDetalleOrdenEditar(idCotizacion);
            CalcularResultadoCotVistar()

            // $("#button-addon2").prop('disabled', true);
            $("#btnSelecVehiculo").prop('disabled', true);
            // $("#btnGuardar").prop('disabled', true);
            // $("#btnSeleccionar").prop('disabled', true);

            document.querySelector("#accion").value = 'editar';
            document.querySelector("#tipoOrden").value = 'cotizacion';
            document.querySelector("#idTransaccion").value = data['cotizacion_id'];
        }
    } catch (error) {
        console.log(error);
    }
});

$('#tablaCotizacion').on('click', '.btnViewOrden', async function () {
    if (!accesos.includes('13-7')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }

    var data = tablaCotizacion.row($(this).parents('tr')).data();
    if (tablaCotizacion.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tablaCotizacion.row(this).data();
    }
    try {
        let respuesta = await redirect();
        if (respuesta == 'OK') {
            let idCotizacion = await llenarInputsOrden(data);

            // console.log(idCotizacion)
            llenartablaDetalleOrdenO(idCotizacion);
            // llenartablaDetalleOrdenEditar(idCotizacion);
            CalcularResultadoCotVistar()

            $("#button-addon2").prop('disabled', true);
            $("#btnSelecVehiculo").prop('disabled', true);
            $("#btnGuardar").prop('disabled', true);
            $("#btnSeleccionar").prop('disabled', true);
        }
    } catch (error) {
        console.log(error);
    }
});

$('#tablaCotizacion').on('click', '.editarO', async function () {
    if (!accesos.includes('13-11')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }


    var data = tablaCotizacion.row($(this).parents('tr')).data();
    if (tablaCotizacion.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tablaCotizacion.row(this).data();
    }
    try {
        let respuesta = await redirect();
        if (respuesta == 'OK') {
            let idCotizacion = await llenarInputsOrden(data);

            // console.log(idCotizacion)
            llenartablaDetalleOrdenEditarO(idCotizacion);
            CalcularResultadoCotVistar()

            // $("#button-addon2").prop('disabled', true);
            $("#btnSelecVehiculo").prop('disabled', true);
            $("#button-addon2").prop('disabled', true);
            // $("#btnGuardar").prop('disabled', true);
            // $("#btnSeleccionar").prop('disabled', true);

            document.querySelector("#accion").value = 'editar';
            document.querySelector("#tipoOrden").value = 'orden';
            document.querySelector("#idTransaccion").value = data['cotizacion_id'];
        }
    } catch (error) {
        console.log(error);
    }
});

$('#tablaCotizacion').on('click', '.anularO', function () {

    if (!accesos.includes('13-6')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }


    var data = tablaCotizacion.row($(this).parents('tr')).data();
    if (tablaCotizacion.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tablaCotizacion.row(this).data();
    }
    try {
        Swal.fire({
            title: '¿ Esta seguro(a) que desea anular esta orden de trabajo?',
            text: "",
            icon: 'warning',
            showCancelButton: true,
            cancelButtonText: 'Cancelar',
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Anulalo !!!'
        }).then((result) => {
            if (result.isConfirmed) {

                // console.log(data)
                anularOrden(data.cotizacion_id)
            }
        })

    } catch (error) {
        console.log(error);
    }
});

$('#tablaCotizacion').on('click', '.imprimirc', function () {
    if (!accesos.includes('13-4')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    var data = tablaCotizacion.row($(this).parents('tr')).data();

    if (tablaCotizacion.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tablaIngreso.row(this).data();
    }
    window.open("../MPDF/reporte_cotizacion.php?codigo=" + parseInt(data.cotizacion_id)
        + "#zoom=100", "Reporte Cotizacion", "scrollbards=NO"); //'scrollbards=NO' Para que no deje editar la ruta
});

$('#tablaCotizacion').on('click', '.imprimirO', function () {

    var data = tablaCotizacion.row($(this).parents('tr')).data();

    if (tablaCotizacion.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tablaIngreso.row(this).data();
    }
    // window.open("../MPDF/reporte_fac_orden.php?codigo=" + parseInt(data.cotizacion_id)
    //     + "#zoom=100", "Reporte Orden", "scrollbards=NO"); //'scrollbards=NO' Para que no deje editar la ruta

    opcionImprimirOrden(data)
});

$('#tablaCotizacion').on('click', '.facturarOrden', function () {
    if (!accesos.includes('13-9')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }


    var data = tablaCotizacion.row($(this).parents('tr')).data();
    if (tablaCotizacion.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tablaCotizacion.row(this).data();
    }
    try {
        // console.log(data)
        totalDeTareasPendientes(data)
    } catch (error) {
        console.log(error);
    }
});



function redirect() {
    return new Promise((resolve) => {
        $("#contenido-principal").load('../vista/cotizacion/vista_ingreso_cotizacion.php');
        resolve('OK');
    });
}

function anularOrden(idOrden) {
    $.ajax({
        url: '../controlador/orden/controlador_orden.php?opcion=anular',
        type: 'POST',
        data: {
            idOrden: idOrden
        }
    }).done(function (resp) {
        console.log(resp)
        if (resp > 0) {
            $("#contenido-principal").load('../vista/cotizacion/vista_mantenimiento_cotizacion.php');
            // tablaCotizacion.ajax.reload();
            construirConfirmacion();
            Swal.fire('Mensaje de confirmacion', 'Orden de trabajo anulada correctamente', 'success');

            // alert('Se guardaria')
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });
}

function llenarInputs(data) {
    return new Promise((resolve) => {
        setTimeout(() => {
            // let { NOMBRE_CLIENTE, venta_ticomprobante, venta_seriecomprobante, venta_numcomprobante, transaccion_porcentaje, venta_id } = data;
            let { cotizacion_id, nombre_cliente, persona_nrodocumento, persona_correo, persona_telefono, persona_empresa, persona_id } = data;
            // $('#txtCliente').val(NOMBRE_CLIENTE);
            // $('#txtImpuesto').val((transaccion_porcentaje * 100) + '%');
            // $('#cbmTipoComprobante').val(venta_ticomprobante).trigger('change');
            // $('#txtSerieComprobante').val(venta_seriecomprobante);
            // $('#txtNumeroComprobante').val(venta_numcomprobante);
            // $('#btnGuardarVenta, #btnModalCliente, #btnModalProducto').prop('disabled', true);
            // $('#cont__porcentaje').remove()


            document.querySelector("#txtClienteCot").value = nombre_cliente;
            document.querySelector("#txtIdClienteCot").value = persona_id;
            // document.querySelector("#txtIdClienteCot").value = persona_id;
            document.querySelector("#txtIdentificacion").value = persona_nrodocumento;
            document.querySelector("#textNumCelular").value = persona_telefono;
            document.querySelector("#txtEmailClient").value = persona_correo;
            document.querySelector("#txtCompany").value = (persona_empresa == "" || persona_empresa == null) ? "" : persona_empresa;
            $("#cont__client").css("display", "block");

            resolve(cotizacion_id);

        }, 200);
    });
}

function llenarInputsOrden(data) {
    return new Promise((resolve) => {
        setTimeout(() => {
            // let { NOMBRE_CLIENTE, venta_ticomprobante, venta_seriecomprobante, venta_numcomprobante, transaccion_porcentaje, venta_id } = data;
            let { cotizacion_id, nombre_cliente, persona_nrodocumento, persona_correo, persona_telefono, persona_empresa, persona_id,
                kilometraje, marca_nom, nombre_mecanico, vehiculo_placa, modelo_nombre, vehiculo_tipo, vehiculo_num_motor, vehiculo_num_chasis,
                vehiculo_anio, vehiculo_transmision, id_mecanico, nivel_combustible, descripcion, id_vehiculo } = data;
            // $('#txtCliente').val(NOMBRE_CLIENTE);
            // $('#txtImpuesto').val((transaccion_porcentaje * 100) + '%');
            // $('#cbmTipoComprobante').val(venta_ticomprobante).trigger('change');
            // $('#txtSerieComprobante').val(venta_seriecomprobante);
            // $('#txtNumeroComprobante').val(venta_numcomprobante);
            // $('#btnGuardarVenta, #btnModalCliente, #btnModalProducto').prop('disabled', true);
            // $('#cont__porcentaje').remove()


            document.querySelector("#txtClienteCot").value = nombre_cliente;
            document.querySelector("#txtIdClienteCot").value = persona_id;
            // document.querySelector("#txtIdClienteCot").value = persona_id;
            document.querySelector("#txtIdentificacion").value = persona_nrodocumento;
            document.querySelector("#textNumCelular").value = persona_telefono;
            document.querySelector("#txtEmailClient").value = persona_correo;
            document.querySelector("#txtCompany").value = (persona_empresa == "" || persona_empresa == null) ? "" : persona_empresa;
            $("#cont__client").css("display", "block");




            document.querySelector("#txtIdVehiculo").value = id_vehiculo;
            document.querySelector("#txtPlaca").value = vehiculo_placa;
            document.querySelector("#txtMarca").value = marca_nom;
            document.querySelector("#txtModelo").value = modelo_nombre;
            document.querySelector("#txtTipo").value = vehiculo_tipo;
            document.querySelector("#txtMotor").value = vehiculo_num_motor;
            document.querySelector("#txtChasis").value = vehiculo_num_chasis;
            document.querySelector("#txtYear").value = vehiculo_anio;
            document.querySelector("#txtTransmision").value = vehiculo_transmision;

            document.querySelector("#txtMecanico").value = nombre_mecanico;
            document.querySelector("#txtIdMecanico").value = id_mecanico;
            document.querySelector("#txtKilometros").value = kilometraje;
            document.querySelector("#cboNivelCombustible").value = nivel_combustible;
            document.querySelector("#txtObservaciones").value = descripcion;


            $("#cont_vehiculo").css("display", "block");

            resolve(cotizacion_id);

        }, 200);
    });
}

function CalcularResultadoCotVistar() {
    return new Promise((resolve) => {
        setTimeout(() => {
            sumarTotalNeto()
        }, 500);
    });
}

function ponerConfiguracion(accion, tipo, transaccion) {
    return new Promise((resolve) => {
        setTimeout(() => {
            document.querySelector("#accion").value = accion;
            document.querySelector("#tipoOrden").value = tipo;
            document.querySelector("#idTransaccion").value = transaccion;
        }, 500);
    });
}

function llenartablaDetalleOrdenEditar(idCotizacion) {


    $.ajax({
        url: "../controlador/cotizacion/controlador_cotizacion.php?opcion=listarDetalleCotizacion",
        type: 'POST',
        data: { idCotizacion: idCotizacion }
    }).done(function (resp) {

        let rows = JSON.parse(resp).data;


        if (rows != null) {

            for (x of rows) {
                addProductoEditar(x);
            }
        }




    });

    // console.log(dataOrden)

}

function llenartablaDetalleOrden(idCotizacion) {


    $.ajax({
        url: "../controlador/cotizacion/controlador_cotizacion.php?opcion=listarDetalleCotizacion",
        type: 'POST',
        data: { idCotizacion: idCotizacion }
    }).done(function (resp) {

        let rows = JSON.parse(resp).data;


        if (rows != null) {

            for (x of rows) {
                addProductoVista(x);
            }
        }




    });

    // console.log(dataOrden)

}

function llenartablaDetalleOrdenO(idCotizacion) {

    // alert(idCotizacion)

    $.ajax({
        url: "../controlador/orden/controlador_orden.php?opcion=listarDetalleOrden",
        type: 'POST',
        data: { idCotizacion: idCotizacion }
    }).done(function (resp) {

        let rows = JSON.parse(resp).data;

        if (rows != null) {

            for (x of rows) {
                addProductoVista(x);
            }
        }




    });

    // console.log(dataOrden)

}

function llenartablaDetalleOrdenEditarO(idCotizacion) {


    $.ajax({
        url: "../controlador/cotizacion/controlador_cotizacion.php?opcion=listarDetalleCotizacion",
        type: 'POST',
        data: { idCotizacion: idCotizacion }
    }).done(function (resp) {

        let rows = JSON.parse(resp).data;


        if (rows != null) {

            for (x of rows) {
                addProductoEditar(x);
            }
        }




    });

    // console.log(dataOrden)

}


$('#txtFechaInicio, #txtFechaFin').change(function () {

    let tipoOrden = document.querySelector("#cmbMostrar").value;

    switch (tipoOrden) {
        case 'cotizaciones':
            listarCotizacion();
            break;

        case 'ordenes':
            listarOrden();
            break;

        default:
            break;
    }

});

var impuestoISV = 0;
function listarISV() {

    $.ajax({
        url: '../controlador/isv/controlador_isv.php?opcion=listar',
        type: 'POST',
        data: {}
    }).done(function (resp) {
        // console.log(resp)
        if (resp >= 0) {
            // console.log(resp)
            impuestoISV = resp;
        } else {
            Swal.fire('Mensaje de advertencia', 'No se pudo listar el ISV comuniquese con el administrador', 'warning');
        }
    });

}

var tablaCliente;
function listarClienteModal() {
    tablaCliente = $("#tablaCliente").DataTable({
        dom: 'lftiprB',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        "columnDefs": [
            {
                "targets": [7],
                "visible": false,
                "searchable": true
            },
            {
                "targets": [8],
                "visible": false,
                "searchable": true
            }
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
            { "data": "NOMBRE_PERSONA" },
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
            { "data": "persona_correo" },
            { "data": "persona_empresa" },
            {
                "data": "persona_estatus",
                render: function (data, type, row) {
                    if (data === "ACTIVO") {
                        // return "<button class='btn btn-info' id='btnAgregarCliente'><i class='fa fa-plus'></i></button>&nbsp;<button class='btn btn-success' disabled><i class='fa fa-check'></i></button>&nbsp;<button class='desactivar btn btn-danger'><i class='fa fa-times-circle'></i></button>";
                        return "<button class='btn btn-info' id='btnAgregarCliente'><i class='fa fa-plus'></i></button>";
                    } else {
                        // return "<button class='btn btn-info' id='btnAgregarCliente'><i class='fa fa-plus'></i></button>&nbsp;<button class='activar btn btn-success'><i class='fa fa-check'></i></button>&nbsp;<button class='btn btn-danger' disabled><i class='fa fa-times-circle'></i></button>";
                        return "<button class='btn btn-info' id='btnAgregarCliente'><i class='fa fa-plus'></i></button>";
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
    const { NOMBRE_PERSONA, persona_id, persona_nrodocumento, persona_telefono, persona_correo, cliente_empresa, cliente_estatus } = data;

    if (tablaCliente.row(this).child.isShown()) {
        var data = tablaCliente.row(this).data();
    }

    if (cliente_estatus == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'Debe seleccionar un cliente que este activo', 'warning');
    }
    document.querySelector("#txtClienteCot").value = NOMBRE_PERSONA;
    document.querySelector("#txtIdClienteCot").value = persona_id;
    document.querySelector("#txtIdentificacion").value = persona_nrodocumento;
    document.querySelector("#textNumCelular").value = persona_telefono;
    document.querySelector("#txtEmailClient").value = persona_correo;
    document.querySelector("#txtCompany").value = (cliente_empresa == "" || cliente_empresa == null) ? "" : cliente_empresa;
    $("#cont__client").css("display", "block");
    document.getElementById("btnSelecVehiculo").disabled = false;
    $("#modal_cliente").modal('hide');
    listarVehiculoCot();
});

$('#tablaVehiculo').on('click', '#btnAgregarVehiculo', function () {
    var data = tablaVehiculo.row($(this).parents('tr')).data();
    const { id_vehiculo, vehiculo_placa, marca_nombre, modelo_nombre, vehiculo_tipo, vehiculo_num_motor, vehiculo_num_chasis, vehiculo_anio, vehiculo_transmision, vehiculo_estado } = data;

    if (tablaVehiculo.row(this).child.isShown()) {
        var data = tablaVehiculo.row(this).data();
    }

    if (vehiculo_estado == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'Upps! El automovil esta desactivado', 'warning');
    }
    document.querySelector("#txtIdVehiculo").value = id_vehiculo;
    document.querySelector("#txtPlaca").value = vehiculo_placa;
    document.querySelector("#txtMarca").value = marca_nombre;
    document.querySelector("#txtModelo").value = modelo_nombre;
    document.querySelector("#txtTipo").value = vehiculo_tipo;
    document.querySelector("#txtMotor").value = vehiculo_num_motor;
    document.querySelector("#txtChasis").value = vehiculo_num_chasis;
    document.querySelector("#txtYear").value = vehiculo_anio;
    document.querySelector("#txtTransmision").value = vehiculo_transmision;

    $("#cont_vehiculo").css("display", "block");
    $("#modal__vehiculo").modal('hide');
});

$('#tablaUsuarioCot').on('click', '#btnAgregarMecanico', function () {
    var data = tablaUsuario.row($(this).parents('tr')).data();
    const { NOMBRE_PERSONA, usuario_id, usuario_estatus } = data;

    if (tablaUsuario.row(this).child.isShown()) {
        var data = tablaUsuario.row(this).data();
    }

    if (usuario_estatus == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'Upps! El mecanico esta desactivado', 'warning');
    }
    document.querySelector("#txtMecanico").value = NOMBRE_PERSONA;
    document.querySelector("#txtIdMecanico").value = usuario_id;
    $("#modal__usuario").modal('hide');
});


function preguntarGuardar() { // Funcion donde se pregunta que tipo de guardado hacer
    let accion = document.querySelector("#accion").value;
    let tipoOrden = document.querySelector("#tipoOrden").value;

    if (accion == 'guardar') {

        switch (tipoOrden) {
            case 'cotizacion':
                registrarCotizacion()
                break;

            case 'orden':
                registrarOrden()
                break;

            default:
                break;
        }

    } else if (accion == 'editar') {

        switch (tipoOrden) {
            case 'cotizacion':
                // Swal.fire('Se guardaria la edicion de la cotizacion', '', 'info')
                editarCotizacion()
                break;

            case 'orden':
                editarOrden()
                break;


            default:
                break;
        }





    }
}


function registrarCotizacion() {
    if (longitudTabla() == 0) {
        return Swal.fire('Mensaje de advertencia', 'El detalle debe tener productos y/o servicios para poder ser registrada', 'warning');
    }

    let impuesto = "0.00";
    let porcentaje = impuestoISV;
    let descuento = "0.00";
    let idCliente = document.querySelector('#txtIdClienteCot').value;
    let idUsuario = document.querySelector('#txtIdUsuarioLogeado').value;
    let idVehiculo = document.querySelector('#txtIdVehiculo').value;
    let observaciones = '';


    // let tipoComprobante = document.querySelector('#cbmTipoComprobante').value;
    // let serieComprobante = document.querySelector('#txtSerieComprobante').value;
    // let numeroComprobante = document.querySelector('#txtNumeroComprobante').value;

    if (idCliente.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor seleccione un cliente', 'warning');
    }

    // if (idVehiculo.length == 0) {
    //     return Swal.fire('Mensaje de advertencia', 'Por favor seleccione un vehiculo', 'warning');
    // }
    // if (serieComprobante.length == 0) {
    //     return Swal.fire('Mensaje de advertencia', 'El campo tipo de comprobante no debe estar vacio', 'warning');
    // }
    // if (numeroComprobante.length == 0) {
    //     return Swal.fire('Mensaje de advertencia', 'El campo numero de comprobante no debe estar vacio', 'warning');
    // }

    let total = document.querySelector('#lblTotalNeto').innerHTML.substr(22);
    impuesto = document.querySelector('#lblImpuesto').innerHTML.substr(20);
    // impuesto = 0.18;
    descuento = document.querySelector('#lblDescuento').innerHTML.substr(21);

    // if (tipoComprobante == "FACTURA") {
    //     porcentaje = document.querySelector('#txtImpuesto').value;
    //     if (porcentaje.length == 0) {
    //         return Swal.fire('Mensaje de advertencia', 'El campo impuesto no debe estar vacio', 'warning');
    //     }
    // } else {
    //     impuesto = "0.00";
    //     porcentaje = "0.00";
    //     descuento = "0.00";
    // }

    $.ajax({
        url: '../controlador/cotizacion/controlador_cotizacion.php?opcion=registrarCotizacion',
        type: 'POST',
        data: {
            idCliente: idCliente,
            idUsuario: idUsuario,
            total: total,
            impuesto: impuesto,
            porcentaje: porcentaje,
            descuento: descuento,
            observaciones: observaciones,
        }
    }).done(function (resp) {
        if (resp > 0) {
            // console.log(resp)
            registrarDetalleCotizacion(parseInt(resp));
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });
}

function registrarOrden() {

    if (longitudTabla() == 0) {
        return Swal.fire('Mensaje de advertencia', 'El detalle debe tener productos y/o servicios para poder ser registrada', 'warning');
    }

    if (!hayServicio()) {
        return Swal.fire('Mensaje de advertencia', 'Debe escoger por lo menos un servicio', 'warning');
    }

    let impuesto = "0.00";
    let porcentaje = impuestoISV;
    let descuento = "0.00";
    let idCliente = document.querySelector('#txtIdClienteCot').value;
    let idUsuario = document.querySelector('#txtIdUsuarioLogeado').value;

    let idVehiculo = document.querySelector('#txtIdVehiculo').value;
    let idMecanico = document.querySelector('#txtIdMecanico').value;
    let kilometraje = document.querySelector('#txtKilometros').value;
    let combustible = document.querySelector('#cboNivelCombustible').value;
    let observaciones = document.querySelector('#txtObservaciones').value;

    if (idCliente.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor seleccione un cliente', 'warning');
    }

    if (idVehiculo.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor seleccione un vehiculo', 'warning');
    }

    if (idMecanico.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor seleccione un mecanico', 'warning');
    }

    if (kilometraje.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor indique el kilometraje del vehiculo', 'warning');
    }

    if (combustible.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor indique el nivel de combustible', 'warning');
    }

    if (observaciones.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor ingrese las observaciones de la orden', 'warning');
    }


    let total = document.querySelector('#lblTotalNeto').innerHTML.substr(22);
    impuesto = document.querySelector('#lblImpuesto').innerHTML.substr(20);
    // impuesto = 0.18;
    descuento = document.querySelector('#lblDescuento').innerHTML.substr(21);


    // console.log(idCliente + " " + idUsuario + " " + total + " " + impuesto + " " + descuento)

    //  console.log(idVehiculo + ' ' + idMecanico + ' ' + kilometraje+ ' ' + combustible + ' ' + observaciones );


    $.ajax({
        url: '../controlador/orden/controlador_orden.php?opcion=registrarOrden',
        type: 'POST',
        data: {
            idCliente: idCliente,
            idUsuario: idUsuario,
            total: total,
            impuesto: impuesto,
            porcentaje: porcentaje,
            descuento: descuento,
            observaciones: observaciones,
            idMecanico: idMecanico,
            kilometraje: kilometraje,
            combustible: combustible,
            idVehiculo: idVehiculo,
        }
    }).done(function (resp) {

        // alert(resp)
        if (resp > 0) {
            // console.log(resp)
            registrarDetalleOrden(parseInt(resp));
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });

}

function registrarDetalleOrden(idOrden) {

    let idVehiculo = document.querySelector('#txtIdVehiculo').value;
    let idMecanico = document.querySelector('#txtIdMecanico').value;
    let kilometraje = document.querySelector('#txtKilometros').value;
    let combustible = document.querySelector('#cboNivelCombustible').value;
    let observaciones = document.querySelector('#txtObservaciones').value;

    $.ajax({
        url: '../controlador/orden/controlador_orden.php?opcion=registrarDetalleOrden',
        type: 'POST',
        data: {
            idOrden: idOrden,
            observaciones: observaciones,
            idMecanico: idMecanico,
            kilometraje: kilometraje,
            combustible: combustible,
            idVehiculo: idVehiculo,
        }
    }).done(function (resp) {

        // alert(resp)
        if (resp > 0) {
            // console.log(resp)
            registrarDetalleProSerOrden(parseInt(resp));

            // alert('Se guardo')
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });

}

function editarCotizacion() {

    if (longitudTabla() == 0) {
        return Swal.fire('Mensaje de advertencia', 'El detalle debe tener productos y/o servicios para poder ser registrada', 'warning');
    }

    let impuesto = "0.00";
    let porcentaje = impuestoISV;
    let descuento = "0.00";
    let idCliente = document.querySelector('#txtIdClienteCot').value;
    let idCotizacion = document.querySelector('#idTransaccion').value;
    let idUsuario = document.querySelector('#txtIdUsuarioLogeado').value;
    let idVehiculo = document.querySelector('#txtIdVehiculo').value;
    let observaciones = '';


    ;

    if (idCliente.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor seleccione un cliente', 'warning');
    }

    let total = document.querySelector('#lblTotalNeto').innerHTML.substr(22);
    impuesto = document.querySelector('#lblImpuesto').innerHTML.substr(20);
    // impuesto = 0.18;
    descuento = document.querySelector('#lblDescuento').innerHTML.substr(21);


    $.ajax({
        url: '../controlador/cotizacion/controlador_cotizacion.php?opcion=editarCotizacion',
        type: 'POST',
        data: {
            idCotizacion: idCotizacion,
            idCliente: idCliente,
            idUsuario: idUsuario,
            total: total,
            impuesto: impuesto,
            porcentaje: porcentaje,
            descuento: descuento,
            observaciones: observaciones,
        }
    }).done(function (resp) {
        if (resp > 0) {
            // console.log(resp)
            registrarDetalleCotizacion(idCotizacion);

            // alert('Se guardaria')
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });
}

function editarOrden() {

    if (longitudTabla() == 0) {
        return Swal.fire('Mensaje de advertencia', 'El detalle debe tener productos y/o servicios para poder ser registrada', 'warning');
    }
    if (!hayServicio()) {
        return Swal.fire('Mensaje de advertencia', 'Debe escoger por lo menos un servicio', 'warning');
    }


    let idCotizacion = document.querySelector('#idTransaccion').value;

    let impuesto = "0.00";
    let porcentaje = impuestoISV;
    let descuento = "0.00";
    let idCliente = document.querySelector('#txtIdClienteCot').value;
    let idUsuario = document.querySelector('#txtIdUsuarioLogeado').value;

    let idVehiculo = document.querySelector('#txtIdVehiculo').value;
    let idMecanico = document.querySelector('#txtIdMecanico').value;
    let kilometraje = document.querySelector('#txtKilometros').value;
    let combustible = document.querySelector('#cboNivelCombustible').value;
    let observaciones = document.querySelector('#txtObservaciones').value;

    if (idCliente.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor seleccione un cliente', 'warning');
    }

    if (idVehiculo.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor seleccione un vehiculo', 'warning');
    }

    if (idMecanico.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor seleccione un mecanico', 'warning');
    }

    if (kilometraje.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor indique el kilometraje del vehiculo', 'warning');
    }

    if (combustible.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor indique el nivel de combustible', 'warning');
    }

    if (observaciones.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Por favor ingrese las observaciones de la orden', 'warning');
    }


    let total = document.querySelector('#lblTotalNeto').innerHTML.substr(22);
    impuesto = document.querySelector('#lblImpuesto').innerHTML.substr(20);
    // impuesto = 0.18;
    descuento = document.querySelector('#lblDescuento').innerHTML.substr(21);

    $.ajax({
        url: '../controlador/orden/controlador_orden.php?opcion=editarOrden',
        type: 'POST',
        data: {
            idCotizacion: idCotizacion,
            idCliente: idCliente,
            idUsuario: idUsuario,
            total: total,
            impuesto: impuesto,
            porcentaje: porcentaje,
            descuento: descuento,
            observaciones: observaciones,
            idMecanico: idMecanico,
            kilometraje: kilometraje,
            combustible: combustible,
            idVehiculo: idVehiculo,
        }
    }).done(function (resp) {
        if (resp > 0) {
            editarDetalleOrden(idCotizacion);

            // alert('Se guardaria')
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });
}

function editarDetalleOrden(idOrden) {

    let idVehiculo = document.querySelector('#txtIdVehiculo').value;
    let idMecanico = document.querySelector('#txtIdMecanico').value;
    let kilometraje = document.querySelector('#txtKilometros').value;
    let combustible = document.querySelector('#cboNivelCombustible').value;
    let observaciones = document.querySelector('#txtObservaciones').value;

    $.ajax({
        url: '../controlador/orden/controlador_orden.php?opcion=editarDetalleOrden',
        type: 'POST',
        data: {
            idOrden: idOrden,
            observaciones: observaciones,
            idMecanico: idMecanico,
            kilometraje: kilometraje,
            combustible: combustible,
            idVehiculo: idVehiculo,
        }
    }).done(function (resp) {

        // alert(resp)
        if (resp > 0) {
            registrarDetalleProSerOrden(parseInt(resp));

            // alert('Se guardo')
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });

}


function registrarDetalleCotizacion(idCotizacion) {
    let arregloDescuento = [];
    let arregloProducto = [];
    let arregloCantidad = [];
    let arregloPrecio = [];

    // console.log(idCotizacion);

    $("#tablaDetalleOrden tbody#tbodyDetalleOrden tr").each(function (index, valor) {

        // console.log(valor)
        arregloProducto.push($(this).find('td').eq(0).text()); //eq(0) = es la posicion en la tabla donde se encuentra el idProducto 
        arregloCantidad.push($('#tablaDetalleOrden tbody#tbodyDetalleOrden tr .txtCantidad' + $(this).find('td').eq(0).text()).val());
        arregloPrecio.push($(this).find('td').eq(3).text());
        arregloDescuento.push($(this).find('td').eq(5).text());
    });


    // console.log(arregloDescuento)
    // console.log(arregloProducto)
    // console.log(arregloCantidad)
    // console.log(arregloPrecio)

    if (longitudTabla() == 0) {
        return Swal.fire('Mensaje de advertencia', 'El detalle del ingreso debe tener productos para poder ser registrada', 'warning');
    }

    let producto = arregloProducto.toString(); //Convirtiendo el arreglo en String porque no puedo llevar arreglos en la URL
    let cantidad = arregloCantidad.toString();
    let precio = arregloPrecio.toString();
    let descuento = arregloDescuento.toString();

    // console.log(producto)
    // console.log(cantidad)
    // console.log(precio)
    // console.log(descuento)

    $.ajax({
        url: '../controlador/cotizacion/controlador_cotizacion.php?opcion=registrarDetalleCotizacion',
        type: 'POST',
        data: {
            idCotizacion: idCotizacion,
            producto: producto,
            cantidad: cantidad,
            precio: precio,
            descuento: descuento
        }
    }).done(function (resp) {
        if (resp > 0) {
            Swal.fire({
                title: 'Datos de Confimacíon',
                text: "Datos guardados correctamente, nueva cotizacion registrada!",
                icon: 'success',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Imprimir Cotizacion'
            }).then((result) => {
                if (result.value) {
                    window.open("../MPDF/reporte_cotizacion.php?codigo=" + parseInt(idCotizacion)
                        + "#zoom=100", "Reporte Cotizacion", "scrollbards=NO"); //'scrollbards=NO' Para que no deje editar la ruta
                }
            });

            $("#contenido-principal").load('../vista/cotizacion/vista_mantenimiento_cotizacion.php');
            generarNotifiaciones();
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });
}

function registrarDetalleProSerOrden(idOrden) {
    let arregloDescuento = [];
    let arregloProducto = [];
    let arregloCantidad = [];
    let arregloPrecio = [];

    // console.log(idCotizacion);

    $("#tablaDetalleOrden tbody#tbodyDetalleOrden tr").each(function (index, valor) {

        arregloProducto.push($(this).find('td').eq(0).text()); //eq(0) = es la posicion en la tabla donde se encuentra el idProducto 
        arregloCantidad.push($('#tablaDetalleOrden tbody#tbodyDetalleOrden tr .txtCantidad' + $(this).find('td').eq(0).text()).val());
        arregloPrecio.push($(this).find('td').eq(3).text());
        arregloDescuento.push($(this).find('td').eq(5).text());
    });


    // console.log(arregloDescuento)
    // console.log(arregloProducto)
    // console.log(arregloCantidad)
    // console.log(arregloPrecio)

    if (longitudTabla() == 0) {
        return Swal.fire('Mensaje de advertencia', 'El detalle del ingreso debe tener productos para poder ser registrada', 'warning');
    }

    let producto = arregloProducto.toString(); //Convirtiendo el arreglo en String porque no puedo llevar arreglos en la URL
    let cantidad = arregloCantidad.toString();
    let precio = arregloPrecio.toString();
    let descuento = arregloDescuento.toString();

    // console.log(producto)
    // console.log(cantidad)
    // console.log(precio)
    // console.log(descuento)

    $.ajax({
        url: '../controlador/orden/controlador_orden.php?opcion=registrarDetalleProducto',
        type: 'POST',
        data: {
            idOrden: idOrden,
            producto: producto,
            cantidad: cantidad,
            precio: precio,
            descuento: descuento
        }
    }).done(function (resp) {

        // console.log(resp)
        if (resp > 0) {
            Swal.fire({
                title: 'Datos de Confimacíon',
                text: "Datos guardados correctamente, nueva orden registrada!",
                icon: 'success',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Imprimir Orden'
            }).then((result) => {
                if (result.value) {
                    if (!accesos.includes('13-12')) {
                        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
                    }
                    window.open("../MPDF/reporte_orden.php?codigo=" + idOrden
                        + "#zoom=100", "Reporte Orden", "scrollbards=NO"); //'scrollbards=NO' Para que no deje editar la ruta
                }
            });

            $("#contenido-principal").load('../vista/cotizacion/vista_mantenimiento_cotizacion.php');
            construirConfirmacion();
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });
}


function hayServicio() {
    let cantSer = 0;


    // console.log(idCotizacion);

    $("#tablaDetalleOrden tbody#tbodyDetalleOrden tr").each(function (index, valor) {

        if ($(this).find('td').eq(2).text() == 'SERVICIO') {
            cantSer++;
        }
    });

    if (cantSer > 0) return true;

    return false;
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

    if ($("#txtRepresenta").is(':checked')) {
        if (empresa == "") {
            return Swal.fire('Mensaje de advertencia', 'Tiene seleccionado la empresa por lo tanto debe llenar el campo de nombre de empresa', 'warning');
        }
    }

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

$("#txtRepresenta").click(function (e) {
    if ($(this).is(':checked')) {
        $("#cont__empresa").css("display", "block");
    } else {
        $("#cont__empresa").css("display", "none");
    }
});

var tablaVehiculo;
function listarVehiculoCot() {
    var idCliente = $("#txtIdClienteCot").val();
    tablaVehiculo = $("#tablaVehiculo").DataTable({
        dom: 'lftiprB', //Importante para Imprimir los botones
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        "columnDefs": [
            {
                "targets": [8],
                "visible": false,
                "searchable": true
            },
            {
                "targets": [9],
                "visible": false,
                "searchable": true
            },
            {
                "targets": [10],
                "visible": false,
                "searchable": true
            }
        ],
        "ordering": true,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controlador/vehiculo/controlador_vehiculo.php?opcion=listByClient",
            data: {
                idCliente: idCliente
            }
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "vehiculo_placa" },
            { "data": "marca_nombre" },
            { "data": "modelo_nombre" },
            { "data": "vehiculo_anio" },
            { "data": "vehiculo_tipo" },
            {
                "data": "vehiculo_imagen",
                render: function (data) {
                    return `<img src="../${data}" width="40px" class="img-circle m-r-10">`;
                }
            },
            {
                "data": "vehiculo_estado",
                render: function (data) {
                    if (data === "ACTIVO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },
            { "data": "vehiculo_num_motor" },
            { "data": "vehiculo_num_chasis" },
            { "data": "vehiculo_transmision" },
            { "defaultContent": "<button class='btn btn-info' id='btnAgregarVehiculo'><i class='fa fa-plus'></i></button>" },
        ],

        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaVehiculo.on('draw.dt', function () {
        var PageInfo = $('#tablaVehiculo').DataTable().page.info();
        tablaVehiculo.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

var tablaUsuario;
function listarUsuarioCot() {
    tablaUsuario = $("#tablaUsuarioCot").DataTable({
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
            "url": "../controlador/usuario/controlador_usuario.php?opcion=listByMechanic",
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "NOMBRE_PERSONA" },
            { "data": "persona_nrodocumento" },
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
            { "data": "persona_telefono" },
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
            { "defaultContent": "<button class='btn btn-info' id='btnAgregarMecanico'><i class='fa fa-plus'></i></button>" }

        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[4]).css('text-align', 'center');
            $($(nRow).find("td")[5]).css('text-align', 'center');
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaUsuario.on('draw.dt', function () {
        var PageInfo = $('#tablaUsuarioCot').DataTable().page.info();
        tablaUsuario.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

var tablaProd;
function listarProductoCot() {
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
            { "defaultContent": "<button class='btn btn-info' id='btnAgregarProducto'><i class='fa fa-plus'></i></button>" }
        ],

        "fnRowCallback": function (nRow) {
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

function addProductoGuardar(data) {
    let cantidad = 1;
    let descuento;
    const { producto_id, producto_nombre, prod_serv_tipo, producto_precioventa, producto_descuento, producto_oferta, producto_stock } = data;

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

    let subTotal = producto_precioventa;

    let datosAgregar = document.createElement('tr');

    datosAgregar.innerHTML = `
        <td for="id">${producto_id}</td>
        <td>${producto_nombre}</td>
        <td>${prod_serv_tipo}</td>
        <td class="precio${producto_id}">${producto_precioventa}</td>
        <td  style="width: 10%;">
            <input type="number" class="form-control txtCantidad${producto_id}" min="1" data-stock="${producto_stock}"  data-mensaje="NO"  value="${cantidad}" style="width: 85%;">
        </td>
        <td class="descuento${producto_id}">${(descuento)}</td>
        <td class="descuentoTotal${producto_id}">${(descuento)}</td>
        <td class="subTotal${producto_id}">${(subTotal)}</td>
        <td class="text-center">
            <button class="btn btn-danger" onclick="remove(this)"><i class="fa fa-trash"></i></button>
        </td>
    `;

    $("#tbodyDetalleOrden").append(datosAgregar);

    let registros = $('#tablaDetalleOrden').find('tbody > tr').get();

    // console.log(registros)

    registros.sort(function (a, b) {
        let valor1 = $(a).children('td').eq(2).text().toUpperCase();
        let valor2 = $(b).children('td').eq(2).text().toUpperCase();

        return valor1 < valor2 ? -1 : valor1 > valor2 ? 1 : 0;
    });

    $.each(registros, function (indice, elemento) {
        $('#tbodyDetalleOrden').append(elemento);
    });

    // console.log(registros)
    sumarTotalNeto();

    // tablaProd.ajax.reload();

    // table.rows.add(data).draw();

}

function addProductoEditar(data) {
    let cantidad = 1;
    let descuento;
    const { producto_id, producto_nombre, prod_serv_tipo, detalle_precio, detalle_descuento, producto_oferta, descuento_total, detalle_cantidad, SUB_TOTAL, producto_stock, detalletransaccion_id } = data;

    if (producto_oferta == "0") {
        descuento = 0;
    } else {
        // descuento = (producto_precioventa * producto_descuento).toFixed(2);
    }

    if (data.producto_estatus == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'Debe seleccionar un producto que este activo', 'warning');
    }
    if (verificarProductoExistente(producto_id)) {
        return Swal.fire('Mensaje de advertencia', 'El producto ya fue agregado a la tabla', 'warning');
    }

    // let subTotal = producto_precioventa ;

    let datosAgregar = document.createElement('tr');

    if (prod_serv_tipo == "PRODUCTO") {
        datosAgregar.innerHTML = `
        <td for="id">${producto_id}</td>
        <td>${producto_nombre}</td>
        <td>${prod_serv_tipo}</td>
        <td class="precio${producto_id}">${detalle_precio}</td>
        <td  style="width: 10%;">
            <input type="number" class="form-control txtCantidad${producto_id}" min="1" data-stock="${producto_stock}"  data-mensaje="NO"  value="${detalle_cantidad}" style="width: 85%;">
        </td>
        <td class="descuento${producto_id}">${(detalle_descuento)}</td>
        <td class="descuentoTotal${producto_id}">${(descuento_total)}</td>
        <td class="subTotal${producto_id}">${(SUB_TOTAL)}</td>
        <td class="text-center">
            <button class="btn btn-danger " onclick="hayTareaOrden(this, ${detalletransaccion_id})" ><i class="fa fa-trash"></i></button>
        </td>
    `;
    } else {
        datosAgregar.innerHTML = `
        <td for="id">${producto_id}</td>
        <td>${producto_nombre}</td>
        <td>${prod_serv_tipo}</td>
        <td class="precio${producto_id}">${detalle_precio}</td>
        <td  style="width: 10%;">
            <input type="number" class="form-control txtCantidad${producto_id}" min="1" value="${detalle_cantidad}" style="width: 85%;" disabled>
        </td>
        <td class="descuento${producto_id}">${(detalle_descuento)}</td>
        <td class="descuentoTotal${producto_id}">${(descuento_total)}</td>
        <td class="subTotal${producto_id}">${(SUB_TOTAL)}</td>
        <td class="text-center">
            <button class="btn btn-danger " onclick="hayTareaOrden(this, ${detalletransaccion_id})" ><i class="fa fa-trash"></i></button>
            </td>
            `;
        // <button class="btn btn-danger " onclick="remove(this)" ><i class="fa fa-trash"></i></button>
    }

    $("#tbodyDetalleOrden").append(datosAgregar);

    let registros = $('#tablaDetalleOrden').find('tbody > tr').get();

    // console.log(registros)

    registros.sort(function (a, b) {
        let valor1 = $(a).children('td').eq(2).text().toUpperCase();
        let valor2 = $(b).children('td').eq(2).text().toUpperCase();

        return valor1 < valor2 ? -1 : valor1 > valor2 ? 1 : 0;
    });

    $.each(registros, function (indice, elemento) {
        $('#tbodyDetalleOrden').append(elemento);
    });

    // console.log(registros)
    sumarTotalNeto();

    // tablaProd.ajax.reload();

    // table.rows.add(data).draw();
}

function addProductoVista(data) {
    let cantidad = 1;
    let descuento;
    const { producto_id, producto_nombre, prod_serv_tipo, detalle_precio, detalle_descuento, producto_oferta, descuento_total, detalle_cantidad, SUB_TOTAL } = data;

    if (producto_oferta == "0") {
        descuento = 0;
    } else {
        // descuento = (producto_precioventa * producto_descuento).toFixed(2);
    }

    // if (data.producto_estatus == "INACTIVO") {
    //     return Swal.fire('Mensaje de advertencia', 'Debe seleccionar un producto que este activo', 'warning');
    // }
    // if (verificarProductoExistente(producto_id)) {
    //     return Swal.fire('Mensaje de advertencia', 'El producto ya fue agregado a la tabla', 'warning');
    // }

    // let subTotal = producto_precioventa ;

    let datosAgregar = document.createElement('tr');

    datosAgregar.innerHTML = `
        <td for="id">${producto_id}</td>
        <td>${producto_nombre}</td>
        <td>${prod_serv_tipo}</td>
        <td class="precio${producto_id}}">${detalle_precio}</td>
        <td  style="width: 10%;">
            <input type="number" class="form-control txtCantidad${producto_id}}" min="1" value="${detalle_cantidad}" style="width: 85%;" readonly>
        </td>
        <td class="descuento${producto_id}}">${(detalle_descuento)}</td>
        <td class="descuentoTotal${producto_id}}">${(descuento_total)}</td>
        <td class="subTotal${producto_id}}">${(SUB_TOTAL)}</td>
        <td class="text-center">
            <button class="btn btn-danger " onclick="remove(this)" disabled><i class="fa fa-trash"></i></button>
        </td>
    `;

    $("#tbodyDetalleOrden").append(datosAgregar);

    let registros = $('#tablaDetalleOrden').find('tbody > tr').get();

    // console.log(registros)

    registros.sort(function (a, b) {
        let valor1 = $(a).children('td').eq(2).text().toUpperCase();
        let valor2 = $(b).children('td').eq(2).text().toUpperCase();

        return valor1 < valor2 ? -1 : valor1 > valor2 ? 1 : 0;
    });

    $.each(registros, function (indice, elemento) {
        $('#tbodyDetalleOrden').append(elemento);
    });

    // console.log(registros)
    sumarTotalNeto();

    // tablaProd.ajax.reload();

    // table.rows.add(data).draw();
}

$('#tablaProd').on('click', '#btnAgregarProducto', function () {

    var data = tablaProd.row($(this).parents('tr')).data();

    if (tablaProd.row(this).child.isShown()) {
        var data = tablaProd.row(this).data();
    }

    // console.log(data)

    if (data.producto_stock == "0") {
        return Swal.fire('Mensaje de advertencia', 'El producto ya no tiene stock, no se puede vender', 'warning');
    }

    let accion = document.querySelector("#accion").value;
    let tipoOrden = document.querySelector("#tipoOrden").value;


    addProductoGuardar(data)
    if (accion == '') {
    } else if (accion == 'editar') {
        // addProductoEditar(data);
    }




});


var tablaServicio;
function listarServicioCot() {
    tablaServicio = $("#tablaServicio").DataTable({
        dom: 'lftiprB', //Importante para Imprimir los botones
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        "ordering": false,
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
            { "defaultContent": "<button class='btn btn-info' id='btnAgregarServicio'><i class='fa fa-plus'></i></button>" }
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


function addServicioGuardar(data) {
    let cantidad = 1;
    let descuento;
    const { producto_id, producto_nombre, prod_serv_tipo, producto_precioventa, producto_descuento, producto_oferta } = data;

    if (producto_oferta == "0") {
        descuento = 0;
    } else {
        descuento = (producto_precioventa * producto_descuento).toFixed(2);
    }

    if (data.producto_estatus == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'Debe seleccionar un servicio que este activo', 'warning');
    }
    if (verificarProductoExistente(producto_id)) {
        return Swal.fire('Mensaje de advertencia', 'El servicio ya fue agregado a la tabla', 'warning');
    }

    let subTotal = producto_precioventa;

    let datosAgregar = document.createElement('tr');

    datosAgregar.innerHTML = `
        <td for="id">${producto_id}</td>
        <td>${producto_nombre}</td>
        <td>${prod_serv_tipo}</td>
        <td class="precio${producto_id}">${producto_precioventa}</td>
        <td  style="width: 10%;">
        <input type="number" class="form-control txtCantidad${producto_id}" value="1" style="width: 85%;" disabled>
        </td>
        <td class="descuento${producto_id}">${(descuento)}</td>
        <td class="descuentoTotal${producto_id}">${(descuento)}</td>
        <td class="subTotal${producto_id}">${(subTotal)}</td>
        <td class="text-center">
            <button class="btn btn-danger" onclick="remove(this)"><i class="fa fa-trash"></i></button>
        </td>
    `;


    $("#tbodyDetalleOrden").append(datosAgregar);

    // console.log(registros)

    // tablaProd.ajax.reload();

    // table.rows.add(data).draw();

    let registros = $('#tablaDetalleOrden').find('tbody > tr').get();

    // console.log(registros)

    registros.sort(function (a, b) {
        let valor1 = $(a).children('td').eq(2).text().toUpperCase();
        let valor2 = $(b).children('td').eq(2).text().toUpperCase();

        return valor1 < valor2 ? -1 : valor1 > valor2 ? 1 : 0;
    });

    $.each(registros, function (indice, elemento) {
        $('#tbodyDetalleOrden').append(elemento);
    });


    sumarTotalNeto();

}


$('#tablaServicio').on('click', '#btnAgregarServicio', function () {

    var data = tablaServicio.row($(this).parents('tr')).data();

    if (tablaServicio.row(this).child.isShown()) {
        var data = tablaServicio.row(this).data();
    }


    // if (data.producto_stock == "0") {
    //     return Swal.fire('Mensaje de advertencia', 'El producto ya no tiene stock, no se puede vender', 'warning');
    // }

    let accion = document.querySelector("#accion").value;
    let tipoOrden = document.querySelector("#tipoOrden").value;


    if (accion == '') {
    }
    addServicioGuardar(data)

});



$('#tablaDetalleOrden tbody#tbodyDetalleOrden').on('mouseover', 'tr', function (e) {

    for (let i = 0; i < longitudTabla(); i++) {

        let x = $(this).find('td').eq(0).text();
        $(this).on('change', '.txtCantidad' + x, function () {
            let cantidad = document.querySelector('.txtCantidad' + x).value;

            let filaSeleccionada = e.target.parentNode.parentNode;
            let stockByRow = $('.txtCantidad' + x).attr('data-stock');
            let mensaje = $('.txtCantidad' + x).attr('data-mensaje');

            let tipoOrden = document.querySelector("#tipoOrden").value;

            if (parseFloat(cantidad) > parseFloat(stockByRow)) {
                let nameProduct = $('.txtCantidad' + x).attr('data-name');

                if (tipoOrden == "orden") {
                    $('.txtCantidad' + x).val(stockByRow);
                    return Swal.fire('Mensaje de advertencia', 'La cantidad no debe superar el stock existente del producto', 'warning');
                } else {
                    $(this).css("background-color", "yellow");

                    // console.log(mensaje)
                    if (mensaje == "NO") {
                        $('.txtCantidad' + x).attr('data-mensaje', 'SI');
                        Swal.fire('Mensaje de advertencia', 'Se ha sobrepasado el stock existente del producto', 'warning');
                    }
                }
            } else {
                $('.txtCantidad' + x).attr('data-mensaje', 'NO');
                $(this).css("background-color", "white");
            }

            let precio = filaSeleccionada.querySelector('.precio' + x).textContent;
            // console.log(cantidad*precio) 
            let subTotal = cantidad * precio;
            let proDescuento = filaSeleccionada.querySelector('.descuento' + x).textContent;
            //  let subTotal = parseFloat(precio) * parseFloat(cantidad);
            let descuento = cantidad * parseFloat(proDescuento);

            filaSeleccionada.querySelector('.subTotal' + x).textContent = subTotal.toFixed(2);
            filaSeleccionada.querySelector('.descuentoTotal' + x).textContent = descuento.toFixed(2);
            sumarTotalNeto();
        });
    }
});


function longitudTabla() {
    let contador = 0;
    $("#tablaDetalleOrden tbody#tbodyDetalleOrden tr").each(function () {
        contador++;
    });
    return contador;
}

//UTILES
function abrirModal(tipoModal) {
    if (tipoModal == 'cliente') {
        $("#modal_cliente").modal('show');
    } else if (tipoModal == "vehiculo") {
        $("#modal__vehiculo").modal('show');
    } else if (tipoModal == "servicios") {
        $("#modal__servicios").modal('show');

    } else {
        $("#modal__usuario").modal('show');
    }
}

function remove(t) {
    var dt = t.parentNode;
    var tr = dt.parentNode;
    var table = tr.parentNode;
    table.removeChild(tr);
    sumarTotalNeto();
}


function verificarProductoExistente(id) {
    let idVerificar = document.querySelectorAll('#tablaDetalleOrden td[for="id"]');
    return [].filter.call(idVerificar, td => td.textContent === id).length === 1;
}


function sumarTotalNeto() {

    // console.log('Entro')

    let arregloTotal = new Array();
    let arregloDescuento = new Array();
    let contador = 0;
    let total = 0;
    let subTotal = 0;
    let descuentoTotal = 0;
    let impuestoTotal = 0;
    // let impuesto = document.querySelector('#txtImpuesto').value;
    let impuesto = impuestoISV
    // let tipoComprobante = document.querySelector('#cbmTipoComprobante').value;

    $("#tablaDetalleOrden tbody#tbodyDetalleOrden tr").each(function () {
        arregloDescuento.push($(this).find('td').eq(6).text()); //eq(4) = Descuento, obtenemos el subtotal por cada fila que tenga la tabla
        arregloTotal.push($(this).find('td').eq(7).text()); //eq(5) = SubTotal, obtenemos el subtotal por cada fila que tenga la tabla
        contador++;
    });

    for (let i = 0; i < contador; i++) {
        var suma = arregloTotal[i];
        subTotal = ((parseFloat(subTotal) + parseFloat(suma)).toFixed(2)); //toFixed(2) = dos numeros decimales despues del punto
        descuentoTotal = (parseFloat(descuentoTotal) + parseFloat(arregloDescuento[i]));
        impuestoTotal = parseFloat(subTotal * impuesto).toFixed(2);
    }

    // subTotal-=descuentoTotal;
    subTotal -= 0;

    total = (parseFloat(subTotal) + parseFloat(impuestoTotal)) - parseFloat(descuentoTotal);

    // if (tipoComprobante == "FACTURA") {
    $('#lblImpuesto').html("<b>ISV " + (impuesto * 100) + "% : </b>L. " + impuestoTotal);
    $('#lblDescuento').html("<b>Descuento: </b>L. " + parseFloat(descuentoTotal).toFixed(2));
    $('#lblSubtotal').html("<b>Sub Total: </b> L. " + subTotal.toFixed(2));
    $('#lblTotalNeto').html("<b>Total Neto: </b> L. " + total.toFixed(2));
    // } else {
    $('#lblTotalNeto').html("<b>Total Neto: </b> L. " + total.toFixed(2));
    // }
}

function abrirModalFacturar(data) {


    document.querySelector('#txtTotal').value = data.cotizacion_total;
    document.querySelector('#txtImpuesto').value = data.cotizacion_impuesto;
    document.querySelector('#txtSubtotal').value = data.subtotal;
    document.querySelector('#txtDescuento').value = data.descuento;
    document.querySelector('#txtIdOrden').value = data.cotizacion_id;
    document.querySelector('#txtCliente').value = data.nombre_cliente;


    lastInvoiceNumber();
    maximumInvoiceNumber();


    $("#modal_registro").modal({ backdrop: 'static', keyboard: false });
    $("#modal_registro").modal('show');
}


function facturarOrden() {
    let montoR = document.querySelector('#txtMontoR').value
    let totalPagar = document.querySelector('#txtTotal').value
    let idOrden = document.querySelector('#txtIdOrden').value
    let numFact = document.querySelector('#txtNumeroComprobante').value
    let numCom = document.querySelector('#txtSerieComprobante').value

    // console.log('valor = ' +montoR)    
    if (montoR.length == 0) return Swal.fire('Oopss', 'El valor del pago no puede estar vacio', 'warning');

    if (!isNaN(montoR)) {

        cambio = (montoR - totalPagar)

        if (cambio < 0) {
            document.querySelector('#txtDevolver').value = "";
            return Swal.fire('Oopss', 'El valor del pago no debe ser menor al total a pagar', 'warning');
        }


        $.ajax({
            url: '../controlador/orden/controlador_orden.php?opcion=facturar',
            type: 'POST',
            data: {
                idOrden: idOrden,
                montoR: montoR,
                numFact: numFact,
                numCom: numCom,
            }
        }).done(function (resp) {
            console.log(resp)
            if (resp > 0) {

                if (resp == 1) {
                    tablaCotizacion.ajax.reload();
                    $("#modal_registro").modal('hide');
                    document.querySelector('#frmFacturar').reset(); //Limpiamos todos los inputs

                    Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente, cambio: ' + (cambio.toFixed(2)) + '', 'success');
                } else {
                    Swal.fire('Mensaje de advertencia', 'La marca ingresada ya se encuentra en el sistema', 'warning');
                }

            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        });

    } else {
        return Swal.fire('Oopss', 'Valor ingresado no valido', 'warning');
    }


}

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

function totalDeTareasPendientes(data) {
    let idOrden = data.cotizacion_id
    $.ajax({
        url: '../controlador/orden/controlador_orden.php?opcion=numTareas',
        type: 'POST',
        data: {
            idOrden: idOrden
        }
    }).done(function (resp) {

        if (resp == 0) {
            abrirModalFacturar(data)
        } else {
            return Swal.fire('Mensaje de advertencia', 'No se puede facturar, la orden tiene tareas pendientes(' + resp + ')', 'warning');
        }
    });

}

function construirConfirmacion() {
    let div = document.createElement('div');
    div.id = 'ejecutar__notificacion';
    document.querySelector('.wrapper .main-footer').appendChild(div);
}

function opcionImprimirOrden(data) {
    Swal.fire({
        title: '¿Que desea imprimir?',
        showDenyButton: true,
        showCancelButton: true,
        confirmButtonText: 'Orden',
        denyButtonText: `Factura`,
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            if (!accesos.includes('13-12')) {
                return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
            }
            window.open("../MPDF/reporte_orden.php?codigo=" + parseInt(data.cotizacion_id)
                + "#zoom=100", "Reporte Orden", "scrollbards=NO"); //'scrollbards=NO' Para que no deje editar la ruta
        } else if (result.isDenied) {
            if (data.cotizacion_estatus == "ORDEN FACTURADA") {

                if (!accesos.includes('13-13')) {
                    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
                }
                window.open("../MPDF/reporte_fac_orden.php?codigo=" + parseInt(data.cotizacion_id)
                    + "#zoom=100", "Reporte Orden", "scrollbards=NO"); //'scrollbards=NO' Para que no deje editar la ruta
            } else {

                Swal.fire('La orden no ha sido facturada', '', 'error')
            }
        }
    })
}


function hayTareaOrden(fila, idDetalle) {
    //  console.log(fila)
    //  console.log(idDetalle)
    // let id = data.
    $.ajax({
        url: '../controlador/orden/controlador_orden.php?opcion=comDetalleOrden',
        type: 'POST',
        data: {
            idDetalle: idDetalle
        }
    }).done(function (resp) {
        // console.log(resp)
        if (resp == 0) {
            remove(fila)
        } else {
            Swal.fire('Mensaje de advertencia', 'Este servicio no se puede eliminar, ya que esta asignado en tareas', 'warning');
        }
    });

}



