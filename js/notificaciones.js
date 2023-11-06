function generarNotifiaciones() {
    $.ajax({
        url: '../controlador/usuario/controlador_usuario.php?opcion=notificaciones',
        type: 'POST'
    }).done(function (respuestaNotificaciones) {
        if (respuestaNotificaciones.length > 1) {
            let notificaciones = JSON.parse(respuestaNotificaciones);
            limpiarNotificaciones();
            construirNotificaciones(notificaciones);    
        } else {
            limpiarNotificaciones();
        }
    });
}    

function construirNotificaciones(data) {
    let cantidadNotificaciones = data.length;
    let contenedorNoti = document.getElementById('notificaciones');
    let burbujaNotificaciones = document.getElementById('cantidadNotificaciones');
    
    burbujaNotificaciones.textContent = cantidadNotificaciones;
    data.forEach(item => {
        let {producto_nombre, producto_stock} = item;
        let html = document.createElement('div');
        html.innerHTML = `
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item">
            <i class="fas fa-archive"></i> ${producto_nombre}
            <span class="float-right text-muted text-sm">${producto_stock} restantes</span>
        </a>

        <div class="dropdown-divider"></div>`;
        contenedorNoti.appendChild(html);
    });
}

function limpiarNotificaciones() {
    let burbujaNotificaciones = document.getElementById('cantidadNotificaciones');
    let contNotificaciones = document.getElementById('notificaciones');
    while (contNotificaciones.firstChild) {
        contNotificaciones.removeChild(contNotificaciones.firstChild);
    }
    burbujaNotificaciones.textContent = '';
}

$(document).ready(function () {
    let existeConfirmacion = document.querySelector('.wrapper .main-footer #ejecutar__notificacion'); 
    if (existeConfirmacion) {
        generarNotifiaciones();
        existeConfirmacion.remove();
    }    
});

