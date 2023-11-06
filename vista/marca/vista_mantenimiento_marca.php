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
              <h3 class="m-0">Mantenimiento de marca</h3>
            </div>
            <div class="col-sm-6 text-right">
              <button class="btn btn-info" onclick="abrirModal()">Nuevo Registro</button>
            </div>
          </div>

          <div class="ibox-body">
            <table id="tablaMarca" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Marca</th>
                  <th>Descripcion</th>
                  <th>Estado</th>
                  <th>Acci&oacute;n</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
              <tfoot>
                <tr>
                  <th>#</th>
                  <th>Marca</th>
                  <th>Descripcion</th>
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

<!-- VENTANA MODAL REGISTRAR  -->
<div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de marca</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="frmRegistrarMarca">

          <input type="hidden" id="txtUsuarioLog" value="<?php echo $_SESSION['S_IDUSUARIO']; ?>">
          <div class="col-lg-12">
            <label for="">Nombre Marca:</label>
            <input type="text" class="form-control" id="txtMarca" placeholder="Por favor ingrese el nombre de la marca" maxlength="45">
          </div>
          <div class="col-lg-12">
            <label for="">Descripción:</label>
            <textarea id="txtDescripcion" class="form-control" cols="30" rows="4" placeholder="Por favor ingrese la descripcion de la marca, esta descripcion es opcional" maxlength="255"></textarea>
          </div>

          <!-- <div class="col-lg-12">
            <label for="">Estado:</label>

                <select class="form-control" name="txtEstado" id="txtEstado">
                <option value="ACTIVO">ACTIVO</option>
                <option value="INACTIVO">INACTIVO</option>
              </select>
        
          </div> -->
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="registrarMarca()">Guardar</button>
      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL REGISTRAR  -->


<!-- VENTANA MODAL EDITAR  -->
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title title__mark" id="exampleModalLongTitle">Editar Marca</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="col-lg-12">
          <input type="text" id="txtIdMarca" hidden>
          <label for="">Marca</label>
          <input type="text" id="txtMarcaActualEditar" hidden>
          <input type="text" class="form-control" id="txtMarcaNuevoEditar" maxlength="45">
        </div>
        <div class="col-lg-12">
          <label for="">Descripción</label>
          <textarea id="txtDescripcionEditar" class="form-control" cols="30" rows="4" placeholder="Por favor ingrese la descripcion de la marca, esta descripcion es opcional" maxlength="255"></textarea>
        </div>
        <div class="col-lg-12">
          <label for="">Estado</label>
          <select class="form-control" id="cbmEstatus">
            <option value="ACTIVO">ACTIVO</option>
            <option value="INACTIVO">INACTIVO</option>
          </select>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnUpdateMark" onclick="editarMarca()">Actualizar</button>
      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL EDITAR  -->


<script src="../js/marca.js?rev=<?php echo time(); ?>"></script>
<script>
  $(document).ready(function() {
    listarMarca();
  });

  /*CODIGO PARA LA VENTANA MODAL */
  $('#modal_registro').on('shown.bs.modal', function() {
    $('#txtMarca').trigger('focus')
  })
</script>