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
<script src="../js/notificaciones.js"></script>

<div class="content-header">
    <div class="container-fluid border p-3 shadow-lg rounded">
        <div class="row">
            <div class="col-md-12">
                <div class="ibox ibox-default">
                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <h2 class="m-0">MANTENIMIENTO REGISTRO DE SALIDAS</h2>
                        </div>
                        <div class="col-sm-6 text-right">
                            <button class="btn btn-info px-5" onclick="cargarContenido('contenido-principal', 'movimientos/vista_mantenimiento_movimiento.php');"><i class="fas fa-arrow-circle-left"></i> Regresar</button>
                        </div>
                    </div>
                    <div class="ibox-body">
                        <div class="row">
                            <div class="col-lg-6 my-auto">
                                <label for="">Producto</label>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" placeholder="Seleccione un producto dando click en el boton buscar" aria-label="Recipient's username" aria-describedby="btnModalProducto">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-info" type="button" id="btnModalProducto"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <label for="">Motivo de la salida</label>
                                <textarea id="txtDescripcion" class="form-control" data-idtrans="" rows="3" placeholder="Por favor especifique las razones para hacer esta salida de articulo(s)."></textarea>
                            </div>


                            <div class="col-lg-12 mb-2" id="cont__guardar">
                                <button class="btn btn-primary px-4" id="btnGuardarSalida" onclick="registrarMovimiento()">Guardar Salida</button>
                            </div>
                            <div class="col-lg-12 mb-2" id="cont__actualizar" style="display: none;">
                                <button class="btn btn-primary px-4" id="btnActualizarSalida">Actualizar Salida</button>
                            </div>
                            <div class="col-lg-12 text-center my-3">
                                <h4><b>Detalle de Salidas</b></h4>
                                <hr>
                            </div>
                            <div class="col-lg-12 table-responsive">
                                <table id="tablaDetalleMovimientos" class="table table-bordered table-striped">
                                    <thead class="thead-default">
                                        <tr>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">PRODUCTO</th>
                                            <th class="text-center">CANTIDAD</th>
                                            <th class="text-center">ACCÍON</th>        
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyDetalleMovimiento">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- MODAL DE PRODUCTO -->
<div class="modal fade" id="modal_producto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Seleccione los productos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table id="tablaProd" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Producto</th>
                            <th class="text-center">Categoria</th>
                            <th>Stock</th>
                            <th>Precio</th>
                            <th class="text-left">Foto</th>
                            <th>Oferta</th>
                            <th>Estatus</th>
                            <th class="text-center">Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Producto</th>
                            <th class="text-center">Categoria</th>
                            <th>Stock</th>
                            <th>Precio</th>
                            <th class="text-left">Foto</th>
                            <th>Oferta</th>
                            <th>Estatus</th>
                            <th class="text-center">Acción</th>
                        </tr>
                    </tfoot>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN MODAL PRODUCTO -->

<script>
    $(document).ready(function() {
        listProductModal();
    });
</script>