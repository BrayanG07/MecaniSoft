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

<script src="../js/console_venta.js?rev=<?php echo time(); ?>"></script>

<div class="content-header">
    <div class="container-fluid border p-3 shadow-lg rounded">
        <div class="row">
            <div class="col-md-12">
                <div class="ibox ibox-default">
                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <h2 class="m-0">MANTENIMIENTO REGISTRO DE VENTA</h2>
                        </div>
                        <div class="col-sm-6 text-right">
                            <button class="btn btn-info px-5" onclick="cargarContenido('contenido-principal', 'venta/vista_mantenimiento_venta.php');"><i class="fas fa-arrow-circle-left"></i> Regresar</button>
                        </div>
                    </div>
                    <div class="ibox-body">
                        <div class="row">
                            <div class="col-lg-7 mb-3">
                                <label for="">Cliente</label>
                                <div class="input-group mb-3">
                                    <input type="text" id="txtIdCliente" hidden>
                                    <input type="text" class="form-control" id="txtCliente" placeholder="Seleccione un cliente dando click en el boton buscar" aria-label="Recipient's username" aria-describedby="btnModalCliente">
                                    <div class="input-group-append">
                                        <button class="btn btn-secondary" type="button" id="btnModalCliente" onclick="abrirModal('cliente')"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5 mb-3">
                                <label for="" id="lblISV"></label>
                                <input type="text" class="form-control" id="txtImpuesto" disabled>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <label for="">Tipo Comprobante</label>
                                <select class="form-control" id="cbmTipoComprobante">
                                    <option value="FACTURA">FACTURA</option>
                                    <option value="BOLETA">BOLETA</option>
                                </select>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <label for="">Factura Maxima</label>
                                <input type="text" class="form-control" id="txtSerieComprobante" disabled>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <label for="">N° Factura</label>
                                <input type="text" class="form-control" id="txtNumeroComprobante" disabled>
                            </div>
                            <div class="col-lg-6 mb-3">
                                <label for="">Producto</label>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" id="txtProducto" placeholder="Seleccione un producto dando click en el boton buscar" aria-label="Recipient's username" aria-describedby="btnModalProducto">
                                    <div class="input-group-append">
                                        <button class="btn btn-secondary" type="button" id="btnModalProducto" onclick="abrirModal('producto')"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <label for="">Dinero Cliente</label>
                                <input type="text" class="form-control" id="txtMoneyClient" placeholder="Ingrese el monto que el cliente le esta entregando." onkeypress="return soloNumeros(event)" maxlength="10">
                            </div>
                            
                            <div class="col-lg-12 mb-2">
                                <button class="btn btn-primary" id="btnGuardarVenta" onclick="registrarVenta()"> Guardar Venta</button>
                            </div>
                            <div class="col-lg-12 text-center my-3">
                                <h5><b>Detalle de Venta</b></h5>
                            </div>
                            <div class="col-lg-12 table-responsive">
                                <table id="tablaDetalleVenta" class="table table-bordered table-striped">
                                    <thead class="thead-default">
                                        <tr>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">PRODUCTO</th>
                                            <th class="text-center">PRECIO</th>
                                            <th class="text-center">CANTIDAD</th>
                                            <th class="text-center">DESCUENTO</th>
                                            <th class="text-center">SUB TOTAL</th>
                                            <th class="text-center" id="cont__porcentaje" style="display: none;">Porcentaje</th>
                                            <th class="text-center">ACCÍON</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyDetalleVenta">

                                    </tbody>
                                </table>
                            </div>
                            <div class="col-lg-12 text-right">
                                <div>
                                    <label for="" id="lblSubtotal"></label>
                                </div>
                                <div>
                                    <label for="" id="lblImpuesto"></label>
                                </div>
                                <div>
                                    <label for="" id="lblDescuento"></label>
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
<div class="modal fade" id="modal_cliente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Seleccione un Cliente</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cerrarModal()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <ul class="nav nav-tabs">

                    <li class="nav-item">
                        <a class="nav-link active" href="#tab-2" data-toggle="tab"> Listado Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tab-3" data-toggle="tab" <?php  if(!in_array('11-1', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>> Registrar Cliente</a>
                    </li>
                </ul>

                <div class="tab-content border p-4">
                    <!-- PESTANA UNO -->
                    <div class="tab-pane fade show active" id="tab-2">
                        <table id="tablaCliente" class="table table-bordered table-striped"">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Cliente</th>
                                    <th>N&deg; Documento</th>
                                    <th class=" text-center">Tipo Documento</th>
                            <th class="text-center">Genero</th>
                            <th>Telefono</th>
                            <th>Estatus</th>
                            <th>Acci&oacute;n</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>Cliente</th>
                                    <th>N&deg; Documento</th>
                                    <th class="text-center">Tipo Documento</th>
                                    <th class="text-center">Genero</th>
                                    <th>Telefono</th>
                                    <th>Estatus</th>
                                    <th>Acci&oacute;n</th>
                                </tr>
                            </tfoot>
                        </table>

                    </div>

                    <!-- PESTANA DOS -->
                    <div class="tab-pane fade" id="tab-3">
                        <form id="formularioRegistroCliente">
                            <div class="row">
                                <div class="col-lg-6 mb-2">
                                    <label for="">Nombre</label>
                                    <input type="text" class="form-control" id="txtNombre" onkeypress="return soloLetras(event)" placeholder="Ingrese el nombre o los dos nombres del cliente" maxlength="100">
                                </div>
                                <div class="col-lg-6 mb-2">
                                    <label for="">Apellido Paterno</label>
                                    <input type="text" class="form-control" id="txtApellidoPaterno" onkeypress="return soloLetras(event)" placeholder="Ingrese el apellido paterno" maxlength="50" >
                                </div>
                                <div class="col-lg-6 mb-2">
                                    <label for="">Apellido Materno</label>
                                    <input type="text" class="form-control" id="txtApellidoMaterno" onkeypress="return soloLetras(event)" placeholder="Ingrese el apellido materno" maxlength="50" >
                                </div>
                                <div class="col-lg-6 mb-3">
                                    <label for="">Correo Electronico</label>
                                    <input type="email" class="form-control" id="txtCorreo" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" placeholder="Ej: correo@correo.com" maxlength="70" >
                                </div>
                                <div class="col-lg-6 mb-2">
                                    <label for="">Tipo Documento</label>
                                    <select class="form-control" id="cbmTipoDocumento">
                                        <option value="IDENTIDAD">IDENTIDAD</option>
                                        <option value="RTN">RTN</option>
                                        <option value="DNI">DNI</option>
                                        <option value="RUC">RUC</option>
                                        <option value="PASAPORTE">PASAPORTE</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 mb-2">
                                    <label for="">Nro Documento</label>
                                    <input type="text" class="form-control" id="txtNumero" onkeypress="return soloNumeros(event)" placeholder="Ingrese el numero de documento (RTN, DNI etc..)" maxlength="17" >
                                </div>
                                <div class="col-lg-6 mb-2">
                                    <label for="">Genero</label>
                                    <select class="form-control" id="cbmSexo">
                                        <option value="MASCULINO">MASCULINO</option>
                                        <option value="FEMENINO">FEMENINO</option>
                                        <option value="OTRO">OTRO</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 mb-2">
                                    <label for="">Nro Telefono</label>
                                    <input type="text" class="form-control" id="txtTelefono" placeholder="+504 8920-1085 ó 50496851023 ó 94562010" maxlength="17" >
                                </div>
                                <div class="col-lg-12"><br>
                                    <div class="alert alert-danger alert-bordered" id="divError" style="display: none;"></div>
                                </div>
                                <div class="col-lg-12">
                                    <button type="button" class="btn btn-primary px-4" onclick="registrarCliente()">Guardar</button>
                                </div>
                            </div>
                        </form>

                    </div>


                </div>

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