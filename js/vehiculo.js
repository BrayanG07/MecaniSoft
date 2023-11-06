var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}

var tablaVehiculo;
function listarVehiculo() {
    tablaVehiculo = $("#tablaVehiculo").DataTable({
        dom: 'lftiprB', //Importante para Imprimir los botones
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
            "url": "../controlador/vehiculo/controlador_vehiculo.php?opcion=listar",
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "vehiculo_placa" },
            { "data": "marca_nombre" },
            { "data": "modelo_nombre" },
            { "data": "vehiculo_anio" },
            { "data": "vehiculo_tipo" },
            { "data": "cliente_nombre" },
            {
                "data": "vehiculo_imagen",
                render: function (data) {
                    return `<img src="../${data}" width="40px" class="img-circle m-r-10">`;
                }
            },

            {
                "data": "vehiculo_estado",
                render: function (data) {
                    if (data === "ACTIVO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },
            {
                "defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;<button class='btnViewCar btn btn-warning'><i class='fa fas fa-eye'></i></button>" +
                    "&nbsp;"
                // "&nbsp;<button class='oferta btn btn-primary'><i class='fas fa-bell'></i></button>"
            }
        ],

        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaVehiculo.on('draw.dt', function () {
        var PageInfo = $('#tablaVehiculo').DataTable().page.info();
        tablaVehiculo.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

//COIGO PARA OBTENER LOS DATOS DE LA TABLA Y PONERLOS EN LOS INPUTS
$('#tablaVehiculo').on('click', '.editar', function () {

    if (accesos.includes('3-2')) {

    } else {
        Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
        return;
    }
    var data = tablaVehiculo.row($(this).parents('tr')).data(); //Detecta a que fila hago click y me captura los datos en la variable data

    if (tablaVehiculo.row(this).child.isShown()) { //Cuando esta en tamaño responsivo
        var data = tablaVehiculo.row(this).data();
    }

    loadDataCar(data);

    //   alert(document.querySelector("#cbmModeloEditar").value);
    //  $("#cbmModeloEditar").val(2).trigger("change"); 
    // document.getElementById("cbmModeloEditar").value = "2";
    //   alert(document.querySelector("#cbmModeloEditar").value);
    // $("#cbmEstatus").val(data.producto_estatus).trigger("change"); 
    $('.title__car').html('VEHICULO SELECCIONADO');
    $('#btnUpdateImage').prop('disabled', false);
    $('#btnModalCar').prop('disabled', false);
    $('#btnUpdateCar').prop('disabled', false);
    $('#cont__img').css('display', 'none');
    loadDataCar(data);
});

$('#tablaVehiculo').on('click', '.btnViewCar', function () {

    if (accesos.includes('3-3')) {

    } else {
        Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
        return;
    }

    var data = tablaVehiculo.row($(this).parents('tr')).data();

    if (tablaVehiculo.row(this).child.isShown()) {
        var data = tablaVehiculo.row(this).data();
    }

    $('.title__car').html('VEHICULO SELECCIONADO');
    $('#btnUpdateImage').prop('disabled', true);
    $('#btnModalCar').prop('disabled', true);
    $('#btnUpdateCar').prop('disabled', true);
    $('#cont__img').css('display', 'block');
    loadDataCar(data);
});

function loadDataCar(data) {
    let { id_vehiculo, vehiculo_placa, vehiculo_anio, vehiculo_num_chasis, vehiculo_num_motor, cliente_nombre, id_cliente, vehiculo_observaciones, id_marca, id_modelo, vehiculo_tipo_combustible, vehiculo_transmision, vehiculo_tipo, vehiculo_estado, vehiculo_imagen } = data;
    document.querySelector("#txtIdVehiculo").value = id_vehiculo;
    document.querySelector("#txtPlacaEditarNuevo").value = vehiculo_placa;
    document.querySelector("#txtPlacaEditarActual").value = vehiculo_placa;
    document.querySelector("#txtAnioEditar").value = vehiculo_anio;
    document.querySelector("#txtChasisEditar").value = vehiculo_num_chasis;
    document.querySelector("#txtMotorEditar").value = vehiculo_num_motor
    document.querySelector("#txtClienteNombreEditar").value = cliente_nombre;
    document.querySelector("#txtClienteIdEditar").value = id_cliente;
    document.querySelector("#txtDescripcionEditar").value = vehiculo_observaciones;

    $("#cbmMarcaEditar").val(id_marca);
    $("#idModel").val(id_modelo);
    listarModeloComboEditar();

    $("#cbmCombustibleEditar").val(vehiculo_tipo_combustible).trigger("change");
    $("#cbmTransmisionEditar").val(vehiculo_transmision).trigger("change");
    $("#cbmTipoEditar").val(vehiculo_tipo).trigger("change");
    $("#cbmEstadoEditar").val(vehiculo_estado).trigger("change");
    $('.img__product').attr('src', '../' + vehiculo_imagen);
    $("#modal_editar").modal('show');
}

function selectComboModelEdit() {
    //  alert(document.querySelector("#idModel").value)
    $("#cbmModeloEditar").val(document.querySelector("#idModel").value).trigger("change");
}


function registrarVehiculo() {

    let placa = document.querySelector("#txtPlaca").value;
    let combustible = document.querySelector("#cbmCombustible").value;
    let transmicion = document.querySelector("#cbmTransmision").value;
    let marca = document.querySelector("#cbmMarca").value;
    let modelo = document.querySelector("#cbmModelo").value;
    let anio = document.querySelector("#txtAnio").value;
    let nchasis = document.querySelector("#txtChasis").value;
    let nmotor = document.querySelector("#txtMotor").value;
    let archivo = document.querySelector("#txtImagen").value;
    let tipo = document.querySelector("#cbmTipo").value;
    let cliente = document.querySelector("#txtClienteId").value;
    let descripcion = document.querySelector("#txtDescripcion").value;

    // console.log(
    //     placa +" "+
    //     combustible +" "+
    //     transmicion +" "+
    //     marca  +" "+
    //     modelo  +" "+
    //     anio  +" "+
    //     nchasis  +" "+
    //     nmotor  +" "+
    //     imagen  +" "+
    //     tipo  +" "+
    //     cliente  +" "+
    //     descripcion  +" "

    //     );

    let f = new Date();
    let extension = archivo.split('.').pop();

    //Para que ninguna imagen se repita
    let nombreArchivo = "VHL" + f.getDate() + "" + (f.getMonth() + 1) + "" + f.getFullYear() + "" + f.getHours() + "" + f.getMinutes() + "" + f.getSeconds() + "." + extension;

    let formData = new FormData();
    let foto = $("#txtImagen")[0].files[0];


    if (placa.length == 0 || combustible.length == 0 || transmicion.length == 0 || marca.length == 0 || modelo.length == 0 || anio.length == 0 || nchasis.length == 0 || nmotor.length == 0 || tipo.length == 0 || cliente.length == 0 || descripcion.length == 0) {

        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios, favor de llenarlos', 'warning');
    }

    formData.append('placa', placa);
    formData.append('combustible', combustible);
    formData.append('transmicion', transmicion);
    formData.append('marca', marca);
    formData.append('modelo', modelo);
    formData.append('foto', foto);
    formData.append('nombreArchivo', nombreArchivo);
    formData.append('anio', anio);
    formData.append('nchasis', nchasis);
    formData.append('nmotor', nmotor);
    formData.append('tipo', tipo);
    formData.append('cliente', cliente);
    formData.append('descripcion', descripcion);



    $.ajax({
        url: '../controlador/vehiculo/controlador_vehiculo.php?opcion=registrar',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            // alert(respuesta)

            if (respuesta != 0) {
                if (respuesta == 1) {
                    tablaVehiculo.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
                    $("#modal_registro").modal('hide'); //Desaparecer la ventana modal
                    document.querySelector('#formularioRegistrarVehiculo').reset(); //Limpiamos todos los inputs

                    Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
                } else if (respuesta == 2) {
                    Swal.fire('Mensaje de advertencia', 'La placa ya pertenece a un vehiculo', 'warning');
                } else {
                    // Swal.fire('Mensaje de advertencia', 'El producto ya se encuentra ingresado en la base de datos', 'warning');
                    Swal.fire('Mensaje de advertencia', respuesta, 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
    return false;
}

function editarVehiculo() {

    let idVehiculo = document.querySelector("#txtIdVehiculo").value;
    let placaNueva = document.querySelector("#txtPlacaEditarNuevo").value;
    let placaActual = document.querySelector("#txtPlacaEditarActual").value;
    let combustible = document.querySelector("#cbmCombustibleEditar").value;
    let transmicion = document.querySelector("#cbmTransmisionEditar").value;
    let marca = document.querySelector("#cbmMarcaEditar").value;
    let modelo = document.querySelector("#cbmModeloEditar").value;
    let anio = document.querySelector("#txtAnioEditar").value;
    let nchasis = document.querySelector("#txtChasisEditar").value;
    let nmotor = document.querySelector("#txtMotorEditar").value;
    let tipo = document.querySelector("#cbmTipoEditar").value;
    let cliente = document.querySelector("#txtClienteIdEditar").value;
    let descripcion = document.querySelector("#txtDescripcionEditar").value;
    let estado = document.querySelector("#cbmEstadoEditar").value;

    if (placaNueva.length == 0 || combustible.length == 0 || transmicion.length == 0 || marca.length == 0 || modelo.length == 0 || anio.length == 0 || nchasis.length == 0 || nmotor.length == 0 || tipo.length == 0 || cliente.length == 0 || descripcion.length == 0 || estado.length == 0) {

        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios, favor de llenarlos', 'warning');
    }


    $.ajax({
        url: '../controlador/vehiculo/controlador_vehiculo.php?opcion=editar',
        type: 'POST',
        data: {
            idVehiculo: idVehiculo,
            placaNueva: placaNueva,
            placaActual: placaActual,
            combustible: combustible,
            transmicion: transmicion,
            marca: marca,
            modelo: modelo,
            anio: anio,
            nchasis: nchasis,
            nmotor: nmotor,
            tipo: tipo,
            cliente: cliente,
            estado: estado,
            descripcion: descripcion,

        }
    }).done(function (resp) {
        if (isNaN(resp)) {
            document.querySelector('#divErrorEditar').style.display = "block";
            document.querySelector('#divErrorEditar').innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + resp;
        } else {
            if (resp > 0) {
                document.querySelector('#divErrorEditar').style.display = "none";
                if (resp == 1) {
                    tablaVehiculo.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
                    $("#modal_editar").modal('hide'); //Desaparecer la ventana modal
                    document.querySelector('#formularioEditarVehiculo').reset();
                    Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
                } else {
                    Swal.fire('Mensaje de advertencia', 'La placa del vehiculo ya se encuentra registrada en otro', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
            }
        }
    });
}

function editarFotoVehiculo() {
    let idVehiculo = document.querySelector("#txtIdVehiculo").value;
    let archivo = document.querySelector("#txtImagenEditar").value;

    // console.log(idVehiculo);
    // console.log(archivo);

    let f = new Date();
    let extension = archivo.split('.').pop();

    //Para que ninguna imagen se repita
    let nombreArchivo = "VHL" + f.getDate() + "" + (f.getMonth() + 1) + "" + f.getFullYear() + "" + f.getHours() + "" + f.getMinutes() + "" + f.getSeconds() + "." + extension;
    let formData = new FormData();
    let foto = $("#txtImagenEditar")[0].files[0];

    if (archivo.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Debes seleccionar una imagen', 'warning');
    }

    formData.append('id', idVehiculo);;
    formData.append('foto', foto);
    formData.append('nombreArchivo', nombreArchivo);
    $.ajax({
        url: '../controlador/vehiculo/controlador_vehiculo.php?opcion=editarFoto',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            if (respuesta != 0) {
                if (respuesta == 1) {
                    tablaVehiculo.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
                    $("#modal_editar").modal('hide'); //Desaparecer la ventana modal

                    Swal.fire('Mensaje de confirmacion', 'Foto actualizada correctamente', 'success');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
    return false;
}

function abrirModal() {
    // $("#modal_registro").modal({ backdrop: 'static', keyboard: false }); //Para que no se cierre el modal
    // $("#modal_registro").modal('show');
    // limpiarModal("registrar");

    if (accesos.includes('3-1')) {

    } else {
        Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
        return;
    }

    $("#modal_registro").modal('show');
    limpiarModal("registrar");
}

function abrirModalSelecCliente() {
    $("#modal_cliente").modal('show');
}

function mensajeError(producto, codigo, idCategoria, idUnidadMedida, precio, precioCompra, idFabricante, stockMinimo, estatus, div) {
    let cadena = "";
    if (producto.length === 0) {
        cadena += "El campo producto no debe estar vacio. <br>";
    }
    if (codigo.length === 0) {
        cadena += "El campo codigo no debe estar vacio. <br>";
    }
    if (idCategoria.length === 0) {
        cadena += "Seleccione una opcion de id categoria. <br>";
    }
    if (idUnidadMedida.length === 0) {
        cadena += "Seleccione una opcion de unidad de medida. <br>";
    }
    if (precio.length === 0) {
        cadena += "El campo precio venta no debe estar vacio. <br>";
    }
    if (precioCompra.length === 0) {
        cadena += "El campo precio compra no debe estar vacio. <br>";
    }
    if (idFabricante.length === 0) {
        cadena += "El campo fabricante no debe estar vacio. <br>";
    }
    if (stockMinimo.length === 0) {
        cadena += "El campo stock minimo no debe estar vacio. <br>";
    }

    if (div == 'divErrorEditar') {
        if (estatus.length === 0) {
            cadena += "Seleccione una opcion de estatus. <br>";
        }
    }

    document.querySelector("#" + div).style.display = "block";
    document.querySelector("#" + div).innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + cadena;
}

function limpiarModal(tipoModal) {
    if (tipoModal == "registrar") {
        const divError = document.querySelector('#divError');
        document.querySelector('#formularioRegistrarVehiculo').reset();

        while (divError.firstChild) {
            divError.removeChild(divError.firstChild);
        }
        divError.style.display = "none";
    } else {
        const divErrorE = document.querySelector('#divErrorEditar');
        document.querySelector('#formularioEditarVehiculo').reset();

        while (divErrorE.firstChild) {
            divErrorE.removeChild(divErrorE.firstChild);
        }
        divErrorE.style.display = "none";
    }
}


function listarMarcaCombo() {

    $.ajax({
        url: "../controlador/marca/controlador_marca.php?opcion=listarComboMarca",
        type: "POST"
    }).done(function (resp) {

        // console.log(resp);
        let data = JSON.parse(resp);


        let cadena = "<option value=''>-- SELECCIONE --</option>";
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


function listarModeloCombo() {
    let idMarca = document.querySelector("#cbmMarca").value;
    $.ajax({
        url: "../controlador/modelo/controlador_modelo.php?opcion=listarComboModeloMarca",
        type: "POST",
        data: {
            idmarca: idMarca
        }
    }).done(function (resp) {

        // console.log(resp);
        let data = JSON.parse(resp);

        let cadena = "<option value=''>-- SELECCIONE --</option>";
        if (data.length > 0) {
            for (let i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";

                // alert(data)
            }
            document.querySelector('#cbmModelo').innerHTML = cadena;
            //  document.querySelector('#cbmModeloEditar').innerHTML = cadena;


        } else {
            document.querySelector('#cbmModelo').innerHTML = "<option value=''>-- No se encontraron datos --</option>";
            //  document.querySelector('#cbmModeloEditar').innerHTML = "No se encontraron datos";
        }
    });
}


function listarModeloComboEditar() {
    let idMarca = document.querySelector("#cbmMarcaEditar").value;


    $.ajax({
        url: "../controlador/modelo/controlador_modelo.php?opcion=listarComboModeloMarca",
        type: "POST",
        data: {
            idmarca: idMarca
        }
    }).done(function (resp) {

        // console.log(resp);
        let data = JSON.parse(resp);

        let cadena = "<option value=''>-- SELECCIONE --</option>";
        if (data.length > 0) {
            for (let i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";

                // alert(data)
            }
            //  document.querySelector('#cbmModelo').innerHTML = cadena;
            document.querySelector('#cbmModeloEditar').innerHTML = cadena;
            selectComboModelEdit()

        } else {
            //  document.querySelector('#cbmModelo').innerHTML = "<option value=''>-- No se encontraron datos --</option>";
            document.querySelector('#cbmModeloEditar').innerHTML = "<option value=''>-- No se encontraron datos --</option>";
        }
    });
}

var tablaCliente;
function listarClienteModal() {
    tablaCliente = $("#tablaCliente").DataTable({
        dom: 'lftiprB', //Importante para Imprimir los botones
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
            "url": "../controlador/cliente/controlador_cliente.php?opcion=listar",
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "NOMBRE_PERSONA" }, //NOMBRE_PERSONA = alias que le pusimos a la funcion CONCAT_WS EN EL SP
            { "data": "persona_nrodocumento" },
            { "data": "persona_tipodocumento" },
            {
                "data": "persona_sexo",
                render: function (data, type, row) {
                    if (data === "MASCULINO") {
                        return "<i class='fa fa-male' style=' font-size: 23px;'></i>"
                    } else {
                        return "<i class='fa fa-female' style=' font-size: 23px;'></i>";
                    }
                }
            },
            { "data": "persona_telefono" },
            {
                "data": "cliente_estatus",
                render: function (data, type, row) {
                    if (data === "ACTIVO") {
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='badge badge-danger badge-pill m-r-5 m-b-5'>" + data + "</span>";
                    }

                }

            },
            {
                "data": "cliente_estatus",
                render: function (data, type, row) {
                    if (data === "ACTIVO") {
                        return "<button class='btn btn-secondary' id='btnAgregarCliente'><i class='fa fa-plus'></i></button>";
                    } else {
                        return "<button class='btn btn-secondary' id='btnAgregarCliente'><i class='fa fa-plus'></i></button>";
                    }

                }

            }
        ],

        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[5]).css('text-align', 'left');
            $($(nRow).find("td")[4]).css('text-align', 'center');
            $($(nRow).find("td")[3]).css('text-align', 'center');

        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaCliente.on('draw.dt', function () {
        var PageInfo = $('#tablaCliente').DataTable().page.info();
        tablaCliente.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

$('#tablaCliente').on('click', '#btnAgregarCliente', function () {
    var data = tablaCliente.row($(this).parents('tr')).data();

    if (tablaCliente.row(this).child.isShown()) {
        var data = tablaCliente.row(this).data();
    }

    if (data.cliente_estatus == "INACTIVO") {
        return Swal.fire('Mensaje de advertencia', 'Debe seleccionar un cliente que este activo', 'warning');
    }

    document.querySelector("#txtClienteNombre").value = data.NOMBRE_PERSONA;
    document.querySelector("#txtClienteId").value = data.cliente_id;

    if (document.querySelector("#txtClienteIdEditar").value.length > 0) {

        document.querySelector("#txtClienteNombreEditar").value = data.NOMBRE_PERSONA;
        document.querySelector("#txtClienteIdEditar").value = data.cliente_id
    }
    $("#modal_cliente").modal('hide');
});
