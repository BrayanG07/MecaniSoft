<?php
session_start();

echo "<script> var accesos = [];</script>";
if (!isset($_SESSION['S_IDUSUARIO'])) {
  header('Location: ../login.php');
}

foreach ($_SESSION['S_ACCESOS'] as $ac) {
  echo "<script>  accesos.push('" . $ac . "')</script>";
}
?>

<input type="hidden" id="idUsuarioLog" value="<?php echo ($_SESSION['S_IDUSUARIO']); ?>">


<div class="content-header">
  <div class="container-fluid border p-3 shadow-lg rounded">
    <div class="row">
      <div class="col-md-12">
        <div class="ibox ibox-default">

          <div class="row my-3">
            <div class="col-sm-6">
              <h3 class="m-0">Mantenimiento de cliente</h3>
            </div>
            <div class="col-sm-6 text-right">
              <button class="btn btn-info" onclick="abrirModal()">Nuevo Registro</button>
            </div>
          </div>

          <div class="ibox-body">
            <table id="tablaCliente" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Cliente</th>
                  <th>N&deg; Documento</th>
                  <th class="text-center">Tipo Documento</th>
                  <th class="text-center">Genero</th>
                  <th>Telefono</th>
                  <th>Correo</th>
                  <th>Estatus</th>
                  <th>Acci&oacute;n</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
              <tfoot>
                <tr>
                  <th>#</th>
                  <th>Cliente</th>
                  <th>N&deg; Documento</th>
                  <th class="text-center">Tipo Documento</th>
                  <th class="text-center">Genero</th>
                  <th>Telefono</th>
                  <th>Correo</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Cliente</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="formularioRegistroCliente">
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
              <label for="">Correo Electronico</label>
              <input type="email" class="form-control" id="txtCorreo" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" placeholder="Ej: correo@correo.com" maxlength="70">
            </div>
            <div class="col-lg-6 mb-2">
              <label for="">Tipo Documento</label>
              <select class="form-control" id="cbmTipoDocumento" style="width: 100%;">
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
              <select class="form-control" id="cbmSexo" style="width: 100%;">
                <option value="MASCULINO">MASCULINO</option>
                <option value="FEMENINO">FEMENINO</option>
                <option value="OTRO">OTRO</option>
              </select>
            </div>
            <div class="col-lg-6 mb-2">
              <label for="">Nro Telefono</label>
              <input type="text" class="form-control" id="txtTelefono" placeholder="+504 8920-1085 ó 50496851023 ó 94562010" maxlength="17">
            </div>
            <div class="col-lg-6 mb-3">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="txtRepresenta">
                <label class="form-check-label" for="txtRepresenta">
                  Representante de empresa
                </label>
              </div>
            </div>
            <div class="col-lg-6 mb-3" style="display: none;" id="cont__empresa">
              <label for="">Nombre de la empresa</label>
              <input type="text" class="form-control" id="txtNombreEmpresa" placeholder="Ingrese el nombre de la empresa a la que representa el cliente." maxlength="100">
            </div>
            <div class="col-lg-12"><br>
              <div class="alert alert-danger alert-bordered" id="divError" style="display: none;"></div>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="registrarCliente()">Guardar</button>
      </div>
    </div>
  </div>
</div>
<!-- FIN VENTANA MODAL REGISTRAR ROL -->

<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title title__customer" id="exampleModalLongTitle">Editar Cliente</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="formularioEditarCliente">
          <div class="row">
            <div class="col-lg-4 mb-3">
              <input type="text" id="txtIdPersona" hidden>
              <label for="">Nombre</label>
              <input type="text" class="form-control" id="txtNombreEditar" onkeypress="return soloLetras(event)" maxlength="100">
            </div>
            <div class="col-lg-4 mb-3">
              <label for="">Apellido Paterno</label>
              <input type="text" class="form-control" id="txtApellidoPaternoEditar" onkeypress="return soloLetras(event)" maxlength="45">
            </div>
            <div class="col-lg-4 mb-3">
              <label for="">Apellido Materno</label>
              <input type="text" class="form-control" id="txtApellidoMaternoEditar" onkeypress="return soloLetras(event)" maxlength="45">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Correo Electronico</label>
              <input type="email" class="form-control" id="txtCorreoEditar" placeholder="Ingrese el correo electronico del cliente" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" maxlength="70">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Tipo Documento</label>
              <select class="form-control" id="cbmTipoDocumentoEditar" style="width: 100%;">
                <option value="IDENTIDAD">IDENTIDAD</option>
                <option value="RTN">RTN</option>
                <option value="DNI">DNI</option>
                <option value="RUC">RUC</option>
                <option value="PASAPORTE">PASAPORTE</option>
              </select>
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Nro Documento</label>
              <input type="text" class="form-control" id="txtNumeroEditar" onkeypress="return soloNumeros(event)" maxlength="17">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Genero</label>
              <select class="form-control" id="cbmSexoEditar" style="width: 100%;">
                <option value="MASCULINO">MASCULINO</option>
                <option value="FEMENINO">FEMENINO</option>
                <option value="OTRO">OTRO</option>
              </select>
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Nro Telefono</label>
              <input type="text" class="form-control" id="txtTelefonoEditar" maxlength="17">
            </div>
            <div class="col-lg-6 mb-3">
              <label for="">Nombre de la empresa</label>
              <input type="text" class="form-control" id="txtNombreEmpresaEdit" placeholder="Ingrese el nombre de la empresa a la que representa el cliente." maxlength="100">
            </div>
            <div class="col-lg-12"><br>
              <div class="alert alert-danger alert-bordered" id="divErrorEditar" style="display: none;"></div>
            </div>
          </div>
        </form>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary btnUpdateCustomer" onclick="editarCliente()">Actualizar</button>
      </div>
    </div>
  </div>
</div>

<script src="../js/cliente.js?rev=<?php echo time(); ?>"></script>
<script>
  $(document).ready(function() {

    listarCliente();
  });

  /*CODIGO PARA LA VENTANA MODAL */
  $('#modal_registro').on('shown.bs.modal', function() {
    $('#txtNombre').trigger('focus')
  })
</script>