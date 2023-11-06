<?php
    session_start();
    if (!isset($_SESSION['S_IDUSUARIO'])) { 
        header('Location: ../login.php');
    }

    echo "<script> var accesos = [];</script>";

    foreach ($_SESSION['S_ACCESOS'] as $ac) {
      echo "<script>  accesos.push('".$ac."')</script>";
    }
?>
<script src="../js/console_ingreso.js?rev=<?php echo time(); ?>"></script>

<div class="content-header">
    <div class="container-fluid border p-3 shadow-lg rounded">
        <div class="row">
            <div class="col-md-12">
                <div class="ibox ibox-default">
                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <h2 class="m-0">MANTENIMIENTO REGISTRO DE INGRESO</h2>
                        </div>
                        <div class="col-sm-6 text-right">
                            <button class="btn btn-info px-4" onclick="cargarContenido('contenido-principal', 'ingreso/vista_mantenimiento_ingreso.php');"><i class="fas fa-arrow-circle-left"></i> Regresar</button>
                        </div>
                    </div>
                    <div class="ibox-body">
                        <div class="row">
                            <div class="col-lg-7 mb-3">
                                <label for="">Proveedor</label>
                                <input type="text" id="txtProveedor" class="form-control" disabled placeholder="Seleccione un proveedor dando click en el boton buscar">
                                <input type="text" id="txtIdProveedor" hidden>
                                <input type="text" id="txtAccion" hidden>
                            </div>
                            <div class="col-lg-1">
                                <label for="">&nbsp;</label><br>
                                <button type="button" class="btn btn-secondary" id="btnModalProveedor" style="width: 100%;" onclick="abrirModal('proveedor')"> <i class="fa fa-search"></i> </button>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <label id="lblISV"></label>
                                <input type="text" class="form-control" id="txtImpuesto" disabled>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <label for="">Tipo Comprobante</label>
                                <select class="form-control" id="cbmTipoComprobante">
                                    <option value="FACTURA">FACTURA</option>
                                    <option value="AJUSTE">AJUSTE</option>
                                    <option value="BOLETA">BOLETA</option>
                                    <option value="TICKET">TICKET</option>
                                </select>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <label for="">Serie Comprobante</label>
                                <input type="text" class="form-control" id="txtSerieComprobante" disabled>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <label for="">N° Comprobante</label>
                                <input type="text" class="form-control" id="txtNumeroComprobante" disabled>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <label for="">Producto</label>
                                <input type="text" id="txtProducto" class="form-control" placeholder="Seleccione un producto dando click en el boton buscar">
                            </div>
                            <div class="col-lg-1" style="margin-left: -10px;">
                                <label for="">&nbsp;</label><br>
                                <button type="button" class="btn btn-secondary" id="btnModalProducto" style="width: 100%;" onclick="abrirModal('producto')"> <i class="fa fa-search"></i> </button>
                            </div>
                            <div class="col-lg-12 mb-2">
                                <button class="btn btn-primary" onclick="registrarIngreso()" id="btnGuardarIngreso" data-idajuste=""> Guardar Ingreso</button>
                            </div>
                            <div class="col-lg-12 text-center my-3">
                                <h5><b>Detalle de Ingreso</b></h5>
                            </div>
                            <div class="col-lg-12 table-responsive">
                                <table id="tablaDetalleIngreso" class="table table-bordered">
                                    <thead class="thead-default">
                                        <tr>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">PRODUCTO</th>
                                            <th class="text-center">PRECIO</th>
                                            <th class="text-center">CANTIDAD</th>
                                            <th class="text-center">SUB TOTAL</th>
                                            <th class="text-center">ACCÍON</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyDetalleIngreso">

                                    </tbody>
                                </table>
                            </div>
                            <div class="col-lg-12 text-right">
                                <div>
                                    <label for="" id="lblImpuesto"></label>
                                </div>
                                <div>
                                    <label for="" id="lblSubtotal"></label>
                                </div>
                                <div>
                                    <label for="" id="lblTotalNeto"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<!-- MODAL DE PROVEEDOR -->
<div class="modal fade" id="modal_proveedor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Seleccione un Proveedor</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cerrarModal()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <table id="tablaProv" class="table table-bordered table-striped"">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Proveedor</th>
                            <th>Razon Social</th>
                            <th>Contacto</th>
                            <th class="text-center">N&deg; Contacto</th>
                            <th>N&deg; Documento</th>
                            <th class="text-center">Tipo Documento</th>
                            <th>Estatus</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Proveedor</th>
                            <th>Contacto</th>
                            <th>Razon Social</th>
                            <th class="text-center">N&deg; Contacto</th>
                            <th>N&deg; Documento</th>
                            <th class="text-center">Tipo Documento</th>
                            <th>Estatus</th>
                            <th>Acción</th>
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
<!-- FIN MODAL PROVEEDOR -->

<!-- MODAL DE PRODUCTO -->
<div class="modal fade" id="modal_producto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
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
        listarProveedorModal();
        listarProdModal();
        setISV();
        document.querySelector('#txtImpuesto').disabled = true;
    });

    var tipoComprobante = document.querySelector('#cbmTipoComprobante');
    var txtImpuesto = document.querySelector('#txtImpuesto');

    tipoComprobante.addEventListener('change', (event) => {
        if (tipoComprobante.value == 'FACTURA' || tipoComprobante.value == 'TICKET') {
            txtImpuesto.disabled = false; //Activado
        } else {
            txtImpuesto.disabled = true; //Desactivado
        }
    });
</script>