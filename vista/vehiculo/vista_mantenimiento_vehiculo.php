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

<div class="content-header">
    <div class="container-fluid border p-3 shadow-lg rounded">
        <div class="row">
            <div class="col-md-12">
                <div class="ibox ibox-default">

                    <div class="row my-3">
                        <div class="col-sm-6">
                            <h3 class="m-0">Mantenimiento vehiculo</h3>
                        </div>
                        <div class="col-sm-6 text-right">
                            <button class="btn btn-info" onclick="abrirModal()">Nuevo Registro</button>
                        </div>
                    </div>

                    <div class="ibox-body">
                        <table id="tablaVehiculo" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Placa</th>
                                    <th>Marca</th>
                                    <th>Modelo</th>
                                    <th>Año</th>
                                    <th>Tipo</th>
                                    <th>Cliente</th>
                                    <th>Imagen</th>
                                    <th>Estado</th>
                                    <th>Acci&oacute;n</th>
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
                                    <th>Cliente</th>
                                    <th>Imagen</th>
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


<!-- VENTANA MODAL REGISTRAR ROL -->
<div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">


                <h5 class="modal-title" id="exampleModalLongTitle">Registrar Vehiculo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioRegistrarVehiculo" method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
                    <div class="row">
                        <div class="col-lg-4 mb-3">
                            <label for="">Placa</label>
                            <input type="text" class="form-control" id="txtPlaca" placeholder="Ingrese la placa del vehiculo." maxlength="45">
                        </div>

                        <div class="col-lg-4 mb-3">
                            <label for="">Tipo de combustible</label>
                            <select class="form-control" id="cbmCombustible">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="GASOLINA">GASOLINA</option>
                                    <option value="DIESEL">DIESEL</option>
                                    <option value="GAS">GAS</option>
                            </select>
                        </div>

                        <div class="col-lg-4 mb-3">
                            <label for="">Tipo de transmicion</label>
                            <select class="form-control" id="cbmTransmision">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="MANUAL">MANUAL</option>
                                    <option value="AUTOMATICA">AUTOMATICA</option>
                            </select>
                        </div>
                        

                        <div class="col-lg-6">
                                <label for="">Marca del Vehiculo</label>
                                <select class="form-control" id="cbmMarca" onchange="listarModeloCombo()">
                                        <option value="">-- SELECCIONA -- </option>
                                </select>
                            </div>

                        <div class="col-lg-6 mb-3">
                            <label for="">Modelo del vehiculo</label>
                            <select class="form-control" id="cbmModelo">

                            </select>
                        </div>

                         <div class="col-lg-2 mb-3">
                            <label for="">Año</label>
                            <input type="text" class="form-control" id="txtAnio" placeholder="YYYY" maxlength="4">
                        </div>
                        

                        <div class="col-lg-5 mb-3">
                            <label for="">Numero de chasis</label>
                            <input type="text" class="form-control" id="txtChasis" placeholder="Ingrese el numero de chasis." maxlength="45">                            
                        </div>

                        <div class="col-lg-5 mb-3">
                            <label for="">Numero de motor</label>
                            <input type="text" class="form-control" id="txtMotor" placeholder="Ingrese el numero de motor." maxlength="45">                            

                        </div>
                        
                        <div class="col-lg-9 mb-3">
                            <label for="">Imagen del vehiculo</label>
                            <input type="file" id="txtImagen" class="form-control" accept="image/*">
                             <!-- <div class="custom-file">
                                <input type="file" class="custom-file-input" id="txtImagen" accept="image/*" >
                                <label class="custom-file-label" for="validatedCustomFile">Buscar Imagen ...</label> -->
                                <!-- <div class="invalid-feedback">Example invalid custom file feedback</div> -->
                            <!-- </div> -->
                        </div>

                        <div class="col-lg-3 mb-3">
                            <label for="">Tipo vehiculo</label>
                            <select class="form-control" id="cbmTipo">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="LIVIANO">LIVIANO</option>
                                    <option value="PESADO">PESADO</option>
                            </select>                     
                        </div>


                        <div class="col-lg-11 mb-3">
                                <label for="">Cliente</label>
                                <input type="text" id="txtClienteNombre" class="form-control" placeholder="Seleccione un cliente dando click en el boton buscar">
                                <input type="text" id="txtClienteId" class="form-control" hidden>
                          </div>
                        <div class="col-lg-1" style="margin-left: -10px;">
                                <label for="">&nbsp;</label><br>
                                <button type="button" class="btn btn-success" style="width: 100%;" onclick="abrirModalSelecCliente()"> <i class="fa fa-search"></i> </button>
                        </div>
                        
                        <div class="col-lg-12">
                            <label for="">Observaciones</label>
                            <textarea id="txtDescripcion" class="form-control" cols="30" rows="4" placeholder="Descripcion tecnica del vehiculo que esta ingresando, sus caracteristicas distintivas y detalles descriptivos" maxlength="255"></textarea>
                        </div>

                        

                        <div class="col-lg-12"><br>
                            <div class="alert alert-danger alert-bordered" id="divError" style="display: none;"></div>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="registrarVehiculo()">Guardar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN VENTANA MODAL REGISTRAR ROL -->


<!-- VENTANA MODAL EDITAR ROL -->
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title title__car" id="exampleModalLongTitle">Editar Vehiculo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditarVehiculo" method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
                    <div class="row">
                        
                        <input type="hidden" id="txtIdVehiculo">
                        <div class="col-lg-4 mb-3">
                            <label for="">Placa</label>
                            <input type="text" class="form-control" id="txtPlacaEditarNuevo" placeholder="Ingrese la placa del vehiculo." maxlength="45">
                            <input type="text" class="form-control" id="txtPlacaEditarActual" placeholder="Ingrese la placa del vehiculo." hidden>
                        </div>

                        <div class="col-lg-4 mb-3">
                            <label for="">Tipo de combustible</label>
                            <select class="form-control" id="cbmCombustibleEditar">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="GASOLINA">GASOLINA</option>
                                    <option value="DIESEL">DIESEL</option>
                                    <option value="GAS">GAS</option>
                            </select>
                        </div>

                        <div class="col-lg-4 mb-3">
                            <label for="">Tipo de transmicion</label>
                            <select class="form-control" id="cbmTransmisionEditar">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="MANUAL">MANUAL</option>
                                    <option value="AUTOMATICA">AUTOMATICA</option>
                            </select>
                        </div>
                        

                        <div class="col-lg-6">
                                <label for="">Marca del Vehiculo</label>
                                <select class="form-control" id="cbmMarcaEditar" onchange="listarModeloComboEditar()">
                                        <option value="">-- SELECCIONA -- </option>
                                </select>
                            </div>

                        <div class="col-lg-6 mb-3">
                            <label for="">Modelo del vehiculo</label>
                            <input type="hidden" id="idModel">
                            <select class="form-control" id="cbmModeloEditar">
                                       
                            </select>
                        </div>

                         <div class="col-lg-2 mb-3">
                            <label for="">Año</label>
                            <input type="text" class="form-control" id="txtAnioEditar" placeholder="YYYY" maxlength="4">
                        </div>
                        

                        <div class="col-lg-5 mb-3">
                            <label for="">Numero de chasis</label>
                            <input type="text" class="form-control" id="txtChasisEditar" placeholder="Ingrese el numero de chasis." maxlength="45">                            
                        </div>

                        <div class="col-lg-5 mb-3">
                            <label for="">Numero de motor</label>
                            <input type="text" class="form-control" id="txtMotorEditar" placeholder="Ingrese el numero de motor." maxlength="45">                            

                        </div>
                        
                        <div class="col-lg-7 mb-3">
                            <label for="">Imagen del vehiculo</label>
                            <input type="file" id="txtImagenEditar" class="form-control" accept="image/*">
                             <!-- <div class="custom-file">
                                <input type="file" class="custom-file-input" id="txtImagen" accept="image/*" >
                                <label class="custom-file-label" for="validatedCustomFile">Buscar Imagen ...</label> -->
                                <!-- <div class="invalid-feedback">Example invalid custom file feedback</div> -->
                            <!-- </div> -->
                        </div>

                        <div class="col-lg-2" style="margin-left: -10px;">
                                <label for="">&nbsp;</label><br>
                                <button type="button" id="btnUpdateImage" class="btn btn-success" style="width: 100%;" onclick="editarFotoVehiculo()">Actualizar Imagen</button>
                        </div>

                        <div class="col-lg-3 mb-3">
                            <label for="">Tipo vehiculo</label>
                            <select class="form-control" id="cbmTipoEditar">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="LIVIANO">LIVIANO</option>
                                    <option value="PESADO">PESADO</option>
                            </select>                     
                        </div>


                        <div class="col-lg-8 mb-3">
                                <label for="">Cliente</label>
                                <input type="text" id="txtClienteNombreEditar" class="form-control" placeholder="Seleccione un cliente dando click en el boton buscar">
                                <input type="text" id="txtClienteIdEditar" class="form-control" hidden>
                          </div>
                        <div class="col-lg-1" style="margin-left: -10px;">
                                <label for="">&nbsp;</label><br>
                                <button type="button" class="btn btn-success" id="btnModalCar" style="width: 100%;" onclick="abrirModalSelecCliente()"> <i class="fa fa-search"></i> </button>
                        </div>

                        <div class="col-lg-3 mb-3">
                            <label for="">Estado</label>
                            <select class="form-control" id="cbmEstadoEditar">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="ACTIVO">ACTIVO</option>
                                    <option value="INACTIVO">INACTIVO</option>
                            </select>                     
                        </div>
                        
                        <div class="col-lg-12 mb-3">
                            <label for="">Observaciones</label>
                            <textarea id="txtDescripcionEditar" class="form-control" cols="30" rows="4" placeholder="Descripcion tecnica del vehiculo que esta ingresando, sus caracteristicas distintivas y detalles descriptivos" maxlength="255"></textarea>
                        </div>
                        <div class="col-lg-12 text-center" style="display: none;" id="cont__img">
                            <img src="" alt="" width="250px" class="img__product">
                        </div>

                        <div class="col-lg-12"><br>
                            <div class="alert alert-danger alert-bordered" id="divErrorEditar" style="display: none;"></div>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="btnUpdateCar" onclick="editarVehiculo()">Actualizar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN VENTANA MODAL EDITAR ROL -->

<!-- MODAL DE CLIENTE -->
<div class="modal fade" id="modal_cliente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Seleccione un Cliente</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cerrarModal()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

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
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN MODAL CLIENTE -->

<script src="../js/vehiculo.js?rev=<?php echo time(); ?>"></script>
<script>
    $(document).ready(function() {
        listarVehiculo();

        listarClienteModal();
        listarMarcaCombo();

        setiarAccesos(accesos);

    });

    /*CODIGO PARA LA VENTANA MODAL */
    $('#modal_registro').on('shown.bs.modal', function() {
        $('#txtPlaca').trigger('focus')
    })

    //VALIDACION IMAGEN REGISTRAR
    document.getElementById("txtImagen").addEventListener("change", () => {
        var fileName = document.getElementById("txtImagen").value;
        var idxDot = fileName.lastIndexOf(".") + 1;
        var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
        if (extFile == "jpg" || extFile == "jpeg" || extFile == "png") {
            //TO DO 
        } else {
            Swal.fire("Mensaje de advertencia", "Solo se aceptan imagenes, usted subio un archivo con extension: ." + extFile, "warning");
            document.getElementById('txtImagen').value = "";
        }
    });
</script>