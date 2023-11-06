var accesos;
function setiarAccesos(acc){
    accesos = acc;
}

var tablaConfiguracion;
function listarConfiguracion() {
    tablaConfiguracion= $("#tablaConfiguracion").DataTable({
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controlador/configuracion/controlador_configuracion.php?opcion=listar",
        },
        "columns": [
            { "defaultContent": "" },
            { "data": "conf_nombre_empresa" },
            { "data": "conf_rtn" },
            { "data": "conf_telefono" },
            { "data": "conf_celular" },
            { "data": "conf_correo" },
            { "data": "conf_isv" },
            {
                "data": "conf_img_logo",
                render: function (data) {
                    return `<img src="../MPDF/${data}" width="40px" class="img-circle m-r-10">`;
                }
            },
            
            { "defaultContent": "<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;<button class='btn btn-warning' id='btnViewConfiguracion'><i class='fas fa-eye'></i></button>" }
        ],

        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
        },
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
        },
        select: true
    });
    tablaConfiguracion.on('draw.dt', function () {
        var PageInfo = $('#tablaConfiguracion').DataTable().page.info();
        tablaConfiguracion.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}

$('#tablaConfiguracion').on('click', '#btnViewConfiguracion', function () {
    if (!accesos.includes('24-3')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    limpiarModal("editar");
    var data = tablaConfiguracion.row($(this).parents('tr')).data(); 
    if (tablaConfiguracion.row(this).child.isShown()) { 
        var data = tablaConfiguracion.row(this).data();
    }

    $(".title__modal").html("Vista Configuracion");
    $("#btnActualizarConfiguracion").prop('disabled', true);
    $("#btnUpdateImage").prop('disabled', true);
    
    loadData(data, 'OK');
});
//COIGO PARA OBTENER LOS DATOS DE LA TABLA Y PONERLOS EN LOS INPUTS
$('#tablaConfiguracion').on('click', '.editar', function () {
    
    if (!accesos.includes('24-2')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }

    limpiarModal("editar");
    var data = tablaConfiguracion.row($(this).parents('tr')).data(); 

    if (tablaConfiguracion.row(this).child.isShown()) { 
        var data = tablaConfiguracion.row(this).data();
    }
    
    $(".title__modal").html("Editar Configuracion");
    $("#btnActualizarConfiguracion").prop('disabled', false);
    $("#btnUpdateImage").prop('disabled', false);
    $("#cont__img").css('display', 'none'); 
    loadData(data);
    
});

//COIGO PARA OBTENER LOS DATOS DE LA TABLA Y PONERLOS EN LOS INPUTS
function loadData(data, imagen = ''){
    let {conf_id,
        conf_nombre_empresa,
        conf_direccion,
        conf_telefono,
        conf_celular,
        conf_rtn,
        conf_correo,
        conf_isv,
        conf_cai,
        conf_fact_fechalimite_emision,
        conf_cantidad_fact,
        conf_numero_inicial,
        conf_numero_final,
        conf_preciodolar,conf_img_logo
        } = data;
    $("#modal_editar").modal('show');
    document.querySelector("#txtIdConfiguracion").value = conf_id;
    document.querySelector("#txtNombreEditar").value = conf_nombre_empresa;
    document.querySelector("#txtrtnEditar").value = conf_rtn;
    document.querySelector("#txttelefonoEditar").value = conf_telefono;
    document.querySelector("#txtcelularEditar").value = conf_celular;
    document.querySelector("#txtcorreoEditar").value = conf_correo;
    document.querySelector("#txtisvEditar").value = conf_isv;
    document.querySelector("#txtcaiEditar").value = conf_cai;
    document.querySelector("#txtfechaEditar").value = conf_fact_fechalimite_emision;
    document.querySelector("#txtcantidadFacturasEditar").value = conf_cantidad_fact;
    document.querySelector("#txtnumeroinicialEditar").value = conf_numero_inicial;
    document.querySelector("#txtnumerofinalEditar").value = conf_numero_final;
    document.querySelector("#txtdolarEditar").value = conf_preciodolar;
    document.querySelector("#txtdireccionEditar").value = conf_direccion;

    if (imagen == 'OK') {
        $(".img__configuracion").attr("src", "../MPDF/"+conf_img_logo);
        $("#cont__img").css('display', 'block');
    }
}

function registrarConfiguracion() {
    let nombre = document.querySelector("#txtNombre").value;
    let rtn = document.querySelector("#txtrtn").value;
    let telefono = document.querySelector("#txttelefono").value;
    let celular = document.querySelector("#txtcelular").value;
    let correo = document.querySelector("#txtcorreo").value;
    let isv = document.querySelector("#txtisv").value;
    let cai = document.querySelector("#txtcai").value;
    let fecha = document.querySelector("#txtfecha").value;
    let cantidadFacturas = document.querySelector("#txtcantidadFacturas").value;
    let numeroInicial = document.querySelector("#txtnumeroinicial").value;
    let numeroFinal = document.querySelector("#txtnumerofinal").value;
    let dolar = document.querySelector("#txtdolar").value;
    let archivo = document.querySelector("#txtImagen").value;
    let direccion = document.querySelector("#txtdireccion").value;
    
    let f = new Date();
    let extension = archivo.split('.').pop();

    //Para que ninguna imagen se repita
    let nombreArchivo = "EMP" + f.getDate() + "" + (f.getMonth() + 1) + "" + f.getFullYear() + "" + f.getHours() + "" + f.getMinutes() + "" + f.getSeconds() + "." + extension;

    let formData = new FormData();
    let foto = $("#txtImagen")[0].files[0];

    if (nombre.length == 0 || rtn.length == 0  || telefono.length == 0
        || celular.length ==0 || correo.length == 0 || isv.length == 0 || cai.length == 0 || fecha.length == 0
        || cantidadFacturas.length == 0 || numeroInicial.length == 0 || numeroFinal.length == 0 || dolar.length == 0 
        || direccion.length == 0 ) {
            
        mensajeError(nombre, rtn, telefono, celular, correo, isv,cai,fecha,cantidadFacturas,numeroInicial,
            numeroFinal,dolar,direccion, 'divError');
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios, favor de llenarlos', 'warning');
    }

    formData.append('conf_nombre_empresa', nombre);
    formData.append('conf_direccion', direccion);
    formData.append('conf_telefono', telefono);
    formData.append('conf_celular', celular);
    formData.append('conf_rtn', rtn);
    formData.append('conf_correo', correo);
    formData.append('foto', foto);
    formData.append('conf_isv', isv);
    formData.append('nombreArchivo', nombreArchivo);
    formData.append('conf_cai', cai);
    formData.append('conf_fact_fechalimite_emision', fecha);
    formData.append('conf_cantidad_fact',cantidadFacturas);
    formData.append('conf_numero_inicial',numeroInicial);
    formData.append('conf_numero_final',numeroFinal);
    formData.append('conf_preciodolar',dolar);
    

    $.ajax({
        url: '../controlador/configuracion/controlador_configuracion.php?opcion=registrar',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            if (respuesta > 0) {
                if (respuesta == 1) {
                    tablaConfiguracion.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
                    $("#modal_registro").modal('hide'); //Desaparecer la ventana modal
                    document.querySelector('#formularioRegistrarConfiguracion').reset(); //Limpiamos todos los inputs

                    Swal.fire('Mensaje de confirmacion', 'Datos registrados correctamente', 'success');
                } else  {
                    Swal.fire('Mensaje de advertencia', 'El nombre de la empresa ya se encuentra ingresado en la base de datos', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
            }
        }
    });
    return false;
}

function editarConfiguracion() {
    let idConfiguracion = document.querySelector("#txtIdConfiguracion").value;
    let nombre = document.querySelector("#txtNombreEditar").value;
    let rtn = document.querySelector("#txtrtnEditar").value;
    let telefono = document.querySelector("#txttelefonoEditar").value;
    let celular = document.querySelector("#txtcelularEditar").value;
    let correo = document.querySelector("#txtcorreoEditar").value;
    let isv = document.querySelector("#txtisvEditar").value;
    let cai = document.querySelector("#txtcaiEditar").value;
    let fecha = document.querySelector("#txtfechaEditar").value;
    let cantidadFacturas = document.querySelector("#txtcantidadFacturasEditar").value;
    let numeroInicial = document.querySelector("#txtnumeroinicialEditar").value;
    let numeroFinal = document.querySelector("#txtnumerofinalEditar").value;
    let dolar = document.querySelector("#txtdolarEditar").value;
    let direccion = document.querySelector("#txtdireccionEditar").value;

    if (nombre.length == 0 || rtn.length == 0  || telefono.length == 0
        || celular.length ==0 || correo.length == 0 || isv.length == 0 || cai.length == 0 || fecha.length == 0
        || cantidadFacturas.length == 0 || numeroInicial.length == 0 || numeroFinal.length == 0 || dolar.length == 0 
        || direccion.length == 0 ) {
            
        mensajeError(nombre, rtn, telefono, celular, correo, isv,cai,fecha,cantidadFacturas,numeroInicial,
            numeroFinal,dolar,direccion, 'divErrorEditar');
        return Swal.fire('Mensaje de advertencia', 'Todos los campos son obligatorios, favor de llenarlos', 'warning');
    }

    $.ajax({
        url: '../controlador/configuracion/controlador_configuracion.php?opcion=editar',
        type: 'POST',
        data: {
            idConfiguracion: idConfiguracion,
            nombre: nombre,
            rtn: rtn,
            telefono: telefono,
            celular: celular,
            correo: correo,
            isv: isv,
            cai: cai,
            fecha: fecha,
            cantidadFacturas: cantidadFacturas,
            numeroInicial: numeroInicial,
            numeroFinal: numeroFinal,
            dolar: dolar,
            direccion: direccion
        }
    }).done(function (resp) {
        if (isNaN(resp)) {
            document.querySelector('#divErrorEditar').style.display = "block";
            document.querySelector('#divErrorEditar').innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + resp;
        } else {
            if (resp > 0) {
                document.querySelector('#divErrorEditar').style.display = "none";
                if (resp == 1) {
                    tablaConfiguracion.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
                    $("#modal_editar").modal('hide'); //Desaparecer la ventana modal
                    document.querySelector('#formularioEditarConfiguracion').reset();
                    Swal.fire('Mensaje de confirmacion', 'Datos actualizados correctamente', 'success');
                } else {
                    Swal.fire('Mensaje de advertencia', 'La empresa ya se encuentra ingresado en la base de datos', 'warning');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'La actualizacion no se pudo completar', 'warning');
            }
        }
    });
}

function editarFotoConfiguracion() {
    let idConfiguracion = document.querySelector("#txtIdConfiguracion").value;
    let archivo = document.querySelector("#txtImagenEditar").value;

    let f = new Date();
    let extension = archivo.split('.').pop();

    //Para que ninguna imagen se repita
    let nombreArchivo = "EMP" + f.getDate() + "" + (f.getMonth() + 1) + "" + f.getFullYear() + "" + f.getHours() + "" + f.getMinutes() + "" + f.getSeconds() + "." + extension;
    let formData = new FormData();
    let foto = $("#txtImagenEditar")[0].files[0];

    if (archivo.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Debes seleccionar una imagen', 'warning');
    }

    formData.append('id', idConfiguracion);;
    formData.append('foto', foto);
    formData.append('nombreArchivo', nombreArchivo);
    $.ajax({
        url: '../controlador/configuracion/controlador_configuracion.php?opcion=editarFoto',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (respuesta) {
            if (respuesta != 0) {
                if (respuesta == 1) {
                    tablaConfiguracion.ajax.reload();//Recargamos la tabla para ver reflejados los cambios sin necesidad de actualizar el navegador
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
    if (!accesos.includes('24-1')) {
        return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
    }
    $("#modal_registro").modal({ backdrop: 'static', keyboard: false }); //Para que no se cierre el modal
    $("#modal_registro").modal('show');
    limpiarModal("registrar");

}

//producto, idCategoria, idUnidadMedida, precio, precioCompra, idFabricante, stockMinimo,codigo,  'NADA', 'divError'

function mensajeError(nombre, rtn, telefono, celular, correo, isv, cai,fecha, cantidadFacturas,numeroInicial,numeroFinal,
    dolar,direccion, div) {
    let cadena = "";
    if (nombre.length === 0) {
        cadena += "El campo nombre Empresa no debe estar vacio. <br>";
    }
    if (rtn.length === 0) {
        cadena += "El campo RTN no debe estar vacio. <br>";
    }
    if (telefono.length === 0) {
        cadena += "El campo teléfono no debe estar vacio. <br>";
    }
    if (celular.length === 0) {
        cadena += "El campo celular venta no debe estar vacio. <br>";
    }
    if (correo.length === 0) {
        cadena += "El campo correo compra no debe estar vacio. <br>";
    }
    if (isv.length === 0) {
        cadena += "El campo isv no debe estar vacio. <br>";
    }
    if (cai.length === 0) {
        cadena += "El campo cai  no debe estar vacio. <br>";
    }
    if (fecha.length === 0) {
        cadena += "El campo fecha no debe estar vacio. <br>";
    }
    if (cantidadFacturas.length === 0) {
        cadena += "El campo cantidad facturas no debe estar vacio. <br>";
    }
    if (numeroInicial.length === 0) {
        cadena += "El campo numero inicial no debe estar vacio. <br>";
    }
    if (numeroFinal.length === 0) {
        cadena += "El campo numero final no debe estar vacio. <br>";
    }
    if (dolar.length === 0) {
        cadena += "El campo precio dolar no debe estar vacio. <br>";
    }

    if (direccion.length === 0) {
        cadena += "El campo direccion no debe estar vacio. <br>";
    }

    if (div == 'divErrorEditar') {
        // if (estatus.length === 0) {
        //     cadena += "Seleccione una opcion de estatus. <br>";
        // }
    }

    document.querySelector("#" + div).style.display = "block";
    document.querySelector("#" + div).innerHTML = "<strong>Revise los siguientes campos: </strong> <br>" + cadena;
}

function limpiarModal(tipoModal) {
    if (tipoModal == "registrar") {
        const divError = document.querySelector('#divError');
        document.querySelector('#formularioRegistrarConfiguracion').reset();

        while (divError.firstChild) {
            divError.removeChild(divError.firstChild);
        }
        divError.style.display = "none";
    }else {
        const divErrorE = document.querySelector('#divErrorEditar');
        document.querySelector('#formularioEditarConfiguracion').reset();

        while (divErrorE.firstChild) {
            divErrorE.removeChild(divErrorE.firstChild);
        }
        divErrorE.style.display = "none";
    }
}
