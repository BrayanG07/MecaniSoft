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

                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <h3 class="m-0">Mantenimiento de usuario</h3>
                        </div>
                        <div class="col-sm-6 text-right">
                            <button class="btn btn-info px-4" onclick="abrirModal()">Nuevo Registro</button>
                        </div>
                    </div>

                    <div class="ibox-body">
                        <table id="tablaUsuario" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Usuario</th>
                                    <th>Persona</th>
                                    <th>N&deg; Documento</th>
                                    <th>Rol</th>
                                    <th>Email</th>
                                    <th class="text-center">Imagen</th>
                                    <th>Genero</th>
                                    <th>Estatus</th>
                                    <th>Acci&oacute;n</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>Usuario</th>
                                    <th>Persona</th>
                                    <th>N&deg; Documento</th>
                                    <th>Rol</th>
                                    <th>Email</th>
                                    <th class="text-center">Imagen</th>
                                    <th>Genero</th>
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


<!-- VENTANA MODAL REGISTRAR ROL -->
<div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Registro de Usuario</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioRegistroUsuario" method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
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
                            <label for="">Usuario</label>
                            <input type="text" class="form-control" id="txtUsuario" placeholder="Ingrese su username" maxlength="40">
                        </div>
                        <div class="col-lg-6 mb-3">
                            <label for="">Password</label>
                            <input type="password" class="form-control" id="txtPassword" placeholder="******************" maxlength="255">
                        </div>

                        <div class="col-lg-6 mb-3">
                            <label for="">Email</label>
                            <input type="text" class="form-control" id="txtEmail" placeholder="ej: correo@correo.com" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" maxlength="70">
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
                            <input type="text" class="form-control" id="txtNumero" onkeypress="return soloNumeros(event)" placeholder="Ingrese el numero de documento (RTN, DNI etc..)" maxlength="17">
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
                            <input type="text" class="form-control" id="txtTelefono" placeholder="+504 8920-1085 ó 50496851023 ó 94562010" maxlength="17">
                        </div>
                        <div class="col-lg-6">
                            <label for="">Rol</label>
                            <select class="form-control" id="cbmRol">

                            </select>
                        </div>
                        <div class="col-lg-6">
                            <label for="">Subir Imagen</label>
                            <input type="file" class="form-control" id="txtImagen" accept="image/*">
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="registrarUsuario()">Guardar</button>
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
                <h5 class="modal-title title__user" id="exampleModalLongTitle">Editar Usuario</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditarUsuario" method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
                    <div class="row">
                        <div class="col-lg-6 mb-3">
                            <label for="">Usuario</label>
                            <input type="text" id="txtUsuarioId" hidden>
                            <!-- El evento onkeypress se produce cuando el usuario pulsa una tecla -->
                            <input type="text" class="form-control" id="txtUsuarioEditarActual" disabled required>
                        </div>

                        <div class="col-lg-6 mb-3">
                            <label for="">Persona</label>
                            <input type="hidden" id="txtIdPersona">
                            <input type="text" id="txtPersonaEditar" class="form-control" disabled>
                        </div>
                        <div class="col-lg-6 mb-3">
                            <label for="">Rol</label>
                            <select class="form-control" id="cbmRolEditar" required>

                            </select>
                        </div>
                        <div class="col-lg-6 mb-3">
                            <label for="">Estatus</label>
                            <select class="form-control" id="cbmEstatus" required>
                                <option value="ACTIVO">ACTIVO</option>
                                <option value="INACTIVO">INACTIVO</option>
                            </select>
                        </div>
                        <div class="col-lg-10 mb-3">
                            <label for="">Subir Imagen</label>
                            <input type="file" class="form-control" id="txtImagenEditar" accept="image/*">
                        </div>
                        <div class="col-lg-2 mb-3">
                            <label for="">&nbsp;</label><br>
                            <button class="btn btn-success" id="btnUpdateImage" onclick="editarFoto()" style="width: 100%;">Actualizar Imagen</button>
                        </div>
                        <div class="col-lg-12 text-center" style="display: none;" id="cont__img">
                            <img src="" alt="" width="250px" height="250px" class="img__product">
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="btnUpdateUser" onclick="editarUsuario()">Actualizar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN VENTANA MODAL EDITAR ROL -->

<script src="../js/console_usuario.js?rev=<?php echo time(); ?>"></script>
<script>
    $(document).ready(function() {
        listarUsuario();
        listarRolCombo();
    });

    /*CODIGO PARA LA VENTANA MODAL */
    $('#modal_registro').on('shown.bs.modal', function() {
        $('#txtUsuario').trigger('focus')
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

    //VALIDACION IMAGEN EDITAR
    document.getElementById("txtImagenEditar").addEventListener("change", () => {
        var fileName = document.getElementById("txtImagenEditar").value;
        var idxDot = fileName.lastIndexOf(".") + 1;
        var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
        if (extFile == "jpg" || extFile == "jpeg" || extFile == "png") {
            //TO DO 
        } else {
            Swal.fire("Mensaje de advertencia", "Solo se aceptan imagenes, usted subio un archivo con extension: ." + extFile, "warning");
            document.getElementById('txtImagenEditar').value = "";
        }
    });
</script>