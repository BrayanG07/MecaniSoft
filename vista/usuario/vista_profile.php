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
            <div class="col-lg-3 col-md-4">
                <div class="ibox">
                    <div class="ibox-body text-center">
                        <div class="m-t-20">
                            <img class="img-circle" id="txtImagenPerfil" width="150px" />
                        </div>
                        <h5 class="font-strong m-b-10 m-t-10" id="txtPersonaProfile"></h5>
                        <div class="m-b-20 text-muted" id="txtRolProfile">Web Developer</div>

                        <form id="formularioFotoProfile" method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
                            <div class="form-group mb-4">
                                <input type="file" id="txtImageProfile" class="form-control" accept="image/*">
                            </div>
                            <div>
                                <button class="btn btn-info btn-rounded m-b-10" onclick="editarFotoProfile()"><i class="fa fa-refresh"></i> Actualizar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-8">
                <div class="ibox">
                    <div class="ibox-body">
                        <ul class="nav nav-tabs">

                            <li class="nav-item">
                                <a class="nav-link active" href="#tab-2" data-toggle="tab"><i class="fa fa-user" style="font-size: 20px;"></i> Información Personal</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#tab-3" data-toggle="tab"><i class="fa fa-lock" style="font-size: 20px;"></i> Contraseña</a>
                            </li>
                        </ul>
                        
                        <div class="tab-content border p-4">
                            <!-- PESTANA UNO -->
                            <div class="tab-pane fade show active" id="tab-2">
                                <div class="row">
                                    <div class="col-lg-6 mb-3">
                                        <label for="">Nombres</label>
                                        <input type="text" id="txtNombresProfile" class="form-control" onkeypress="return soloLetras(event)" maxlength="100">
                                    </div>
                                    <div class="col-lg-6 mb-3">
                                        <label for="">Apellido Paterno</label>
                                        <input type="text" id="txtApellidoPaternoProfile" class="form-control" onkeypress="return soloLetras(event)" maxlength="50">
                                    </div>
                                    <div class="col-lg-6 mb-3">
                                        <label for="">Apellido Materno</label>
                                        <input type="text" id="txtApellidoMaternoProfile" class="form-control" onkeypress="return soloLetras(event)" maxlength="50">
                                    </div>
                                    <div class="col-lg-6 mb-3">
                                        <label for="">Correo</label>
                                        <input type="text" id="txtCorreoProfile" class="form-control" maxlength="70">
                                    </div>
                                    <div class="col-lg-6 mb-3">
                                        <label for="">Tipo Documento</label>
                                        <select class="form-control" id="cbmTipoDocumentoProfile">
                                            <option value="IDENTIDAD">IDENTIDAD</option>
                                            <option value="RTN">RTN</option>
                                            <option value="DNI">DNI</option>
                                            <option value="RUC">RUC</option>
                                            <option value="PASAPORTE">PASAPORTE</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-6 mb-3">
                                        <label for="">N° Documento</label>
                                        <input type="text" id="txtNumeroDocumentoProfile" class="form-control" maxlength="17">
                                    </div>
                                    <div class="col-lg-6 mb-4">
                                        <label for="">Genero</label>
                                        <select class="form-control" id="cbmSexoProfile">
                                            <option value="MASCULINO">MASCULINO</option>
                                            <option value="FEMENINO">FEMENINO</option>
                                            <option value="OTRO">OTRO</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-6 mb-4">
                                        <label for="">N° Telefono</label>
                                        <input type="text" class="form-control" id="txtTelefonoProfile" onkeypress="soloNumeros(event)" maxlength="17">
                                    </div>
                                    <div class="col-lg-12"><br>
                                        <div class="alert alert-danger alert-bordered" id="divErrorProfile" style="display: none;"></div>
                                    </div>
                                    <div class="col-lg-12">
                                        <button class="btn btn-success px-4" onclick="datosActualizar()">Actualizar Datos</button>
                                    </div>
                                </div>
                            </div>
                            <!-- PESTANA DOS -->
                            <div class="tab-pane fade" id="tab-3">
                                <form id="formularioModificarPassword">
                                    <div class="row">
                                        <div class="col-lg-12 mb-4">
                                            <label for="">Contraseña Actual</label>
                                            <input type="password" id="txtPasswordActualEscrita" class="form-control" placeholder="Ingrese su contraseña actual." maxlength="250">
                                            <input type="text" id="txtPasswordEncriptado" hidden>
                                        </div>
                                        <div class="col-lg-6 mb-4">
                                            <label for="">Nueva Contraseña</label>
                                            <input type="password" id="txtPasswordNuevo" class="form-control" placeholder="Ingrese la nueva contraseña para actualizar." maxlength="250">
                                        </div>
                                        <div class="col-lg-6 mb-4">
                                            <label for="">Confirmar Contraseña Nueva</label>
                                            <input type="password" id="txtPasswordNuevoConfirmacion" class="form-control" placeholder="Por favor confirme su nueva contraseña." maxlength="250">
                                        </div>
                                    </div>
                                </form>
                                <div class="col-lg-12">
                                    <button class="btn btn-success mb-2 px-3" onclick="actualizarPassword()"><i class="fa fa-refresh"></i> Actualizar Contraseña</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="../js/console_usuario.js?rev=<?php echo time(); ?>"></script>
            <script>
                obtenerDatosPerfil();
                $('#txtNombresProfile').trigger('focus')

                document.getElementById("txtImageProfile").addEventListener("change", () => {
                    var fileName = document.getElementById("txtImageProfile").value;
                    var idxDot = fileName.lastIndexOf(".") + 1;
                    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
                    if (extFile == "jpg" || extFile == "jpeg" || extFile == "png") {
                        //TO DO 
                    } else {
                        Swal.fire("Mensaje de advertencia", "Solo se aceptan imagenes, usted subio un archivo con extension: ." + extFile, "warning");
                        document.getElementById('txtImageProfile').value = "";
                    }
                });
            </script>
        </div>
    </div>
</div>