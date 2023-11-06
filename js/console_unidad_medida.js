var accesos;
function setiarAccesos(acc) {
  accesos = acc;
}

var tablaUnidadMedida;
function listarUnidadMedida() {
  tablaUnidadMedida = $("#tablaUnidadMedida").DataTable({
    dom: 'lftiprB',
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
      "url": "../controlador/unidadmedida/controlador_unidadmedida.php?opcion=listar",
    },
    "columns": [
      { "defaultContent": "" },
      { "data": "unidad_nombre" },
      { "data": "unidad_abreviatura" },
      { "data": "unidad_fregistro" },
      {
        "data": "unidad_estatus",
        render: function (data, type, row) {
          if (data === "ACTIVO") {
            return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
          } else {
            return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
          }

        }

      },
      { "defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;</button>&nbsp;<button class='btn btn-warning' id='btnViewUnit'><i class='fas fa-eye'></i></button>" }

    ],
    "fnRowCallback": function (nRow) {
      $($(nRow).find("td")[5]).css('text-align', 'left');
      $($(nRow).find("td")[1]).css('text-align', 'center');
      $($(nRow).find("td")[2]).css('text-align', 'center');
    },
    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
    },
    select: true
  });
  tablaUnidadMedida.on('draw.dt', function () {
    var PageInfo = $('#tablaUnidadMedida').DataTable().page.info();
    tablaUnidadMedida.column(0, { page: 'current' }).nodes().each(function (cell, i) {
      cell.innerHTML = i + 1 + PageInfo.start;
    });
  });
}

$('#tablaUnidadMedida').on('click', '.editar', function () {
  if (!accesos.includes('8-2')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  var data = tablaUnidadMedida.row($(this).parents('tr')).data();

  if (tablaUnidadMedida.row(this).child.isShown()) {
    var data = tablaUnidadMedida.row(this).data();
  }
  $('.title__unit').html('EDITAR UNIDAD DE MEDIDA');
  $('#btnUpdateUnit').prop('disabled', false);
  loadData(data);
});

$('#tablaUnidadMedida').on('click', '#btnViewUnit', function () {
  if (!accesos.includes('8-3')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  var data = tablaUnidadMedida.row($(this).parents('tr')).data();

  if (tablaUnidadMedida.row(this).child.isShown()) {
    var data = tablaUnidadMedida.row(this).data();
  }
  $('.title__unit').html('VISTA UNIDAD DE MEDIDA');
  $('#btnUpdateUnit').prop('disabled', true);
  loadData(data);
});

function loadData(data) {
  let { unidad_id, unidad_nombre, unidad_abreviatura, unidad_estatus } = data;

  $("#modal_editar").modal('show');
  document.querySelector("#txtIdUnidad").value = unidad_id;
  document.querySelector("#txtUnidadActualEditar").value = unidad_nombre;
  document.querySelector("#txtUnidadNuevoEditar").value = unidad_nombre;
  document.querySelector("#txtAbreviaturaEditar").value = unidad_abreviatura;
  $("#cbm_estatus").val(unidad_estatus).trigger("change");
}

function registrarUnidadMedida() {
  var unidad = document.querySelector('#txtUnidad').value;
  var abreviatura = document.querySelector('#txtAbreviatura').value;

  if (unidad.length == 0 || txtAbreviatura.length == 0) {
    return Swal.fire('Mensaje de advertencia', 'Llene los campos vacios', 'warning');
  }

  $.ajax({
    url: '../controlador/unidadmedida/controlador_unidadmedida.php?opcion=registrar',
    type: 'POST',
    data: {
      unidad: unidad,
      abreviatura: abreviatura
    }
  }).done(function (resp) {
    if (resp > 0) {

      if (resp == 1) {
        tablaUnidadMedida.ajax.reload();
        $("#modal_registro").modal('hide');
        document.querySelector('#formularioRegistrarUnidadMedida').reset();

        Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
      } else {
        Swal.fire('Mensaje de advertencia', 'La unidad de medida ingresado ya se encuentra en el sistema', 'warning');
      }

    } else {
      Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
    }
  });
}

function editarUnidadMedida() {
  var id = document.querySelector('#txtIdUnidad').value;
  var unidadActual = document.querySelector('#txtUnidadActualEditar').value;
  var unidadNueva = document.querySelector('#txtUnidadNuevoEditar').value;
  var abreviatura = document.querySelector('#txtAbreviaturaEditar').value;
  var estatus = document.querySelector('#cbm_estatus').value;

  if (id.length === 0 || unidadActual.length === 0 || unidadNueva.length === 0 || abreviatura.length === 0 || estatus.length === 0) {
    Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios de llenar', 'warning');
    return;
  }

  $.ajax({
    url: '../controlador/unidadmedida/controlador_unidadmedida.php?opcion=editar',
    type: 'POST',
    data: {
      id: id,
      unidadActual: unidadActual,
      unidadNueva: unidadNueva,
      abreviatura: abreviatura,
      estatus: estatus
    }
  }).done(function (resp) {
    if (resp > 0) {

      if (resp == 3) {
        return Swal.fire('Mensaje de advertencia', 'La unidad de medida no se puede editar ya que esta en uso en el sistema.', 'warning');
      }

      if (resp == 1) {
        tablaUnidadMedida.ajax.reload();
        $("#modal_editar").modal('hide');
        Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
      } else {
        Swal.fire('Mensaje de advertencia', 'La unidad de medida ingresada ya se encuentra en el sistema', 'warning');
      }

    } else {
      Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
    }
  });
}

function abrirModal() {
  if (!accesos.includes('8-1')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  $("#modal_registro").modal('show');
}