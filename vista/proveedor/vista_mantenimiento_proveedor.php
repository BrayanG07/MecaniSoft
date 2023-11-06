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
              <h3 class="m-0">Mantenimiento de proveedor</h3>
            </div>
            <div class="col-sm-6 text-right">
              <button class="btn btn-info" onclick="abrirModal()">Nuevo Registro</button>
            </div>
          </div>

          <div class="ibox-body">
            <table id="tablaProveedor" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Proveedor</th>
                  <th>Razon Social</th>
                  <th>Correo</th>
                  <th>Contacto</th>
                  <th class="text-center">N&deg; Contacto</th>
                  <th>N&deg; Documento</th>
                  <th class="text-center">Tipo Documento</th>
                  <th>Estatus</th>
                  <th>Acci&oacute;n</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
              <tfoot>
                <tr>
                  <th>#</th>
                  <th>Proveedor</th>
                  <th>Razon Social</th>
                  <th>Correo</th>
                  <th>Contacto</th>
                  <th class="text-center">N&deg; Contacto</th>
                  <th>N&deg; Documento</th>
                  <th class="text-center">Tipo Documento</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Proveedor</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="formularioRegistroProveedor">
          <div class="row">
            <div class="col-lg-6 mb-3">
              <label for="">Nombre</label>
              <!-- El evento onkeypress se produce cuando el usuario pulsa una tecla -->
              <input type="text" class="form-control" id="txtNombre" onkeypress="return soloLetras(event)" placeholder="Ingrese el nombre o los dos nombres del proveedor" maxlength="100">
            </div>
            <div class="col-lg-3 mb-3">
              <label for="">Apellido Paterno</label>
              <input type="text" class="form-control" id="txtApellidoPaterno" onkeypress="return soloLetras(event)" placeholder="Ingrese el apellido paterno" maxlength="50">
            </div>
            <div class="col-lg-3 mb-3">
              <label for="">Apellido Materno</label>
              <input type="text" class="form-control" id="txtApellidoMaterno" onkeypress="return soloLetras(event)" placeholder="Ingrese el apellido materno" maxlength="50">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Razon Social</label>
              <input type="text" class="form-control" id="txtRazonSocial" placeholder="Ingrese la razon social(Nombre Empresa)" maxlength="80">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Correo Electronico</label>
              <input type="email" class="form-control" id="txtCorreo" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" placeholder="Ej: correo@correo.com" maxlength="70">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Nombre Contacto</label>
              <input type="text" class="form-control" id="txtNombreContacto" onkeypress="return soloLetras(event)" placeholder="Ingrese el nombre de contacto del proveedor" maxlength="150">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">N&uacute;mero Contacto</label>
              <input type="text" class="form-control" id="txtNumeroContacto" onkeypress="return soloNumeros(event)" placeholder="Ingrese el numero de contacto del proveedor" maxlength="17">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Tipo Documento</label>
              <select class="form-control" id="cbmTipoDocumento">
                <option value="RTN">RTN</option>
              </select>
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Nro Documento</label>
              <input type="text" class="form-control" id="txtNumero" onkeypress="return soloNumeros(event)" placeholder="Ingrese el numero de documento (RTN, DNI etc..)" maxlength="17">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Genero</label>
              <select class="form-control" id="cbmSexo">
                <option value="MASCULINO">MASCULINO</option>
                <option value="FEMENINO">FEMENINO</option>
                <option value="OTRO">OTRO</option>
              </select>
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Nro Telefono</label>
              <input type="text" class="form-control" id="txtTelefono" placeholder="+504 8920-1085 ó 50496851023 ó 94562010" maxlength="17">
            </div>
            <div class="col-lg-12"><br>
              <div class="alert alert-danger alert-bordered" id="divError" style="display: none;"></div>
            </div>
          </div>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="registrarProveedor()">Guardar</button>
      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL REGISTRAR ROL -->

<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title title_supplier" id="exampleModalLongTitle">Editar Persona</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="formularioEditarProveedor">
          <div class="row">
            <div class="col-lg-4 mb-3">
              <input type="text" id="txtIdProveedor" hidden>
              <input type="text" id="txtIdPersona" hidden>
              <label for="">Nombre</label>
              <input type="text" class="form-control" id="txtNombreEditar" onkeypress="return soloLetras(event)" maxlength="100">
            </div>
            <div class="col-lg-4 mb-3">
              <label for="">Apellido Paterno</label>
              <input type="text" class="form-control" id="txtApellidoPaternoEditar" onkeypress="return soloLetras(event)" maxlength="50">
            </div>
            <div class="col-lg-4 mb-3">
              <label for="">Apellido Materno</label>
              <input type="text" class="form-control" id="txtApellidoMaternoEditar" onkeypress="return soloLetras(event)" maxlength="50">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Razon Social</label>
              <input type="text" class="form-control" id="txtRazonSocialEditar" maxlength="80">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Correo Electronico</label>
              <input type="email" class="form-control" id="txtCorreoEditar" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" maxlength="70">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Nombre Contacto</label>
              <input type="text" class="form-control" id="txtNombreContactoEditar" onkeypress="return soloLetras(event)" maxlength="150">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">N&uacute;mero Contacto</label>
              <input type="text" class="form-control" id="txtNumeroContactoEditar" onkeypress="return soloNumeros(event)" maxlength="17">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Tipo Documento</label>
              <select class="form-control" id="cbmTipoDocumentoEditar">
                <option value="RTN">RTN</option>
              </select>
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Nro Documento</label>
              <input type="text" class="form-control" id="txtNumeroEditar" onkeypress="return soloNumeros(event)" maxlength="17">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Genero</label>
              <select class="form-control" id="cbmSexoEditar">
                <option value="MASCULINO">MASCULINO</option>
                <option value="FEMENINO">FEMENINO</option>
                <option value="OTRO">OTRO</option>
              </select>
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Nro Telefono</label>
              <input type="text" class="form-control" id="txtTelefonoEditar" maxlength="17">
            </div>
            <div class="col-lg-12"><br>
              <div class="alert alert-danger alert-bordered" id="divErrorEditar" style="display: none;"></div>
            </div>
          </div>
        </form>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary btnUpdateSupplier" onclick="editarProveedor()">Actualizar</button>
      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL EDITAR ROL -->

<script src="../js/proveedor.js?rev=<?php echo time(); ?>"></script>
<script>
  $(document).ready(function() {

    listarProveedor();
  });

  /*CODIGO PARA LA VENTANA MODAL */
  $('#modal_registro').on('shown.bs.modal', function() {
    $('#txtNombre').trigger('focus')
  })
</script>