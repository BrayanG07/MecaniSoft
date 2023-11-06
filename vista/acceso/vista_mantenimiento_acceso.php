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


<input type="hidden" id="idUsuarioLog" value="<?php echo ($_SESSION['S_IDUSUARIO']); ?>">

<div class="content-header">
  <div class="container-fluid border p-3 shadow-lg rounded">
    <div class="row mb-2">
      <div class="col-md-12">
        <div class="ibox ibox-default">

          <div class="row mb-3">
            <div class="col-sm-6">
              <h3 class="m-0">Mantenimiento accesos</h3>
            </div>
            <div class="col-sm-6 text-right">
              <button class="btn btn-info" onclick="abrirModal()">Agregar Acceso</button>
            </div>

            <div class="col-sm-6 text-right">
              <div class="form-group">
                <label for="">&nbsp;</label>
                <input type="text" class="form-control" name="txtNombreUsuario" id="txtNombreUsuario" placeholder="Nombre del usuario" readonly>
                <input type="text" class="form-control" name="txtIdUsuario" id="txtIdUsuario" hidden>
              </div>
            </div>


            <div class="col-lg-1" style="margin-left: -10px;">
              <label for="">&nbsp;</label><br>
              <button type="button" class="btn btn-success" style="width: 100%;" onclick="abrirModalSelecUsuario()" <?php if (!in_array('2-4', $_SESSION['S_ACCESOS'])) echo 'disabled'; ?>> <i class="fa fa-search"></i> </button>
            </div>



          </div>

          <div class="ibox-body">
            <table id="tablaAccesosUsuario" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Acceso</th>
                  <th>Descripcion</th>
                  <th>Estatus</th>
                  <th>Acci&oacute;n</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
              <tfoot>
                <tr>
                  <th>#</th>
                  <th>Acceso</th>
                  <th>Descripcion</th>
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


<!-- VENTANA MODAL AÑADIR ACCESO -->
<div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Accesos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="ibox-body">
          <table id="tablaAccesos" class="table table-bordered table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>Acceso</th>
                <th class="text-center">Acci&oacute;n</th>
                <th>Descripcion</th>
                <th class='text-center'>Estatus</th>
              </tr>
            </thead>
            <tbody>
              

            </tbody>
            <tfoot>
              <tr>
                <th>#</th>
                <th>Acceso</th>
                <th class='text-center'>Acci&oacute;n</th>
                <th>Descripcion</th>
                <th class="text-center">Estatus</th>
              </tr>
            </tfoot>
          </table>
        </div>



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-success px-3" id="btnGuardarAccesos">Guardar</button>

      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL AÑADIR ACCESO -->


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
          <input type="text" class="form-control" id="txtRolNuevoEditar">
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



<!-- VENTANA MODAL  SELECCIONAR  USUARIO -->
<div class="modal fade" id="modal_seleccionar_usuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Seleccionar Usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="ibox-body">
          <table id="tablaUsuario" class="table table-bordered table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>Usuario</th>
                <th>Persona</th>
                <th>Rol</th>
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
                <th>Rol</th>
                <th>Genero</th>
                <th>Estatus</th>
                <th>Acci&oacute;n</th>
              </tr>
            </tfoot>
          </table>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <!-- <button type="button" class="btn btn-primary" onclick="editarRol()">Actualizar</button> -->
      </div>

    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL SELECCIONAR USUARIO -->


<!-- <script src="../js/console_rol.js?rev=<?php echo time(); ?>"></script> -->
<script src="../js/acceso.js?rev=<?php echo time(); ?>"></script>
<script>
  $(document).ready(function() {
    listarUsuario();
    listarAccesoUsuario(0);
    setiarAccesos(accesos);
    
  });

  /*CODIGO PARA LA VENTANA MODAL */
  $('#modal_registro').on('shown.bs.modal', function() {
    $('#txt_rol').trigger('focus');
  })
</script>