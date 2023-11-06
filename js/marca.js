var accesos;
function setiarAccesos(acc) {
  accesos = acc;
}

var tablaMarca;
function listarMarca() {
  tablaMarca = $("#tablaMarca").DataTable({
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
      "url": "../controlador/marca/controlador_marca.php?opcion=listar",
    },
    "columns": [
      { "defaultContent": "" },
      { "data": "marca_nombre" },
      { "data": "marca_descripcion" },
      {
        "data": "marca_estado",
        render: function (data) {
          if (data === "ACTIVO") {
            return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
          } else {
            return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
          }
        }
      },
      { "defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;<button class='btnViewMark btn btn-warning'><i class='fa fas fa-eye'></i></button>" }

    ],
    "fnRowCallback": function (nRow) {
      $($(nRow).find("td")[5]).css('text-align', 'left');
    },

    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
    },
    select: true
  });
  tablaMarca.on('draw.dt', function () {
    var PageInfo = $('#tablaMarca').DataTable().page.info();
    tablaMarca.column(0, { page: 'current' }).nodes().each(function (cell, i) {
      cell.innerHTML = i + 1 + PageInfo.start;
    });
  });
}


$('#tablaMarca').on('click', '.editar', function () {
  if (!accesos.includes('15-2')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  var data = tablaMarca.row($(this).parents('tr')).data();

  if (tablaMarca.row(this).child.isShown()) {
    var data = tablaMarca.row(this).data();
  }
  
  $('.title__mark').html('EDITAR MARCA');
  $('#btnUpdateMark').prop('disabled', false);
  loadDataMark(data);
});

$('#tablaMarca').on('click', '.btnViewMark', function () {
  if (!accesos.includes('15-3')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  var data = tablaMarca.row($(this).parents('tr')).data();

  if (tablaMarca.row(this).child.isShown()) {
    var data = tablaMarca.row(this).data();
  }
  
  $('#btnUpdateMark').prop('disabled', true);
  $('.title__mark').html('MARCA SELECCIONADA');
  loadDataMark(data);
});


function loadDataMark(data) {
  let { id_marca, marca_nombre, marca_descripcion, marca_estado } = data;

  document.querySelector("#txtIdMarca").value = id_marca;
  document.querySelector("#txtMarcaActualEditar").value = marca_nombre;
  document.querySelector("#txtMarcaNuevoEditar").value = marca_nombre;
  document.querySelector("#txtDescripcionEditar").value = marca_descripcion;
  $("#cbmEstatus").val(marca_estado).trigger("change");
  $("#modal_editar").modal('show');
}

function registrarMarca() {
  let marca = document.querySelector('#txtMarca').value;
  let descripcion = document.querySelector('#txtDescripcion').value;
  let estado = 'ACTIVO';
  //   let estado = document.querySelector('#txtEstado').value;
  let usuario = document.querySelector('#txtUsuarioLog').value;

  //   alert(marca+" "+descripcion + " "+ estado +" "+ usuario);


  if (marca.length == 0) {
    return Swal.fire('Mensaje de advertencia', 'Llene el campo vacio', 'warning');
  }

  $.ajax({
    url: '../controlador/marca/controlador_marca.php?opcion=registrar',
    type: 'POST',
    data: {
      marca: marca,
      descripcion: descripcion,
      estado: estado,
      usuario: usuario,
    }
  }).done(function (resp) {
    if (resp > 0) {

      if (resp == 1) {
        tablaMarca.ajax.reload();
        $("#modal_registro").modal('hide');
        document.querySelector('#frmRegistrarMarca').reset(); //Limpiamos todos los inputs

        Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
      } else {
        Swal.fire('Mensaje de advertencia', 'La marca ingresada ya se encuentra en el sistema', 'warning');
      }

    } else {
      Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
    }
  });
}

function editarMarca() {
  var id = document.querySelector('#txtIdMarca').value;
  var marcaActual = document.querySelector('#txtMarcaActualEditar').value;
  var marcaNuevo = document.querySelector('#txtMarcaNuevoEditar').value;
  var descripcion = document.querySelector('#txtDescripcionEditar').value;
  var estatus = document.querySelector('#cbmEstatus').value;

  let usuario = document.querySelector('#txtUsuarioLog').value;

  // alert(usuario);

  if (id.length == 0 || marcaActual.length == 0 || marcaNuevo.length == 0 || estatus.length == 0) {
    return Swal.fire('Mensaje de advertencia', 'Llene los campos vacios', 'warning');
  }

  $.ajax({
    url: '../controlador/marca/controlador_marca.php?opcion=editar',
    type: 'POST',
    data: {
      id: id,
      marcaActual: marcaActual,
      marcaNuevo: marcaNuevo,
      descripcion: descripcion,
      estatus: estatus,
      usuario: usuario,
    }
  }).done(function (resp) {
    if (resp > 0) {

      if (resp == 1) {
        tablaMarca.ajax.reload();
        $("#modal_editar").modal('hide');
        Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
      } else if(resp == 2) {
        Swal.fire('Mensaje de advertencia', 'La marca ingresada ya se encuentra en el sistema', 'warning');
      } else {
        Swal.fire('Mensaje de advertencia', 'La marca no se puede desactivar porque esta siendo utilizada en modelo.', 'warning');
      }
    } else {
      Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
    }
  });
}

function abrirModal() {
  if (!accesos.includes('15-1')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  $("#modal_registro").modal('show');
}