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
              <h3 class="m-0">Mantenimiento de categoria</h3>
            </div>
            <div class="col-sm-6 text-right">
              <button class="btn btn-info" onclick="abrirModal()">Nuevo Registro</button>
            </div>
          </div>

          <div class="ibox-body">
            <table id="tablaCategoria" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Categoria</th>
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
                  <th>Categoria</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Categoria</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="formularioRegistrarCategoria">
          <label for="">Categoria</label>
          <input type="text" class="form-control" id="txtCategoria" maxlength="80">
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="registrarCategoria()">Guardar</button>
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
        <h5 class="modal-title title__modal" id="exampleModalLongTitle">Editar Categoria</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="col-lg-12">
          <input type="text" id="txtIdCategoria" hidden>
          <label for="">Categoria</label>
          <input type="text" id="txtCategoriaActualEditar" hidden>
          <input type="text" class="form-control" id="txtCategoriaNuevoEditar" maxlength="80">
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
        <button type="button" class="btn btn-primary" id="btnUpdateCategory" onclick="editarCategoria()">Actualizar</button>
      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL EDITAR ROL -->






<script src="../js/console_categoria.js?rev=<?php echo time(); ?>"></script>
<script>
  $(document).ready(function() {

    listarCategoria();
  });

  /*CODIGO PARA LA VENTANA MODAL */
  $('#modal_registro').on('shown.bs.modal', function() {
    $('#txtCategoria').trigger('focus')
  })
</script>