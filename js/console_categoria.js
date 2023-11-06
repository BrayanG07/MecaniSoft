var accesos;
function setiarAccesos(acc) {
  accesos = acc;
}

var tablaCategoria;
function listarCategoria() {
  tablaCategoria = $("#tablaCategoria").DataTable({
    dom: 'lftiprB', //Importante para Imprimir los botones, indica la posicion de los botones
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
      "url": "../controlador/categoria/controlador_categoria.php?opcion=listar",
    },
    "columns": [
      { "defaultContent": "" },
      { "data": "categoria_nombre" },
      { "data": "categoria_fregistro" },
      {
        "data": "categoria_estatus",
        render: function (data, type, row) {
          if (data === "ACTIVO") {
            return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
          } else {
            return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
          }
        }
      },
      { "defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;</button>&nbsp;<button class='btn btn-warning' id='btnViewCategory'><i class='fas fa-eye'></i></button>" }

    ],
    "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
      $($(nRow).find("td")[5]).css('text-align', 'left');
    },

    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
    },
    select: true
  });
  tablaCategoria.on('draw.dt', function () {
    var PageInfo = $('#tablaCategoria').DataTable().page.info();
    tablaCategoria.column(0, { page: 'current' }).nodes().each(function (cell, i) {
      cell.innerHTML = i + 1 + PageInfo.start;
    });
  });
}

$('#tablaCategoria').on('click', '.editar', function () {
  if (!accesos.includes('6-2')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  var data = tablaCategoria.row($(this).parents('tr')).data();
  if (tablaCategoria.row(this).child.isShown()) {
    var data = tablaCategoria.row(this).data();
  }
  $(".title__modal").html("EDITAR CATEGORIA");
  $('#btnUpdateCategory').prop('disabled', false);
  loadData(data);
});

$("#tablaCategoria").on('click', '#btnViewCategory', function () {
  if (!accesos.includes('6-3')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  var data = tablaCategoria.row($(this).parents('tr')).data();
  if (tablaCategoria.row(this).child.isShown()) {
    var data = tablaCategoria.row(this).data();
  }

  $(".title__modal").html("VISTA CATEGORIA");
  $('#btnUpdateCategory').prop('disabled', true);
  loadData(data);
});

function loadData(data) {
  let { categoria_id, categoria_nombre, categoria_estatus } = data;

  document.querySelector("#txtIdCategoria").value = categoria_id;
  document.querySelector("#txtCategoriaActualEditar").value = categoria_nombre;
  document.querySelector("#txtCategoriaNuevoEditar").value = categoria_nombre;
  $("#cbm_estatus").val(categoria_estatus).trigger("change");

  $("#modal_editar").modal('show');
}

function registrarCategoria() {
  var categoria = document.querySelector('#txtCategoria').value;

  if (categoria.length == 0) {
    return Swal.fire('Mensaje de advertencia', 'Llene el campo vacio', 'warning');
  }

  $.ajax({
    url: '../controlador/categoria/controlador_categoria.php?opcion=registrar',
    type: 'POST',
    data: {
      categoria: categoria
    }
  }).done(function (resp) {
    if (resp > 0) {

      if (resp == 1) {
        tablaCategoria.ajax.reload();
        $("#modal_registro").modal('hide');
        document.querySelector('#formularioRegistrarCategoria').reset();

        Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
      } else {
        Swal.fire('Mensaje de advertencia', 'La categoria ingresado ya se encuentra en la base de datos', 'warning');
      }

    } else {
      Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
    }
  });
}

function editarCategoria() {
  var id = document.querySelector('#txtIdCategoria').value;
  var categoriaActual = document.querySelector('#txtCategoriaActualEditar').value;
  var categoriaNueva = document.querySelector('#txtCategoriaNuevoEditar').value;
  var estatus = document.querySelector('#cbm_estatus').value;

  if (id.length == 0 || categoriaActual.length == 0 || categoriaNueva.length == 0 || estatus.length == 0) {
   return Swal.fire('Mensaje de advertencia', 'Llene los campos vacios', 'warning');
  }

  $.ajax({
    url: '../controlador/categoria/controlador_categoria.php?opcion=editar',
    type: 'POST',
    data: {
      id: id,
      categoriaActual: categoriaActual,
      categoriaNueva: categoriaNueva,
      estatus: estatus
    }
  }).done(function (resp) {
    if (resp > 0) {

      if (resp == 1) {
        tablaCategoria.ajax.reload();
        $("#modal_editar").modal('hide');
        Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
      } else if(resp == 2) {
        Swal.fire('Mensaje de advertencia', 'La categoria ingresada ya se encuentra en el sistema', 'warning');
      } else {
        Swal.fire('Mensaje de advertencia', 'La categoria esta siendo utilizada en productos por lo tanto no puede desactivarse.', 'warning');
      }

    } else {
      Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
    }
  });
}

function abrirModal() {
  if (!accesos.includes('6-1')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  $("#modal_registro").modal('show');
}