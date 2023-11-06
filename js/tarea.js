var accesos;
function setiarAccesos(acc) {
    accesos = acc;
}

var calendar;
$(document).ready(function () {
    listOrderByClient();
    calendar = $('#calendar').fullCalendar({
        header: {
            left: "prev,next today",
            center: "title",
            right: "month, agendaWeek, agendaDay, list"
        },

        locale: 'es',
        defaultView: "month",
        navLinks: true,
        editable: true,
        eventLimit: true,
        selectable: true,
        selectHelper: true,

        select: function (start, end, allDay) {
            if (!accesos.includes('4-3')) {
                return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
            }

            var start = $.fullCalendar.formatDate(start, "Y-MM-DD");
            var end = $.fullCalendar.formatDate(end, "Y-MM-DD");
            let dateCurrent = moment().format('Y-MM-DD');

            if (start < dateCurrent) {
                return Swal.fire('Mensaje de advertencia', 'La fecha seleccionada es menor a la actual, por favor seleccione una fecha mayor o igual.', 'warning');
            }
            $('#modal__tarea').modal('show');
            $('#txtDateStart').val(start);
            $('#txtDateEnd').val(end);
        },

        events: '../controlador/tareas/controlador_tarea.php?opcion=listar',

        eventResize: function (event, delta, revertFunc) {
            if (!accesos.includes('4-2')) {
                revertFunc();
                return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
            }
            let { start, end, title, id, estado } = event
            var fstart = $.fullCalendar.formatDate(start, "Y-MM-DD");
            var fend = $.fullCalendar.formatDate(end, "Y-MM-DD");
            var titlee = title;
            var idTarea = id;

            if (estado == 'FINALIZADO' || estado == 'ORDEN ANULADA') {
                revertFunc();
                if (estado == 'ORDEN ANULADA') {
                    return Swal.fire('Mensaje de advertencia', 'La fecha del trabajo: ' + titlee + ', no puede ser moficada porque el trabajo ha sido anulado.', 'warning');    
                } else {
                    return Swal.fire('Mensaje de advertencia', 'La fecha del trabajo: ' + titlee + ', no puede ser moficada porque el trabajo ya ha sido finalizado.', 'warning');
                }
            }

            Swal.fire({
                title: '¿Esta seguro de modificar la fecha del trabajo: ' + titlee + '?',
                text: "Si se equivoca puede revertir los cambios!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, modificar fecha!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '../controlador/tareas/controlador_tarea.php?opcion=updateDate',
                        type: 'POST',
                        data: {
                            idTarea: idTarea,
                            fstart: fstart,
                            fend: fend
                        }
                    }).done(function (resp) {
                        if (resp > 0) {
                            if (resp == 1) {
                                Swal.fire('Mensaje de confirmacion', 'La fecha del trabajo ' + title + ', se actualizo correctamente.', 'success');
                            }
                        } else {
                            Swal.fire('Mensaje de advertencia', 'La actualizacion de la fecha no se pudo completar.', 'warning');
                        }
                    });
                } else {
                    calendar.fullCalendar('refetchEvents');
                }
            });
        },

        eventDrop: function (event, delta, revertFunc) {
            if (!accesos.includes('4-2')) {
                revertFunc();
                return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
            }
            let { title, start, estado, id, end } = event;

            if (estado == 'FINALIZADO' || estado == 'ORDEN ANULADA') {
                revertFunc();
                if (estado == 'ORDEN ANULADA') {
                    return Swal.fire('Mensaje de advertencia', 'La fecha del trabajo: ' + title + ', no puede ser moficada porque el trabajo ha sido anulado.', 'warning');    
                } else {
                    return Swal.fire('Mensaje de advertencia', 'La fecha del trabajo: ' + title + ', no puede ser moficada porque el trabajo ya ha sido finalizado.', 'warning');
                }
            }

            let dateStart = start.format()
            let dateEnd = '';
            if (end != null) {
                dateEnd = end.format();
            } else {
                dateEnd = dateStart;
            }

            Swal.fire({
                title: '¿Esta seguro de modificar la fecha del trabajo: ' + title + '?',
                text: "Si se equivoca puede revertir los cambios!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, modificar fecha!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '../controlador/tareas/controlador_tarea.php?opcion=updateDate',
                        type: 'POST',
                        data: {
                            idTarea: id,
                            fstart: dateStart,
                            fend: dateEnd
                        }
                    }).done(function (resp) {
                        if (resp > 0) {
                            if (resp == 1) {
                                Swal.fire('Mensaje de confirmacion', 'La fecha del trabajo ' + title + ', se actualizo correctamente.', 'success');
                            }
                        } else {
                            revertFunc();
                            Swal.fire('Mensaje de advertencia', 'La actualizacion de la fecha no se pudo completar.', 'warning');
                        }
                    });
                } else {
                    revertFunc();
                }
            });
        },

        eventClick: function (calEvent) {
            if (!accesos.includes('4-4')) {
                return Swal.fire('No tienes este acceso', 'Ponte en contacto con el administrador', 'warning');
            }
            let { id, title, estado, notas, cliente, vehiculo } = calEvent;

            $('#txtIdTask').val(id);
            $('#txtTitleEdit').val(title);
            $('#txtNotas').val(notas);
            $('#txtCliente').val(cliente);
            $('#txtVehiculo').val(vehiculo);

            if (estado == 'FINALIZADO' || estado == 'ORDEN ANULADA') {
                if (estado == 'ORDEN ANULADA') {
                    $('#anulada').css('display', 'block');
                    $('#estado_principal').css('display', 'none');
                    $('#txtOrdenAnulada').val(estado);
                } else {
                    $('#estado_principal').css('display', 'block');
                    $('#anulada').css('display', 'none');
                }

                $('#cboState').prop('disabled', true);
                $('#btnUpdateTask').prop('disabled', true);
            } else {
                if (!accesos.includes('4-5')) {
                    $('#cboState').prop('disabled', true);
                    $('#btnUpdateTask').prop('disabled', true);
                } else {
                    $('#cboState').prop('disabled', false);
                    $('#btnUpdateTask').prop('disabled', false);
                }
            }
            $('#cboState').val(estado).trigger("change");
            $('#modal__work').modal('show');
        }
    });

});

$('#btnSaveTask').click(function (e) {
    let trabajos = valoresCheck();
    let notas = getValueTextarea(trabajos).toString();
    let work = trabajos.toString();
    let start = $('#txtDateStart').val();
    let end = $('#txtDateEnd').val();

    if (trabajos.length == 0) {
        return Swal.fire('Mensaje de advertencia', 'Debe seleccionar el trabajo que realizara para poder guardar.', 'warning');
    }

    $.ajax({
        url: '../controlador/tareas/controlador_tarea.php?opcion=save',
        type: 'POST',
        data: {
            trabajos: work,
            start: start,
            end: end,
            notas: notas
        }
    }).done(function (resp) {
        if (resp > 0) {
            if (resp == 1) {
                calendar.fullCalendar('refetchEvents');
                configSuccess();
                Swal.fire('Mensaje de confirmacion', 'Tarea(s) registradas correctamente.', 'success');
            }
        } else {
            Swal.fire('Mensaje de advertencia', 'El registro no se pudo completar', 'warning');
        }
    });
});

function listOrderByClient() {
    $.ajax({
        url: "../controlador/tareas/controlador_tarea.php?opcion=orderByClient",
        type: "POST"
    }).done(function (resp) {
        let data = JSON.parse(resp);
        let cadena = "";
        if (data.length > 0) {
            for (let i = 0; i < data.length; i++) {
                if (i == 0) {
                    cadena += "<option value=''>--SELECCIONE--</option>";    
                }
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            document.querySelector('#cboWorkOrder').innerHTML = cadena;
        } else {
            document.querySelector('#cboWorkOrder').innerHTML = "No se encontraron datos";
        }
    });
}

$('#cboWorkOrder').change(function (e) {
    let idTransaccion = $(this).val();
    if (idTransaccion != '') {
        createHTMLServices(idTransaccion);
    }
});

$('#btnUpdateTask').click(function (e) {
    let idTarea = $('#txtIdTask').val();
    let description = $('#txtNotas').val();
    let state = $('#cboState').val();
    let idUsuario = $('#txtIdUsuarioLogeado').val();
    
    if (state == 'PENDIENTE' && description == '') {
        return Swal.fire('Mensaje de advertencia', 'Asegurese de hacer cambios para actualizar, el estado esta pendiente y la descripcion vacia.', 'warning');
    }

    $.ajax({
        url: '../controlador/tareas/controlador_tarea.php?opcion=updateTask',
        type: 'POST',
        data: {
            idTarea: idTarea,
            description: description,
            state: state,
            idUsuario: idUsuario
        }
    }).done(function (resp) {
        if (resp > 0) {
            if (resp == 1) {
                calendar.fullCalendar('refetchEvents');
                $("#frmUpdateTask")[0].reset();
                $('#modal__work').modal('hide');
                Swal.fire('Mensaje de confirmacion', 'Trabajo actualizado correctamente.', 'success');
            }
        } else {
            Swal.fire('Mensaje de advertencia', 'La actualizacion de la fecha no se pudo completar.', 'warning');
        }
    });
});

function deleteTask(event) {
    let idDetailTra = event.target.dataset.id;
    let idTransaccion = $('#cboWorkOrder').val();

    if (idDetailTra != '') {
        $.ajax({
            url: '../controlador/tareas/controlador_tarea.php?opcion=deleteTask',
            type: 'POST',
            data: {
                idDetailTra: idDetailTra
            }
        }).done(function (resp) {
            if (resp > 0) {
                if (resp == 1) {
                    calendar.fullCalendar('refetchEvents');
                    createHTMLServices(idTransaccion);
                    Swal.fire('Mensaje de confirmacion', 'Trabajo quitado exitosamente.', 'success');
                }
            } else {
                Swal.fire('Mensaje de advertencia', 'No se pudo completar la accion de quitar el trabajo.', 'warning');
            }
        });
    }

}

function createHTMLServices(idTransaccion) {
    $.ajax({
        url: "../controlador/tareas/controlador_tarea.php?opcion=listServices",
        type: "POST",
        data: { idTransaccion: idTransaccion }
    }).done(function (resp) {
        limpiarHTML();
        let data = JSON.parse(resp);

        if (data.length > 0) {
            let respuesta = document.querySelector('#tblServices tbody');
            let contador = 1;
            limpiarHTML();

            for (let i = 0; i < data.length; i++) {
                let row = document.createElement('tr');
                row.innerHTML = `<td>${contador}</td>
                    <td>${data[i][1]}</td>
                    <td class='text-center'>
                        <input type='checkbox' value='${data[i][0]}' id='txtValor${i}' onclick='habilitarText(event)' ${(data[i][2] == 'PENDIENTE' || data[i][2] == 'FINALIZADO') ? 'disabled' : ''}>
                    </td>
                    <td class='td__notas'>
                        <textarea class="form-control text__area" id="txt${data[i][0]}" rows="3" width='100%' style='visibility: hidden'></textarea>
                    </td>
                    <td class='${data[i][2]} text-center'>
                        ${data[i][2]}
                    </td>
                    <td class='text-center'>
                        <button type="button" ${(data[i][2] == 'DISPONIBLE' || data[i][2] == 'FINALIZADO') ? 'disabled' : ''} class="btn btn-primary" onclick='deleteTask(event)' data-id='${data[i][0]}'>Quitar</i></button>
                    </td>`;
                contador++;
                respuesta.appendChild(row);
            }

            $('#cont__services').css('display', 'block');
        } else {
            Swal.fire('Mensaje de advertencia', 'Sin resultados.', 'warning');
        }
    });
}

//FUNCTION UTILES
function limpiarHTML() {
    let contenedor = document.querySelector('#tblServices tbody');
    $('#tblServices .th__notas').css('display', 'none');
    $('#tblServices .td__notas').css('display', 'none');
    $('#tblServices .td__notas .text__area').css('visibility', 'hidden');
    while (contenedor.firstChild) {
        contenedor.removeChild(contenedor.firstChild);
    }
}

function valoresCheck() {
    let valoresCheck = [];
    $("#tblServices input[type=checkbox]:checked").each(function (index) {
        valoresCheck = [...valoresCheck, this.value];
    });
    return valoresCheck;
}

function habilitarText(event) {
    let checkbox = document.getElementById(event.target.id);
    let id = event.target.value;
    let descripcionHead = document.querySelector('#tblServices .th__notas');
    let descpBody = document.querySelectorAll('#tblServices .td__notas');
    let textarea = document.getElementById('txt' + id);
    var valueChecks = valoresCheck();

    if (valueChecks.length == 0) {
        descripcionHead.style.display = 'none';
        for (let i = 0; i < descpBody.length; i++) {
            descpBody[i].style.display = 'none';
        }
        textarea.style.visibility = 'hidden';
    } else {
        if (checkbox.checked) {
            descripcionHead.style.display = 'block';
            for (let i = 0; i < descpBody.length; i++) {
                descpBody[i].style.display = 'block';
            }
            textarea.style.visibility = 'visible';
        } else {
            textarea.style.visibility = 'hidden';
        }
    }
}

function getValueTextarea(notas) {
    let valoresTextArea = [];
    notas.forEach((nota) => {
        let valor = document.getElementById('txt' + nota).value;
        valoresTextArea = [...valoresTextArea, valor];
    });
    return valoresTextArea;
}

function validateDateHigherCurrent(fechaActual, fechaFinal) {
    valuesStart = fechaActual.split("/");
    valuesEnd = fechaFinal.split("/");
    var dateStart = new Date(valuesStart[2], (valuesStart[1] - 1), valuesStart[0]);
    var dateEnd = new Date(valuesEnd[2], (valuesEnd[1] - 1), valuesEnd[0]);
    if (dateStart > dateEnd) {
        return 0;
    }
    return 1;
}

function formatoFecha(fecha, formato) {
    const map = {
        dd: fecha.getDate() + 1,
        mm: fecha.getMonth() + 1,
        yy: fecha.getFullYear().toString().slice(-2),
        yyyy: fecha.getFullYear()
    }

    return formato.replace(/dd|mm|yyyy|yyy/gi, matched => map[matched])
}

function configSuccess() {
    limpiarHTML();
    document.querySelector('#frmRegisterTask').reset();
    $("#modal__tarea").modal('hide');
    $('#cont__services').css('display', 'none');
}