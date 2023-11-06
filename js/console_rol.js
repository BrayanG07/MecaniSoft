var accesos;
function setiarAccesos(acc){
    accesos = acc;
}

var tablaRol;
function listar_rol() {
  tablaRol = $("#tabla_rol").DataTable({
    dom: 'lftiprB', //Importante para Imprimir los botones, indica la posicion de los botones
    buttons: [
      'copy', 'csv', 'excel', 'pdf', 'print'
    ],
    "ordering": true,
    "pageLength": 10,
    "destroy": true,
    "async": false,
    "responsive": true,
    "autoWidth": false,
    "ajax": {
      "method": "POST",
      "url": "../controlador/rol/controlador_rol.php?opcion=listar",
    },
    "columns": [
      { "defaultContent": "" },
      { "data": "rol_nombre" },
      { "data": "rol_feregistro" },
      {
        "data": "rol_estatus",
        render: function (data, type, row) {
          if (data === "ACTIVO") {
            return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
          } else {
            return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
          }

        }

      },
      { "defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>" }

    ],
    "fnRowCallback": function (nRow) {
      $($(nRow).find("td")[5]).css('text-align', 'left');
    },
    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
    },
    select: true
  });
  tablaRol.on('draw.dt', function () {
    var PageInfo = $('#tabla_rol').DataTable().page.info();
    tablaRol.column(0, { page: 'current' }).nodes().each(function (cell, i) {
      cell.innerHTML = i + 1 + PageInfo.start;
    });
  });
}

$('#tabla_rol').on('click', '.editar', function () {
  if (!accesos.includes('20-2')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
}
  var data = tablaRol.row($(this).parents('tr')).data(); 

  if (tablaRol.row(this).child.isShown()) { 
    var data = tablaRol.row(this).data();
  }
  $("#modal_editar").modal({ backdrop: 'static', keyboard: false }); 
  $("#modal_editar").modal('show');
  document.querySelector("#txtIdRol").value = data.rol_id;
  document.querySelector("#txtRolActualEditar").value = data.rol_nombre;
  document.querySelector("#txtRolNuevoEditar").value = data.rol_nombre;

  //Setear la data al OPTION
  $("#cbm_estatus").val(data.rol_estatus).trigger("change");
});

function registrarRol() {
  var rol = document.querySelector('#txtRol').value;

  if (rol.length == 0) {
    return Swal.fire('Mensaje de advertencia', 'Llene el campo vacio', 'warning');
  }

  $.ajax({
    url: '../controlador/rol/controlador_rol.php?opcion=registrar',
    type: 'POST',
    data: {
      rol: rol
    }
  }).done(function (resp) {
    if (resp > 0) {

      if (resp == 1) {
        tablaRol.ajax.reload();
        $("#modal_registro").modal('hide'); 
        document.querySelector('#formularioRegistrarRol').reset(); 

        Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
      } else {
        Swal.fire('Mensaje de advertencia', 'El rol ingresado ya se encuentra en la base de datos', 'warning');
      }

    } else {
      Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
    }
  });
}

function editarRol() {
  var id = document.querySelector('#txtIdRol').value;
  var rolActual = document.querySelector('#txtRolActualEditar').value;
  var rolNuevo = document.querySelector('#txtRolNuevoEditar').value;
  var estatus = document.querySelector('#cbm_estatus').value;

  if (id.length == 0 || rolActual.length == 0 || rolNuevo.length == 0 || estatus.length == 0) {
    Swal.fire('Mensaje de advertencia', 'Llene los campos vacios', 'warning');
  }

  $.ajax({
    url: '../controlador/rol/controlador_rol.php?opcion=editar',
    type: 'POST',
    data: {
      id: id,
      rolactual: rolActual,
      rolnuevo: rolNuevo,
      estatus: estatus
    }
  }).done(function (resp) {
    if (resp > 0) {
           if(resp == 3){

            return Swal.fire('Mensaje de advertencia', 'El rol no se puede editar ya que esta en uso en el sistema', 'warning');
        }

      if (resp == 1) {
        tablaRol.ajax.reload();
        $("#modal_editar").modal('hide'); 
        Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
      } else {
        Swal.fire('Mensaje de advertencia', 'El rol ingresado ya se encuentra en el sistema', 'warning');
      }

    } else {
      Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
    }
  });
}

function abrirModal() {
  if (!accesos.includes('20-1')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
}
  $("#modal_registro").modal('show');
}