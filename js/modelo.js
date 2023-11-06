var accesos;
function setiarAccesos(acc) {
  accesos = acc;
}

var tablaModelo;
function listarModelo() {
  tablaModelo = $("#tablaModelo").DataTable({
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
      "url": "../controlador/modelo/controlador_modelo.php?opcion=listar",
    },
    "columns": [
      { "defaultContent": "" },
      { "data": "modelo_nombre" },
      { "data": "marca_nombre" },
      { "data": "modelo_descripcion" },
      {
        "data": "modelo_estado",
        render: function (data) {
          if (data === "ACTIVO") {
            return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
          } else {
            return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
          }
        }
      },
      { "defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;<button class='btnViewModel btn btn-warning'><i class='fa fas fa-eye'></i></button>" }
    ],
    "fnRowCallback": function (nRow) {
      $($(nRow).find("td")[5]).css('text-align', 'left');
    },

    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
    },
    select: true
  });
  tablaModelo.on('draw.dt', function () {
    var PageInfo = $('#tablaModelo').DataTable().page.info();
    tablaModelo.column(0, { page: 'current' }).nodes().each(function (cell, i) {
      cell.innerHTML = i + 1 + PageInfo.start;
    });
  });
}

$('#tablaModelo').on('click', '.editar', function () {
  if (!accesos.includes('16-2')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  var data = tablaModelo.row($(this).parents('tr')).data();

  if (tablaModelo.row(this).child.isShown()) {
    var data = tablaModelo.row(this).data();
  }
  $('.title__model').html('EDITAR MODELO');
  $('#btnUpdateModel').prop('disabled', false);
  loadDataModel(data);
});

$('#tablaModelo').on('click', '.btnViewModel', function () {
  if (!accesos.includes('16-3')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  var data = tablaModelo.row($(this).parents('tr')).data();

  if (tablaModelo.row(this).child.isShown()) {
    var data = tablaModelo.row(this).data();
  }
  $('.title__model').html('MODELO SELECCIONADO');
  $('#btnUpdateModel').prop('disabled', true);
  loadDataModel(data);
});

function loadDataModel(data) {
  let { id_modelo, modelo_nombre, modelo_descripcion, modelo_estado, id_marca } = data;

  document.querySelector("#txtIdModelo").value = id_modelo;
  document.querySelector("#txtModeloActualEditar").value = modelo_nombre;
  document.querySelector("#txtModeloNuevoEditar").value = modelo_nombre;
  document.querySelector("#txtDescripcionEditar").value = modelo_descripcion;
  $("#cbmEstatus").val(modelo_estado).trigger("change");
  $("#cbmMarcaEditar").val(id_marca).trigger("change");
  $("#modal_editar").modal('show');
}

function registrarModelo() {
  let modelo = document.querySelector('#txtModelo').value;
  let idmarca = document.querySelector('#cbmMarca').value;
  let descripcion = document.querySelector('#txtDescripcion').value;
  let estado = 'ACTIVO';
  //   let estado = document.querySelector('#txtEstado').value;
  let usuario = document.querySelector('#txtUsuarioLog').value;

  // console.log(modelo + " " +idmarca + " " + descripcion + " " + estado +" " + usuario)


  if (modelo.length == 0) {
    return Swal.fire('Mensaje de advertencia', 'Llene el campo vacio', 'warning');
  }

  $.ajax({
    url: '../controlador/modelo/controlador_modelo.php?opcion=registrar',
    type: 'POST',
    data: {
      modelo: modelo,
      idmarca: idmarca,
      descripcion: descripcion,
      estado: estado,
      usuario: usuario,
    }
  }).done(function (resp) {
    if (resp > 0) {

      if (resp == 1) {
        tablaModelo.ajax.reload();
        $("#modal_registro").modal('hide');
        document.querySelector('#frmRegistrarMarca').reset(); //Limpiamos todos los inputs

        Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
      } else {
        Swal.fire('Mensaje de advertencia', 'El  modelo ingresado ya se encuentra en el sistema', 'warning');
      }

    } else {
      Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
    }
  });
}

function editarModelo() {
  var idmodelo = document.querySelector('#txtIdModelo').value;
  var modeloActual = document.querySelector('#txtModeloActualEditar').value;
  var modeloNuevo = document.querySelector('#txtModeloNuevoEditar').value;
  var descripcion = document.querySelector('#txtDescripcionEditar').value;
  var estatus = document.querySelector('#cbmEstatus').value;
  let idmarca = document.querySelector('#cbmMarcaEditar').value;

  let usuario = document.querySelector('#txtUsuarioLog').value;

  if (idmodelo.length == 0 || modeloActual.length == 0 || modeloNuevo.length == 0 || estatus.length == 0) {
    return Swal.fire('Mensaje de advertencia', 'Llene los campos vacios', 'warning');
  }

  $.ajax({
    url: '../controlador/modelo/controlador_modelo.php?opcion=editar',
    type: 'POST',
    data: {
      idmodelo: idmodelo,
      modeloActual: modeloActual,
      modeloNuevo: modeloNuevo,
      descripcion: descripcion,
      estatus: estatus,
      idmarca: idmarca,
      usuario: usuario,
    }
  }).done(function (resp) {

    // console.log(resp)
    if (resp > 0) {

        if(resp == 3){

            return Swal.fire('Mensaje de advertencia', 'El modelo no se puede editar ya que esta en uso en el sistema', 'warning');
        }

      if (resp == 1) {
        tablaModelo.ajax.reload();
        $("#modal_editar").modal('hide');
        Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
      } else {
        Swal.fire('Mensaje de advertencia', 'El modelo ingresado ya se encuentra en el sistema', 'warning');
      }
    } else {
      Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
    }
  });
}


function listarMarcaCombo() {

  $.ajax({
    url: "../controlador/marca/controlador_marca.php?opcion=listarComboMarca",
    type: "POST"
  }).done(function (resp) {

    // console.log(resp);
    let data = JSON.parse(resp);


    let cadena = "";
    if (data.length > 0) {
      for (let i = 0; i < data.length; i++) {
        cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";

        // alert(data)
      }
      document.querySelector('#cbmMarca').innerHTML = cadena;
      document.querySelector('#cbmMarcaEditar').innerHTML = cadena;
    } else {
      document.querySelector('#cbmMarca').innerHTML = "No se encontraron datos";
      document.querySelector('#cbmMarcaEditar').innerHTML = "No se encontraron datos";
    }
  });
}

function abrirModal() {
  if (!accesos.includes('16-1')) {
    return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
  }
  $("#modal_registro").modal('show');
}