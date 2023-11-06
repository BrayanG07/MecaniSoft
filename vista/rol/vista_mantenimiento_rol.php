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
    <div class="row mb-2">
      <div class="col-md-12">
        <div class="ibox ibox-default">

          <div class="row mb-3">
            <div class="col-sm-6">
              <h3 class="m-0">Mantenimiento rol</h3>
            </div>
            <div class="col-sm-6 text-right">
              <button class="btn btn-info" onclick="abrirModal()">Nuevo Registro</button>
            </div>
          </div>

          <div class="ibox-body">
            <table id="tabla_rol" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Rol</th>
                  <th>Fecha Registro</th>
                  <th>Estatus</th>
                  <th>Acci&oacute;n</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
              <tfoot>
                <tr>
                  <th>#</th>
                  <th>Rol</th>
                  <th>Fecha Registro</th>
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
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de rol</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="formularioRegistrarRol">
          <label for="">Rol</label>
          <input type="text" class="form-control" id="txtRol" maxlength="45">
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="registrarRol()">Guardar</button>
      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL REGISTRAR ROL -->


<!-- VENTANA MODAL EDITAR ROL -->
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar de rol</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="col-lg-12">
          <input type="text" id="txtIdRol" hidden>
          <label for="">Rol</label>
          <input type="text" id="txtRolActualEditar" hidden>
          <input type="text" class="form-control" id="txtRolNuevoEditar" maxlength="45">
        </div>

        <div class="col-lg-12">
          <label for="">Estatus</label>
          <select class="form-control" id="cbm_estatus" style="width: 100%;">
            <option value="ACTIVO">ACTIVO</option>
            <option value="INACTIVO">INACTIVO</option>
          </select>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="editarRol()">Actualizar</button>
      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL EDITAR ROL -->






<script src="../js/console_rol.js?rev=<?php echo time(); ?>"></script>
<script>
  $(document).ready(function() {
    listar_rol();
  });

  /*CODIGO PARA LA VENTANA MODAL */
  $('#modal_registro').on('shown.bs.modal', function() {
    $('#txt_rol').trigger('focus')
  })
</script>