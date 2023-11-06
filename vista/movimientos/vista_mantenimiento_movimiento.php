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

<script src="../js/movimientos.js?rev=<?php echo time(); ?>"></script>

<div class="content-header" id="contenido__header">
    <div class="container-fluid border p-3 shadow-lg rounded">
        <div class="row">
            <div class="col-md-12">
                <div class="ibox ibox-default">

                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <h3 class="m-0">Mantenimiento de salidas</h3>
                        </div>
                        <div class="col-sm-6 text-right">
                            <button class="btn btn-info px-5" id="btnAgregarMovimiento">Nueva Salida</button>
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
                        <table id="tblMovimientos" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Usuario</th>
                                    <th>Fecha/Hora</th>
                                    <th>Motivo</th>
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
                                    <th>Fecha/Hora</th>
                                    <th>Motivo</th>
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
        if (!accesos.includes('14-1')) {
            $('#txtFechaInicio, #txtFechaFin').prop('disabled', true);
        } else {
            $('#txtFechaInicio, #txtFechaFin').prop('disabled', false);
        }

        var fecha = new Date();
        var year = fecha.getFullYear();
        var mes = fecha.getMonth() + 1;
        var dia = fecha.getDate();

        if (dia < 10) {
            dia = '0' + dia;
        }
        if (mes < 10) {
            mes = '0' + mes;
        }
        document.querySelector('#txtFechaInicio').value = year + '-' + mes + '-' + '01';
        document.querySelector('#txtFechaFin').value = year + '-' + mes + '-' + dia;
        listarMovimientos();
        // generarNotifiaciones();
    });
</script>