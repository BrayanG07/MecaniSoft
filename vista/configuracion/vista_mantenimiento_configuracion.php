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
                            <h3 class="m-0">Mantenimiento configuracion</h3>
                        </div>
                        <div class="col-sm-6 text-right">
                            <button class="btn btn-info" id="btnnuevo" onclick="abrirModal()">Nuevo Registro</button>
                        </div>
                    </div>

                    <div class="ibox-body">
                        <table id="tablaConfiguracion" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nombre Empresa</th>
                                    <th>RTN</th>
                                    <th>Telefono</th>
                                    <th>Celular</th>
                                    <th>Correo</th>
                                    <th>ISV</th>
                                    <th>Foto</th>
                                    <th>Acción</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>Nombre Empresa</th>
                                    <th>RTN</th>
                                    <th>Telefono</th>
                                    <th>Celular</th>
                                    <th>Correo</th>
                                    <th>ISV</th>
                                    <th>Foto</th>
                                    <th>Acción</th>
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
                <h5 class="modal-title" id="exampleModalLongTitle">Registrar Configuracion</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioRegistrarConfiguracion" method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
                <!-- <input type="text" id="txtIdProducto" hidden> -->
                        <div class="row">
                        <div class="col-lg-4 mb-3">
                            <label for="">Nombre Empresa</label>
                            <input type="text" class="form-control" id="txtNombre" placeholder="Ingrese el nombre de la empresa." maxlength="80">
                        </div>
                        <div class="col-lg-4 mb-3">
                            <label for="">RTN</label>
                            <input type="text" class="form-control" id="txtrtn" maxlength="100">
                        </div>
                        <div class="col-lg-4 mb-3">
                            <label for="">Teléfono</label>
                            <input type="text" class="form-control" id="txttelefono" maxlength="20">
                        </div>
                        <div class="col-lg-4 mb-3">
                            <label for="">Celular</label>
                            <input type="text" class="form-control" id="txtcelular" maxlength="20">
                        </div>
                        
                        <div class="col-lg-6 mb-3">
                            <label for="">Correo Electrónico</label>
                            <input type="text" class="form-control" id="txtcorreo" maxlength="100">
                        </div>
                        <div class="col-lg-6 mb-3">
                            <label for="">ISV</label>
                            <input type="number" min="1" class="form-control" id="txtisv" placeholder="00.00">
                        </div>
                        
                        <div class="col-lg-3 mb-3">
                            <label for="">CAI</label>
                            <input type="text" class="form-control" id="txtcai" placeholder="Ingrese el cai" maxlength="50">
                        </div>
                        <div class="col-lg-3 mb-3">
                            <label for="">Fecha Limite Emisión Factura</label>
                            <input type="date" class="form-control" id="txtfecha">
                            
                        </div>
                        
                        <div class="col-lg-3 mb-3">
                            <label for="">Cantidad Facturas</label>
                            <input type="number" class="form-control" id="txtcantidadFacturas">
                            
                        </div>
                        <div class="col-lg-3 mb-3">
                            <label for="">Numero Inicial</label>
                            <input type="text" class="form-control" id="txtnumeroinicial" maxlength="50">
                            
                        </div>
                        <div class="col-lg-3 mb-3">
                            <label for="">Numero Final</label>
                            <input type="text" class="form-control" id="txtnumerofinal" maxlength="50">
                            
                        </div>
                        <div class="col-lg-3 mb-3">
                            <label for="">Precio Dolar</label>
                            <input type="number" class="form-control" id="txtdolar">
                            
                        </div>
                        <div class="col-lg-9 mb-3">
                            <label for="">Logo Empresa</label>
                            <input type="file" id="txtImagen" class="form-control" accept="image/*">
                        </div>
                        <div class="col-lg-12">
                            <label for="">Dirección</label>
                            <textarea id="txtdireccion" class="form-control" cols="30" rows="4" placeholder="Dirección fisica de la empresa" maxlength="255"></textarea>
                        </div>
                        <div class="col-lg-12"><br>
                            <div class="alert alert-danger alert-bordered" id="divError" style="display: none;"></div>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="registrarConfiguracion()">Guardar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN VENTANA MODAL REGISTRAR  -->


<!-- VENTANA MODAL EDITAR  -->
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title title__modal" id="exampleModalLongTitle">Editar Configuracion</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditarConfiguracion" method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
                    <div class="row">
                        <div class="col-lg-4 mb-3">
                            <label for="">Nombre Empresa</label>
                            <input type="text" id="txtIdConfiguracion" hidden>
                            <input type="text" class="form-control" id="txtNombreEditar" placeholder="Ingrese el nombre de la empresa." maxlength="80">
                        </div>
                        <div class="col-lg-4 mb-3">
                            <label for="">RTN</label>
                            <input type="text" class="form-control" id="txtrtnEditar" maxlength="100">
                        </div>
                        <div class="col-lg-4 mb-3">
                            <label for="">Teléfono</label>
                            <input type="text" class="form-control" id="txttelefonoEditar" maxlength="20">
                        </div>
                        <div class="col-lg-4 mb-3">
                            <label for="">Celular</label>
                            <input type="text" class="form-control" id="txtcelularEditar" maxlength="20">
                        </div>
                        
                        <div class="col-lg-6 mb-3">
                            <label for="">Correo Electrónico</label>
                            <input type="text" class="form-control" id="txtcorreoEditar" maxlength="100">
                        </div>
                        <div class="col-lg-6 mb-3">
                            <label for="">ISV</label>
                            <input type="number" min="1" class="form-control" id="txtisvEditar" placeholder="00.00">
                        </div>
                        
                        <div class="col-lg-3 mb-3">
                            <label for="">CAI</label>
                            <input type="text" class="form-control" id="txtcaiEditar" placeholder="Ingrese el cai" maxlength="50">
                        </div>
                        <div class="col-lg-3 mb-3">
                            <label for="">Fecha Limite Emisión Factura</label>
                            <input type="date" class="form-control" id="txtfechaEditar">
                            
                        </div>
                        
                        <div class="col-lg-3 mb-3">
                            <label for="">Cantidad Facturas</label>
                            <input type="number" class="form-control" id="txtcantidadFacturasEditar">
                            
                        </div>
                        <div class="col-lg-3 mb-3">
                            <label for="">Numero Inicial</label>
                            <input type="text" class="form-control" id="txtnumeroinicialEditar" maxlength="50">
                            
                        </div>
                        <div class="col-lg-3 mb-3">
                            <label for="">Numero Final</label>
                            <input type="text" class="form-control" id="txtnumerofinalEditar" maxlength="50">
                            
                        </div>
                        <div class="col-lg-3 mb-3">
                            <label for="">Precio Dolar</label>
                            <input type="number" class="form-control" id="txtdolarEditar">
                            
                        </div>
                        <div class="col-lg-9 mb-3">
                            <label for="">Logo Empresa</label>
                            <input type="file" id="txtImagenEditar" class="form-control" accept="image/*">
                        </div>
                        <div class="col-lg-3 mb-4">
                            <label for="">&nbsp;</label><br>
                            <button class="btn btn-success" id="btnUpdateImage" onclick="editarFotoConfiguracion()" style="width: 100%;">Actualizar Foto</button>
                        </div>
                        
                        <div class="col-lg-12">
                            <label for="">Dirección</label>
                            <textarea id="txtdireccionEditar" class="form-control" cols="30" rows="4" placeholder="Dirección fisica de la empresa" maxlength="255"></textarea>
                        </div>
                        <div class="col-lg-12 text-center" style="display: none;" id="cont__img">
                            <img src="" alt="" width="250px" class="img__configuracion">
                        </div>
                        <div class="col-lg-12"><br>
                            <div class="alert alert-danger alert-bordered" id="divErrorEditar" style="display: none;"></div>
                        </div>
                        

                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="btnActualizarConfiguracion" onclick="editarConfiguracion()">Actualizar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN VENTANA MODAL EDITAR ROL -->


<script src="../js/configuracion.js?rev=<?php echo time(); ?>"></script>
<script>
    $(document).ready(function() {
        listarConfiguracion();
       
    });

    /*CODIGO PARA LA VENTANA MODAL */
    $('#modal_registro').on('shown.bs.modal', function() {
        $('#txtConfiguracion').trigger('focus')
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
    function longitudTabla() {
    let contador = 0;
    $("#tablaConfiguracion tbody#tbodyconfiguracion tr").each(function () {
        contador++;
    });
    return contador;
    }
    
    if(longitudTabla()==0){
        $("#btnnuevo").prop('disabled', true);
    }
</script>