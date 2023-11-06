var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}


var tablaBitacora;
function listarBitacora() {
    var fechaInicio = document.querySelector('#txtFechaInicio').value;
    var fechaFin = document.querySelector('#txtFechaFin').value;

    tablaBitacora = $("#tablaBitacora").DataTable({
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
            "url": "../controlador/bitacora/controlador_bitacora.php?opcion=listar",
            data: {
                fechaInicio: fechaInicio,
                fechaFin: fechaFin,
            }
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "usuario_nombre" },
            { "data": "bitacora_tabla" },
            { "data": "bitacora_fecha_hora" },
            { "data": "nombre" },
            { "data": "bitacora_accion" },
            { "data": "bitacora_descripcion" },
            { "data": "ip_publica" },

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
    tablaBitacora.on('draw.dt', function () {
        var PageInfo = $('#tablaBitacora').DataTable().page.info();
        tablaBitacora.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}


$('#txtFechaInicio, #txtFechaFin').change(function () {

    listarBitacora();
});
