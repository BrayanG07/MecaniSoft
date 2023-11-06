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

<script src="../js/cotizacion.js?rev=<?php echo time(); ?>"></script>

<div class="content-header">
    <div class="container-fluid border p-3 shadow-lg rounded">
        <div class="row">
            <div class="col-md-12">
                <div class="ibox ibox-default">

                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <h3 class="m-0">Mantenimiento de cotizaciónes y ordenes</h3>
                        </div>
                        <div class="col-sm-6 text-right">

                            <div class="cont_cotizacion" style="display: none;">

                                <button class="btn btn-info" onclick="llevarVistaCotizacion()">Nueva Cotización</button>
                            </div>

                            <div class="cont_orden" style="display: none;">

                                <button class="btn btn-info" onclick="llevarVistaOrden()">Nueva Orden de trabajo</button>
                            </div>

                        </div>
                    </div>

                    <div class="ibox-body">
                        <div class="row">
                            <div class="col-lg-4 mb-2">
                                <label for=""><b>Fecha Inicio</b></label>
                                <input type="date" id="txtFechaInicio" class="form-control">
                            </div>
                            <div class="col-lg-4 mb-2">
                                <label for=""><b>Fecha Fin</b></label>
                                <input type="date" id="txtFechaFin" class="form-control">
                            </div>

                            <div class="col-lg-4 mb-2">
                                <label for=""><b>Tipo de registro</b></label>
                                <select class="custom-select " id='cmbMostrar'>
                                    <option value=""> -- SELECCIONE -- </option>
                                    <option value="cotizaciones">COTIZACIONES</option>
                                    <option value="ordenes">ORDENES DE TRABAJO</option>
                                </select>
                            </div>
                        </div>
                        <hr>
                        <table id="tablaCotizacion" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Usuario</th>
                                    <th>Cliente</th>
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

<!-- VENTANA MODAL REGISTRAR  -->
<div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Registro de facturacion</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="frmFacturar">

                    <input type="hidden" id="txtUsuarioLog" value="<?php echo $_SESSION['S_IDUSUARIO']; ?>">
                    <input type="text" id="txtIdOrden" hidden>

                    <div class="col-lg-12">
                        <label for="">N° Factura: </label>
                        <input type="text" class="form-control" id="txtNumeroComprobante" readonly>
                        <input type="text" class="form-control" id="txtSerieComprobante" readonly hidden>
                    </div>

                    <div class="col-lg-12">
                        <label for="">Cliente : </label>
                        <input type="text" class="form-control" id="txtCliente" readonly>
                    </div>

                    <div class="col-lg-12">
                        <label for="">SubTotal: </label>
                        <input type="text" class="form-control" id="txtSubtotal" readonly>
                    </div>

                    <div class="col-lg-12">
                        <label for="">Descuento:</label>
                        <input type="text" class="form-control" id="txtDescuento" readonly>
                    </div>

                    <div class="col-lg-12">
                        <label for="">Impuesto:</label>
                        <input type="text" class="form-control" id="txtImpuesto" readonly>
                    </div>

                    <div class="col-lg-12">
                        <label for="">Total a pagar:</label>
                        <input type="text" class="form-control" id="txtTotal" readonly>
                    </div>

                    <div class="col-lg-12">
                        <label for="">Monto a recibido:</label>
                        <input type="text" class="form-control" id="txtMontoR" placeholder="00.00" onkeypress="return soloNumeros(event)" maxlength="15">
                    </div>

                    <div class="col-lg-12">
                        <label for="">Devolver:</label>
                        <input type="text" class="form-control" id="txtDevolver" placeholder="00.00" value="00.00" readonly>
                    </div>





                    <!-- <div class="col-lg-12">
            <label for="">Estado:</label>

                <select class="form-control" name="txtEstado" id="txtEstado">
                <option value="ACTIVO">ACTIVO</option>
                <option value="INACTIVO">INACTIVO</option>
              </select>
        
          </div> -->
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" onclick="facturarOrden()">Facturar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN VENTANA MODAL REGISTRAR  -->

<script src="../js/notificaciones.js"></script>
<script>
    $(document).ready(function() {
        if (!accesos.includes('13-1')) {
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


        $('#cmbMostrar').change(function() {
            let vista = document.querySelector('#cmbMostrar').value;

            if (vista == 'cotizaciones') {
                // if (!accesos.includes('13-2')) {
                //     return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
                // }
                $(".cont_cotizacion").css("display", "block");
                $(".cont_orden").css("display", "none");
                listarCotizacion();

            } else if (vista == 'ordenes') {
                // if (!accesos.includes('13-3')) {
                //     return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
                // }
                $(".cont_orden").css("display", "block");
                $(".cont_cotizacion").css("display", "none");
                listarOrden();
            } else {

                $(".cont_cotizacion").css("display", "none");
                $(".cont_orden").css("display", "none");

                limpiarTablaMantenimiento();
            }


        });


        $('#txtMontoR').change(function() {
            let montoR = document.querySelector('#txtMontoR').value
            let totalPagar = document.querySelector('#txtTotal').value

            let cambio = 0

            // console.log('valor = ' +montoR)    

            if (montoR.length == 0) return Swal.fire('Oopss', 'El valor del pago no puede estar vacio', 'warning');

            if (!isNaN(montoR)) {

                cambio = (montoR - totalPagar)

                if (cambio < 0) {
                    document.querySelector('#txtDevolver').value = "";
                    return Swal.fire('Oopss', 'El valor del pago no debe ser menor al total a pagar', 'warning');
                }

                document.querySelector('#txtDevolver').value = cambio.toFixed(2);
            } else {
                document.querySelector('#txtMontoR').value = '';
                return Swal.fire('Oopss', 'Valor ingresado no valido', 'warning');
            }




        });
    });
</script>