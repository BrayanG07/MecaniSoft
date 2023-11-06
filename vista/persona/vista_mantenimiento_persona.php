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
              <h3 class="m-0">Mantenimiento persona</h3>
            </div>
            <div class="col-sm-6 text-right">
              <button class="btn btn-info" onclick="abrirModal()">Nuevo Registro</button>
            </div>
          </div>

          <div class="ibox-body">
            <table id="tabla_persona" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Persona</th>
                  <th>N&deg; Documento</th>
                  <th class="text-center">Tipo Documento</th>
                  <th class="text-center">Sexo</th>
                  <th>Telefono</th>
                  <th>Correo</th>
                  <th>Tipo Persona</th>
                  <th>Acci&oacute;n</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
              <tfoot>
                <tr>
                  <th>#</th>
                  <th>Persona</th>
                  <th>N&deg; Documento</th>
                  <th class="text-center">Tipo Documento</th>
                  <th class="text-center">Sexo</th>
                  <th>Telefono</th>
                  <th>Correo</th>
                  <th>Tipo Persona</th>
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
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de persona</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="formularioRegistroPersona">
          <div class="row">
            <div class="col-lg-12 mb-2">
              <label for="">Nombre</label>
              <!-- El evento onkeypress se produce cuando el usuario pulsa una tecla -->
              <input type="text" class="form-control" id="txtNombre" onkeypress="return soloLetras(event)" maxlength="100">
            </div>

            <div class="col-lg-6 mb-2">
              <label for="">Apellido Paterno</label>
              <input type="text" class="form-control" id="txtApellidoPaterno" onkeypress="return soloLetras(event)" maxlength="50">
            </div>
            <div class="col-lg-6 mb-2">
              <label for="">Apellido Materno</label>
              <input type="text" class="form-control" id="txtApellidoMaterno" onkeypress="return soloLetras(event)" maxlength="50">
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
              <input type="text" class="form-control" id="txtNumero" onkeypress="return soloNumeros(event)" maxlength="17">
            </div>
            <div class="col-lg-6 mb-2">
              <label for="">Sexo</label>
              <select class="form-control" id="cbmSexo">
                <option value="MASCULINO">MASCULINO</option>
                <option value="FEMENINO">FEMENINO</option>
                <option value="OTRO">OTRO</option>
              </select>
            </div>
            <div class="col-lg-6 mb-2">
              <label for="">Nro Telefono</label>
              <input type="text" class="form-control" id="txtTelefono" maxlength="17">
            </div>
            <div class="col-lg-12"><br>
              <div class="alert alert-danger alert-bordered" id="divError" style="display: none;"></div>
            </div>
          </div>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="registrarPersona()">Guardar</button>
      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL REGISTRAR ROL -->


<!-- VENTANA MODAL EDITAR ROL -->
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Persona</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="formularioEditarPersona">
          <div class="row">
            <input type="text" id="txtIdPersona" hidden>
            <div class="col-lg-12 mb-2">
              <label for="">Nombre</label>
              <!-- El evento onkeypress se produce cuando el usuario pulsa una tecla -->
              <input type="text" class="form-control" id="txtNombreEditar" onkeypress="return soloLetras(event)" maxlength="100">
            </div>

            <div class="col-lg-6 mb-2">
              <label for="">Apellido Paterno</label>
              <input type="text" class="form-control" id="txtApellidoPaternoEditar" onkeypress="return soloLetras(event)" maxlength="50">
            </div>
            <div class="col-lg-6 mb-2">
              <label for="">Apellido Materno</label>
              <input type="text" class="form-control" id="txtApellidoMaternoEditar" onkeypress="return soloLetras(event)" maxlength="50">
            </div>
            <div class="col-lg-6 mb-2">
              <label for="">Tipo Documento</label>
              <select class="form-control" id="cbmTipoDocumentoEditar">
                <option value="IDENTIDAD">IDENTIDAD</option>
                <option value="RTN">RTN</option>
                <option value="DNI">DNI</option>
                <option value="RUC">RUC</option>
                <option value="PASAPORTE">PASAPORTE</option>
              </select>
            </div>
            <div class="col-lg-6 mb-2">
              <label for="">Nro Documento</label>
              <input type="text" class="form-control" id="txtNumeroEditarActual" onkeypress="return soloNumeros(event)" hidden>
              <input type="text" class="form-control" id="txtNumeroEditarNuevo" onkeypress="return soloNumeros(event)" maxlength="17">
            </div>
            <div class="col-lg-4 mb-2">
              <label for="">Genero</label>
              <select class="form-control" id="cbmSexoEditar">
                <option value="MASCULINO">MASCULINO</option>
                <option value="FEMENINO">FEMENINO</option>
              </select>
            </div>
            <div class="col-lg-4 mb-2">
              <label for="">Nro Telefono</label>
              <input type="text" class="form-control" id="txtTelefonoEditar" maxlength="17">
            </div>
            <div class="col-lg-4 mb-2">
              <label for="">Estatus</label>
              <select class="form-control" id="cbmEstatus">
                <option value="ACTIVO">ACTIVO</option>
                <option value="INACTIVO">INACTIVO</option>
              </select>
            </div>

            <div class="col-lg-12"><br>
              <div class="alert alert-danger alert-bordered" id="divErrorEditar" style="display: none;"></div>
            </div>
          </div>
        </form>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="editarPersona()">Actualizar</button>
      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL EDITAR ROL -->






<script src="../js/console_persona.js?rev=<?php echo time(); ?>"></script>
<script>
  $(document).ready(function() {

    listarPersona();
  });

  /*CODIGO PARA LA VENTANA MODAL */
  $('#modal_registro').on('shown.bs.modal', function() {
    $('#txtNombre').trigger('focus')
  })
</script>