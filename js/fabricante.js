var accesos;
function setiarAccesos(acc) {
  accesos = acc;
}

var tablaFabricante;
function listarFabricante() {
  tablaFabricante = $("#tablaFabricante").DataTable({
    dom: 'lftiprB', // indica la posicion de los botones
    buttons: [
      'copy', 'csv', 'excel', 'pdf', 'print'
    ],
    "paging": true,
    "ordering": true,
    "pageLength": 10,
    "destroy": true,
    "async": false,
    "responsive": true,
    "autoWidth": false,

    "ajax": {
      "method": "POST",
      "url": "../controlador/fabricante/controlador_fabricante.php?opcion=listar",
    },
    "columns": [
      { "defaultContent": "" },
      { "data": "fabricante_nombre" },
      { "data": "fabricante_fregistro" },
      { "data": "fabricante_descripcion" },
      {
        "data": "fabricante_estado",
        render: function (data) {
          if (data === "ACTIVO") {
            return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
          } else {
            return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
          }
        }
      },
      { "defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;</button>&nbsp;<button class='btn btn-warning' id='btnViewMaker'><i class='fas fa-eye'></i></button>" }

    ],
    "fnRowCallback": function (nRow) {
      $($(nRow).find("td")[5]).css('text-align', 'left');
    },

    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
    },
    select: true
  });
  tablaFabricante.on('draw.dt', function () {
    var PageInfo = $('#tablaFabricante').DataTable().page.info();
    tablaFabricante.column(0, { page: 'current' }).nodes().each(function (cell, i) {
      cell.innerHTML = i + 1 + PageInfo.start;
    });
  });
}

$('#tablaFabricante').on('click', '.editar', function () {
  if (!accesos.includes('7-2')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  var data = tablaFabricante.row($(this).parents('tr')).data();

  if (tablaFabricante.row(this).child.isShown()) {
    var data = tablaFabricante.row(this).data();
  }
  loadData(data);
  $('#btnUpdateMaker').prop('disabled', false);
  $('.title_maker').html('EDITAR FABRICANTE');
});

$('#tablaFabricante').on('click', '#btnViewMaker', function () {
  if (!accesos.includes('7-3')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  var data = tablaFabricante.row($(this).parents('tr')).data();

  if (tablaFabricante.row(this).child.isShown()) {
    var data = tablaFabricante.row(this).data();
  }
  loadData(data);
  $('#btnUpdateMaker').prop('disabled', true);
  $('.title_maker').html('VISTA FABRICANTE');
});

function loadData(data) {
  let { id_fabricante, fabricante_nombre, fabricante_descripcion, fabricante_estado } = data;
  $("#modal_editar").modal('show');
  document.querySelector("#txtIdFabricante").value = id_fabricante;
  document.querySelector("#txtFabricanteActualEditar").value = fabricante_nombre;
  document.querySelector("#txtFabricanteNuevoEditar").value = fabricante_nombre;
  document.querySelector("#txtDescripcionEditar").value = fabricante_descripcion;
  $("#cbmEstatus").val(fabricante_estado).trigger("change");
}

function registrarFabricante() {
  var fabricante = document.querySelector('#txtFabricante').value;
  var descripcion = document.querySelector('#txtDescripcion').value;

  if (fabricante.length == 0) {
    return Swal.fire('Mensaje de advertencia', 'Llene el campo vacio', 'warning');
  }

  $.ajax({
    url: '../controlador/fabricante/controlador_fabricante.php?opcion=registrar',
    type: 'POST',
    data: {
      fabricante: fabricante,
      descripcion: descripcion
    }
  }).done(function (resp) {
    if (resp > 0) {

      if (resp == 1) {
        tablaFabricante.ajax.reload();
        $("#modal_registro").modal('hide');
        document.querySelector('#frmRegistrarFabricante').reset(); //Limpiamos todos los inputs

        Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
      } else {
        Swal.fire('Mensaje de advertencia', 'El fabricante ingresado ya se encuentra en el sistema', 'warning');
      }

    } else {
      Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
    }
  });
}

function editarFabricante() {
  var id = document.querySelector('#txtIdFabricante').value;
  var fabricanteActual = document.querySelector('#txtFabricanteActualEditar').value;
  var fabricanteNuevo = document.querySelector('#txtFabricanteNuevoEditar').value;
  var descripcion = document.querySelector('#txtDescripcionEditar').value;
  var estatus = document.querySelector('#cbmEstatus').value;

  if (id.length == 0 || fabricanteActual.length == 0 || fabricanteNuevo.length == 0 || estatus.length == 0) {
    Swal.fire('Mensaje de advertencia', 'Llene los campos vacios', 'warning');
  }

  $.ajax({
    url: '../controlador/fabricante/controlador_fabricante.php?opcion=editar',
    type: 'POST',
    data: {
      id: id,
      fabricanteActual: fabricanteActual,
      fabricanteNuevo: fabricanteNuevo,
      descripcion: descripcion,
      estatus: estatus
    }
  }).done(function (resp) {
    if (resp > 0) {

      if (resp == 1) {
        tablaFabricante.ajax.reload();
        $("#modal_editar").modal('hide');
        Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
      } else if(resp == 2) {
        Swal.fire('Mensaje de advertencia', 'El fabricante ingresado ya se encuentra en el sistema', 'warning');
      } else {
        Swal.fire('Mensaje de advertencia', 'El fabricante esta siendo utilizado en uno o mas registros del modulo de producto.', 'warning');
      }
    } else {
      Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
    }
  });
}

function abrirModal() {
  if (!accesos.includes('7-1')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  $("#modal_registro").modal('show');
}