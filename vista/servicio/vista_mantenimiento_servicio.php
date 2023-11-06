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

<div class="content-header">
    <div class="container-fluid border p-3 shadow-lg rounded">
        <div class="row">
            <div class="col-md-12">
                <div class="ibox ibox-default">

                    <div class="row my-3">
                        <div class="col-sm-6">
                            <h3 class="m-0">Mantenimiento servicio</h3>
                        </div>
                        <div class="col-sm-6 text-right">
                            <button class="btn btn-info" onclick="abrirModal()">Nuevo Registro</button>
                        </div>
                    </div>

                    <div class="ibox-body">
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
        </div>
    </div>
</div>


<!-- VENTANA MODAL REGISTRAR SERVICIO -->
<div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Registrar Servicio</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioRegistrarServicio" method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
                <!-- <input type="text" id="txtIdProducto" hidden> -->
                        <div class="row">
                        <div class="col-lg-4 mb-3">
                            <label for="">Servicio</label>
                            <input type="text" class="form-control" id="txtServicio" placeholder="Ingrese el nombre del servicio." maxlength="100">

                        </div>
                        <div class="col-lg-4 mb-3">
                            <label for="">Código</label>
                            <input type="text" class="form-control" id="txtcodigo" readonly>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <label for="">Categoria</label>
                            <select class="form-control" id="cbmCategoria">

                            </select>
                        </div>
                        <div class="col-lg-6 mb-3">
                            <label for="">Precio</label>
                            <input type="number" min="1" class="form-control" id="txtPrecio" placeholder="00.00">
                        </div>
                        <div class="col-lg-6 mb-3">
                            <label for="">Imagen Servicio</label>
                            <input type="file" id="txtImagen" class="form-control" accept="image/*">
                        </div>
                        <div class="col-lg-12">
                            <label for="">Descripción</label>
                            <textarea id="txtDescripcion" class="form-control" cols="30" rows="4" placeholder="Descripcion tecnica del producto que esta ingresando, sus caracteristicas distintivas y detalles descriptivos" maxlength="255"></textarea>
                        </div>
                        <div class="col-lg-12"><br>
                            <div class="alert alert-danger alert-bordered" id="divError" style="display: none;"></div>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="registrarServicio()">Guardar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN VENTANA MODAL REGISTRAR SERVICIO -->


<!-- VENTANA MODAL EDITAR SERVICIO -->
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title title__services" id="exampleModalLongTitle">Editar Servicio</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditarServicio" method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
                    <div class="row">
                        <div class="col-lg-6 mb-3">
                            <label for="">Servicio</label>
                            <input type="text" id="txtIdProducto" hidden>

                            <input type="text" class="form-control" id="txtServicioEditar" maxlength="100">
                        </div>
                        <div class="col-lg-6 mb-3">
                            <label for="">Categoria</label>
                            <select class="form-control" id="cbmCategoriaEditar">

                            </select>
                        </div>
                    
                        <div class="col-lg-6 mb-3">
                            <label for="">Precio</label>
                            <input type="number" min="1" class="form-control" id="txtPrecioEditar">
                        </div>
                        <div class="col-lg-6 mb-3">
                            <label for="">Estado</label>
                            <select class="form-control" id="cbmEstatus">
                                <option value="ACTIVO">ACTIVO</option>
                                <option value="INACTIVO">INACTIVO</option>
                            </select>
                        </div>
                       
                        <div class="col-lg-12 mb-3">
                            <label for="">Descripcion</label>
                            <textarea id="txtDescripcionEditar" class="form-control" cols="30" rows="4" maxlength="255"></textarea>
                        </div>    
                        <div class="col-lg-10 mb-3">
                            <label for="">Imagen del Servicio</label>
                            <input type="file" class="form-control" id="txtImagenEditar" accept="image/*">
                        </div>
                        <div class="col-lg-2 mb-3">
                            <label for="">&nbsp;</label><br>
                            <button class="btn btn-success" id="btnUpdateImage" onclick="editarFotoServicio()" style="width: 100%;">Actualizar Foto</button>
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
                <button type="button" class="btn btn-primary" id="btnUpdateServices" onclick="editarServicio()">Actualizar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN VENTANA MODAL EDITAR OFERTA -->

<div class="modal fade" id="modal_oferta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Agregar Oferta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioOferta">
                    <div class="row">
                        <div class="col-lg-12 mb-3">
                            <label for="">Oferta</label>
                            <select class="form-control" id="cbmOferta">
                                <option value="1">SI</option>
                                <option value="0">NO</option>
                            </select>
                        </div>
                        <div class="col-lg-12 mb-3" id="divDescuento">
                            <input type="text" id="txtIdProductoOferta" hidden>
                            <label for="">Descuento</label>
                            <input type="text" class="form-control" id="txtDescuento" onkeypress="return soloNumeros(event)">
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="agregarOferta()">Agregar Oferta</button>
            </div>
        </div>
    </div>
</div>

<script src="../js/servicio.js?rev=<?php echo time(); ?>"></script>
<script>
    $(document).ready(function() {
        listarServicio();
        listarCategoriaCombo();
       
    });

    /*CODIGO PARA LA VENTANA MODAL */
    $('#modal_registro').on('shown.bs.modal', function() {
        $('#txtServicio').trigger('focus')
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