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
<script src="../js/tarea.js?rev=<?php echo time(); ?>"></script>

<div id="calendar">


</div>


<!-- VENTANA MODAL REGISTRAR TAREA -->
<div class="modal fade" id="modal__tarea" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">REGISTRAR TRABAJO</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="frmRegisterTask">
          <div class="col-lg-12 mb-3">
            <input type="hidden" id="txtDateStart">
            <input type="hidden" id="txtDateEnd">
            <label for="">Seleccione la orden de trabajo:</label>
            <select id="cboWorkOrder" class="form-control">

            </select>
          </div>
          <div class="col-lg-12 mx-auto" id="cont__services">
            <table class="table table-bordered" id="tblServices">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Servicio</th>
                  <th class="text-center">Trabajar</th>
                  <th class="th__notas text-center">Notas</th>
                  <th class="text-center">Estado</th>
                  <th class="text-center">Acción</th>
                </tr>
              </thead>
              <tbody>

              </tbody>
            </table>
          </div>


        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnSaveTask">Guardar</button>
      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL REGISTRAR TAREA -->


<!-- VENTANA MODAL vista-editar TAREA -->
<div class="modal fade" id="modal__work" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">DETALLES DEL TRABAJO SELECCIONADO</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="frmUpdateTask">
          <div class="col-lg-12 mb-3">
            <label for="">Trabajo</label>
            <input type="hidden" id="txtIdTask">
            <input type="text" class="form-control" id="txtTitleEdit" disabled>
          </div>
          <div class="col-lg-12 mb-3">
            <label for="">Cliente</label>
            <input type="text" class="form-control" id="txtCliente" disabled>
          </div>
          <div class="col-lg-12 mb-3">
            <label for="">Información del vehículo</label>
            <input type="text" class="form-control" id="txtVehiculo" disabled>
          </div>
          <div class="col-lg-12 mb-3">
            <label for="">Notas/Observaciones</label>
            <textarea class="form-control" id="txtNotas" rows="3" placeholder="Ingrese una descripcion o recomendacion acerca del trabajo que hizo o esta haciendo."></textarea>
          </div>
          <div class="col-lg-12 mb-3" id="estado_principal">
            <label for="">Estado</label>
            <select id="cboState" class="form-control">
              <option value="PENDIENTE">PENDIENTE</option>
              <option value="FINALIZADO">FINALIZADO</option>
            </select>
          </div>
          <div class="col-lg-12 mb-3" style="display: none;" id="anulada">
            <label for="">Estado</label>
            <input type="text" class="form-control" id="txtOrdenAnulada" disabled>
          </div>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnUpdateTask">Actualizar</button>
      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL vista-editar TAREA -->