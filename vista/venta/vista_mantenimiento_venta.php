<?php
session_start();
if (!isset($_SESSION['S_IDUSUARIO'])) { 
    header('Location: ../login.php');
}

echo "<script> var accesos = [];</script>";

foreach ($_SESSION['S_ACCESOS'] as $ac) {
    echo "<script>  accesos.push('" . $ac . "')</script>";
}
?>

<script src="../js/console_venta.js?rev=<?php echo time(); ?>"></script>

<div class="content-header">
    <div class="container-fluid border p-3 shadow-lg rounded">
        <div class="row">
            <div class="col-md-12">
                <div class="ibox ibox-default">

                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <h3 class="m-0">Mantenimiento de venta</h3>
                        </div>
                        <div class="col-sm-6 text-right">
                            <button class="btn btn-primary px-5" id="btnReporteVenta">Reporte Venta</button>
                            <button class="btn btn-info px-5" id="btnNewVenta">Nueva Venta</button>
                        </div>
                    </div>

                    <div class="ibox-body">
                        <div class="row">
                            <div class="col-lg-6 mb-2">
                                <label for=""><b>Fecha Inicio</b></label>
                                <input type="date" id="txtFechaInicio" class="form-control">
                            </div>
                            <div class="col-lg-6 mb-2">
                                <label for=""><b>Fecha Fin</b></label>
                                <input type="date" id="txtFechaFin" class="form-control">
                            </div>
                        </div>
                        <hr>
                        <table id="tablaVenta" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Usuario</th>
                                    <th>Cliente</th>
                                    <th class="text-center">Tipo Comprobante</th>
                                    <th class="text-center">Numero Comprobante</th>
                                    <th class="text-center">Fecha</th>
                                    <th>Total</th>
                                    <th class="text-center">Impuesto</th>
                                    <th>Estado</th>
                                    <th>Acci&oacute;n</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>Usuario</th>
                                    <th>Cliente</th>
                                    <th class="text-center">Tipo Comprobante</th>
                                    <th class="text-center">Numero Comprobante</th>
                                    <th class="text-center">Fecha</th>
                                    <th>Total</th>
                                    <th class="text-center">Impuesto</th>
                                    <th>Estado</th>
                                    <th>Acci&oacute;n</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../js/notificaciones.js"></script>
<script>
    $(document).ready(function() {
        if (!accesos.includes('12-1')) {
            $('#txtFechaInicio, #txtFechaFin').prop('disabled', true);
        } else {
            $('#txtFechaInicio, #txtFechaFin').prop('disabled', false);
        }

        var fecha = new Date();
        var year = fecha.getFullYear();
        var mes = fecha.getMonth() + 1;
        var dia = fecha.getDate();

        //Esto lo hacemos porque en en input:date el dia se obtiene asi: 01,02,03,04,05,06,07,08,09
        //Y fecha.getDay() nos da los dias asi: 1, 2, 3, 4, 5, 6, 7, 8, 9 
        //De esa forma podre hacer la busqueda de forma correcta
        if (dia < 10) {
            dia = '0' + dia;
        }
        if (mes < 10) {
            mes = '0' + mes;
        }
        document.querySelector('#txtFechaInicio').value = year + '-' + mes + '-' + '01';
        document.querySelector('#txtFechaFin').value = year + '-' + mes + '-' + dia;
        listarVenta();
        // generarNotifiaciones();
    });
</script>