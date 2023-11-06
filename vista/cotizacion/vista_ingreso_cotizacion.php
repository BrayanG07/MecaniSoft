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
                            <h2 class="m-0">MANTENIMIENTO REGISTRO</h2>
                        </div>
                        <div class="col-sm-6 text-right">
                            <button class="btn btn-info px-4" onclick="cargarContenido('contenido-principal', 'cotizacion/vista_mantenimiento_cotizacion.php');"><i class="fas fa-arrow-circle-left"></i> Regresar</button>
                        </div>
                    </div>
                    <div class="ibox-body">
                        <div class="row">
                            <div class="col-lg-6 rounded p-3">
                                <label for="">SELECCIONE EL CLIENTE</label>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" id="txtClienteCot" disabled placeholder="Seleccione un cliente, de click en el boton buscar" aria-label="Recipient's username" aria-describedby="button-addon2">
                                    <input type="text" id="txtIdClienteCot" hidden>
                                    <input type="text" id="txtIdUsuarioLogeado" value="<?php echo $_SESSION['S_IDUSUARIO']; ?>" hidden>
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-info" type="button" id="button-addon2" onclick="abrirModal('cliente')">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="row" style="display: none;" id="cont__client">
                                    <div class="input-group mb-3 col-lg-12">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-id-card"></i></span>
                                        </div>
                                        <input type="text" class="form-control" id="txtIdentificacion" placeholder="Identificación Cliente" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="input-group mb-3 col-lg-12">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-phone-alt"></i></span>
                                        </div>
                                        <input type="text" class="form-control" id="textNumCelular" placeholder="Numero Telefono ó Celular" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="input-group mb-3 col-lg-12">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-envelope"></i></span>
                                        </div>
                                        <input type="text" class="form-control" id="txtEmailClient" placeholder="Correo Electronico" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="input-group mb-3 col-lg-12">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-building"></i></span>
                                        </div>
                                        <input type="text" class="form-control" id="txtCompany" placeholder="Empresa que representa" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6 rounded p-3">
                                <label for="">Seleccione el vehiculo</label>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" disabled id="txtVehiculo" placeholder="Seleccione el vehiculo para hacer su cotización, de click en el boton buscar" aria-label="Recipient's username" aria-describedby="button-addon2">
                                    <input type="text" id="txtIdVehiculo" hidden>
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-info" type="button" id="btnSelecVehiculo" onclick="abrirModal('vehiculo')" disabled>
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>

                                <div style="display: none;" id="cont_vehiculo">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a class="nav-link active" href="#tab-2" data-toggle="tab"> Información Vehiculo</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#tab-3" data-toggle="tab"> Detalles Actuales</a>
                                        </li>
                                    </ul>

                                    <div class="tab-content border p-3">
                                        <!-- PESTANA UNO -->
                                        <div class="tab-pane fade show active" id="tab-2">
                                            <div class="form-group row">
                                                <label for="" class="col-sm-2 col-form-label">Placa:</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="txtPlaca">
                                                </div>
                                                <label for="" class="col-sm-2 col-form-label">Marca:</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="txtMarca">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="" class="col-sm-2 col-form-label">Modelo:</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="txtModelo">
                                                </div>
                                                <label for="" class="col-sm-2 col-form-label">Tipo:</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="txtTipo">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="" class="col-sm-2 col-form-label">N° Motor:</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="txtMotor">
                                                </div>
                                                <label for="" class="col-sm-2 col-form-label">N° Chasis:</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="txtChasis">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="" class="col-sm-2 col-form-label">Año:</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="txtYear">
                                                </div>
                                                <label for="" class="col-sm-2 col-form-label">Transmision:</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="txtTransmision">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- PESTANA DOS -->
                                        <div class="tab-pane fade" id="tab-3">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <label for="">Mecanico:</label>
                                                    <div class="input-group mb-2">
                                                        <input type="text" class="form-control" id="txtMecanico" disabled placeholder="Seleccione el mecanico, de click en el boton buscar" aria-label="Recipient's username" aria-describedby="button-addon2">
                                                        <input type="text" id="txtIdMecanico" hidden>
                                                        <div class="input-group-append">
                                                            <button class="btn btn-outline-info" type="button" id="button-addon2" onclick="abrirModal('usuario')">
                                                                <i class="fas fa-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 mb-2">
                                                    <label for="">Kilometraje:</label>
                                                    <input type="text" class="form-control" id="txtKilometros" placeholder="Ingrese el kilometraje actual del automovil" maxlength="10">
                                                </div>
                                                <div class="col-lg-6 mb-2">
                                                    <label for="">Nvl Combustible:</label>
                                                    <select id="cboNivelCombustible" class="form-control">
                                                        <option value="">--Seleccione--</option>
                                                        <option value="E">E</option>
                                                        <option value="1/4">1/4</option>
                                                        <option value="1/2">1/2</option>
                                                        <option value="3/4">3/4</option>
                                                        <option value="F">F</option>
                                                    </select>
                                                </div>
                                                <div class="col-lg-12">
                                                    <label for="">Falla - Observaciones </label>
                                                    <textarea name="txtObservaciones" id="txtObservaciones" cols="30" rows="3" class="form-control" placeholder="Ingrese la descripcion de fallos u observaciones del automovil seleccionado" maxlength="255"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-12 mb-2">
                                <button class="btn btn-info px-4" id='btnGuardar' onclick="preguntarGuardar()"> Guardar </button>
                                <button class="btn btn-warning px-4" id='btnSeleccionar' onclick="abrirModal('servicios')"> Seleccionar Servicios / Productos</button>
                            </div>
                            <div class="col-lg-12 text-center my-3">
                                <h4><b>Detalle de Orden</b></h4>
                                <!-- <input type="text" id="accion" value="" hidden>
                                <input type="text" id="idTransaccion" value="" hidden>
                                <input type="text" id="tipoOrden" value="" hidden>
                                 -->
                                <input type="text" id="accion" value="" hidden>
                                <input type="text" id="idTransaccion" value="" hidden>
                                <input type="text" id="tipoOrden" value="" hidden>
                            </div>
                            <div class="col-lg-12 table-responsive">
                                <table id="tablaDetalleOrden" class="table table-bordered">
                                    <thead class="thead-default">
                                        <tr>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">PRODUCTO/SERVICIO</th>
                                            <th class="text-center">TIPO</th>
                                            <th class="text-center">PRECIO</th>
                                            <th class="text-center">CANTIDAD</th>
                                            <th class="text-center">DESCUENTO c/u</th>
                                            <th class="text-center">DESCUENTO TOTAL</th>
                                            <th class="text-center">SUB TOTAL</th>
                                            <th class="text-center">ACCÍON</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyDetalleOrden">

                                    </tbody>
                                </table>
                            </div>
                            <div class="col-lg-12 text-right">
                                <div>
                                    <label for="" id="lblImpuesto"></label>
                                </div>
                                <div>
                                    <label for="" id="lblDescuento"></label>
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


<!-- MODAL DE CLIENTE -->
<div class="modal fade" id="modal_cliente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Seleccione un Cliente</h5>
                <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cerrarModal()"> -->
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <ul class="nav nav-tabs">

                    <li class="nav-item">
                        <a class="nav-link active" href="#tab__cliente" data-toggle="tab"> Listado Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tab__register" data-toggle="tab" <?php  if(!in_array('11-1', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>> Registrar Cliente</a>
                    </li>
                </ul>

                <div class="tab-content border p-4">
                    <!-- PESTANA UNO -->
                    <div class="tab-pane fade show active" id="tab__cliente">
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
                            <th>Correo</th>
                            <th>Empresa</th>
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
                                    <th>Correo</th>
                                    <th>Empresa</th>
                                    <th>Acci&oacute;n</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>

                    <!-- PESTANA DOS -->
                    <div class="tab-pane fade" id="tab__register" >
                        <form id="formularioRegistroCliente">
                            <div class="row">
                                <div class="col-lg-6 mb-2">
                                    <label for="">Nombre</label>
                                    <input type="text" class="form-control" id="txtNombre" onkeypress="return soloLetras(event)" placeholder="Ingrese el nombre o los dos nombres del cliente" maxlength="100">
                                </div>
                                <div class="col-lg-6 mb-2">
                                    <label for="">Apellido Paterno</label>
                                    <input type="text" class="form-control" id="txtApellidoPaterno" onkeypress="return soloLetras(event)" placeholder="Ingrese el apellido paterno" maxlength="45">
                                </div>
                                <div class="col-lg-6 mb-2">
                                    <label for="">Apellido Materno</label>
                                    <input type="text" class="form-control" id="txtApellidoMaterno" onkeypress="return soloLetras(event)" placeholder="Ingrese el apellido materno" maxlength="45">
                                </div>
                                <div class="col-lg-6 mb-3">
                                    <label for="">Correo Electronico</label>
                                    <input type="email" class="form-control" id="txtCorreo" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" placeholder="Ej: correo@correo.com" maxlength="70">
                                </div>
                                <div class="col-lg-6 mb-2">
                                    <label for="">Tipo Documento</label>
                                    <select class="form-control" id="cbmTipoDocumento" style="width: 100%;">
                                        <option value="IDENTIDAD">IDENTIDAD</option>
                                        <option value="RTN">RTN</option>
                                        <option value="DNI">DNI</option>
                                        <option value="RUC">RUC</option>
                                        <option value="PASAPORTE">PASAPORTE</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 mb-2">
                                    <label for="">Nro Documento</label>
                                    <input type="text" class="form-control" id="txtNumero" onkeypress="return soloNumeros(event)" placeholder="Ingrese el numero de documento (RTN, DNI etc..)" maxlength="17">
                                </div>
                                <div class="col-lg-6 mb-3">
                                    <label for="">Genero</label>
                                    <select class="form-control" id="cbmSexo" style="width: 100%;">
                                        <option value="MASCULINO">MASCULINO</option>
                                        <option value="FEMENINO">FEMENINO</option>
                                        <option value="OTRO">OTRO</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 mb-3">
                                    <label for="">Nro Telefono</label>
                                    <input type="text" class="form-control" id="txtTelefono" placeholder="+504 8920-1085 ó 50496851023 ó 94562010" maxlength="17">
                                </div>
                                <div class="col-lg-6 mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="txtRepresenta">
                                        <label class="form-check-label" for="txtRepresenta">
                                            Representante de empresa
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-3" style="display: none;" id="cont__empresa">
                                    <label for="">Nombre de la empresa</label>
                                    <input type="text" class="form-control" id="txtNombreEmpresa" placeholder="Ingrese el nombre de la empresa a la que representa el cliente." maxlength="100">
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
<!-- FIN MODAL CLIENTE -->

<!-- MODAL DE VEHICULO -->
<div class="modal fade" id="modal__vehiculo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">SELECCIONE EL AUTOMOVIL</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table id="tablaVehiculo" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Placa</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Año</th>
                            <th>Tipo</th>
                            <th>Imagen</th>
                            <th>Estado</th>
                            <th>N Motor</th>
                            <th>N Chasis</th>
                            <th>Transmision</th>
                            <th>Accion</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Placa</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Año</th>
                            <th>Tipo</th>
                            <th>Imagen</th>
                            <th>Estado</th>
                            <th>N Motor</th>
                            <th>N Chasis</th>
                            <th>Transmision</th>
                            <th>Accion</th>
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
<!-- FIN MODAL VEHICULO -->

<!-- MODAL DE USUARIO -->
<div class="modal fade" id="modal__usuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">SELECCIONE EL MECANICO</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table id="tablaUsuarioCot" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Mecanico</th>
                            <th>N&deg; Documento</th>
                            <th>Email</th>
                            <th class="text-center">Imagen</th>
                            <th>Genero</th>
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
                            <th>Mecanico</th>
                            <th>N&deg; Documento</th>
                            <th>Email</th>
                            <th class="text-center">Imagen</th>
                            <th>Genero</th>
                            <th>Telefono</th>
                            <th>Estatus</th>
                            <th>Acci&oacute;n</th>
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
<!-- FIN MODAL USUARIO -->

<!-- MODAL DE SERVICIOS -->
<div class="modal fade" id="modal__servicios" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">SELECCIONE LOS SERVICIOS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cerrarModal()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <ul class="nav nav-tabs">

                    <li class="nav-item">
                        <a class="nav-link active" href="#tab_producto" data-toggle="tab"> Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tab__servicios" data-toggle="tab"> Servicio</a>
                    </li>
                </ul>

                <div class="tab-content border p-4">
                    <!-- PESTANA UNO -->
                    <div class="tab-pane fade show active" id="tab_producto">
                        <!-- PRODUCTO  -->
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

                    <!-- PESTANA DOS -->
                    <div class="tab-pane fade" id="tab__servicios">
                        <!-- SERVICIOS -->
                        <table id="tablaServicio" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Servicio</th>
                                    <th>Código</th>
                                    <th>Categoria</th>
                                    <th>Tipo</th>
                                    <th>Precio</th>
                                    <th>Foto</th>
                                    <th>Oferta</th>
                                    <th>Estatus</th>
                                    <th>Acci&oacute;n</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>Servicio</th>
                                    <th>Código</th>
                                    <th>Categoria</th>
                                    <th>Tipo</th>
                                    <th>Precio</th>
                                    <th>Foto</th>
                                    <th>Oferta</th>
                                    <th>Estatus</th>
                                    <th>Acci&oacute;n</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN MODAL CLIENTE -->

<script>
    $(document).ready(function() {
        listarClienteModal();
        listarUsuarioCot();
        listarProductoCot();
        listarServicioCot();

        listarISV();

        

        // $('#tablaDetalleOrden').DataTable()

    });
</script>