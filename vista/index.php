<?php
session_start();
if (!isset($_SESSION['S_IDUSUARIO'])) { 
    header('Location: login.php');
}


// print_r($_SESSION);
?>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MecaniSoft</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="plantilla/plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="plantilla/dist/css/adminlte.min.css">

    <!-- PRUEBAS DATATABLE -->
    <link rel="stylesheet" href="plantilla/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plantilla/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plantilla/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <link rel="stylesheet" href="plantilla/plugins/datatables-select/css/select.bootstrap4.min.css">

    <!-- SWEETALERT 2 -->
    <link rel="stylesheet" href="plantilla/plugins/sweetalert2/sweetalert2.css">

    <!-- ESTILO PROPIO -->
    <link rel="stylesheet" href="public/estilos.css?rev=<?php echo time(); ?>">
    
    <link rel="stylesheet" href="plantilla/plugins/fullcalendar/fullcalendar.min.css">

</head>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
            </ul>

            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <!-- NOTIFICACIONES -->
                <li class="nav-item dropdown" <?php  if(!in_array('21', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <i class="far fa-bell"></i>
                        <span class="badge badge-warning navbar-badge" id="cantidadNotificaciones"></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" id="notificaciones">
                        

                        
                    </div>
                </li>
                <!-- FIN NOTIFICACIONES -->


                <li class="nav-item">
                    <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                        <i class="fas fa-th-large"></i>
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <img id="txtImagenUsuarioDropdown" width="25px" class="img-circle" />
                        <span id="txtUsarioDropdown"></span></a>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        <a href="#" class="dropdown-item" <?php  if(!in_array('18-4', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?> onclick="cargarContenido('contenido-principal', 'usuario/vista_profile.php');">
                            <i class="fas fa-users mr-2"></i> Perfil
                        </a>
                        <a href="../controlador/usuario/controlador_cerrar_session.php" class="dropdown-item">
                            <i class="fa fa-power-off mr-2"></i> Cerrar Sesion
                        </a>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="index.php" class="brand-link">
                <img src="plantilla/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text font-weight-light">MecaniSoft</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img id="imagenUsuarioPrincipal" class="img-circle elevation-2">
                    </div>
                    <div class="info">
                        <a href="#" id="lblUsuarioSidebar"></a><br>
                        <a href="#" class="text-center" id="txtRolSidebar"></a>
                    </div>
                </div>
                

                <!-- Sidebar Menu -->
                <nav class="mt-1">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        
                        <?php if (true) { ?>

                            <!-- OPCION ALMACEN -->
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fab fa-dropbox"></i>
                                    <p>
                                        Almacén
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item" <?php  if(!in_array('5', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'producto/vista_mantenimiento_producto.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Productos</p>
                                        </a>
                                    </li>
                                    <li class="nav-item" <?php  if(!in_array('6', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'categoria/vista_mantenimiento_categoria.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Categoria</p>
                                        </a>
                                    </li>
                                    <li class="nav-item" <?php  if(!in_array('7', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'fabricante/vista_mantenimiento_fabricante.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Fabricante</p>
                                        </a>
                                    </li>
                                    <li class="nav-item" <?php  if(!in_array('8', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'unidadmedida/vista_mantenimiento_unidadmedida.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Unidad de Medida</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- FIN OPCION ALMACEN -->

                            <!-- OPCION COMPRAS  -->
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-th"></i>
                                    <p>
                                        Compras
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item" <?php  if(!in_array('9', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'proveedor/vista_mantenimiento_proveedor.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Proveedores</p>
                                        </a>
                                    </li>
                                    <li class="nav-item" <?php  if(!in_array('10', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'ingreso/vista_mantenimiento_ingreso.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>
                                                Ingresos
                                            </p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- FIN OPCION COMPRAS -->

                            <!-- COTIZACIONES -->
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-sign-out-alt"></i>
                                    <p>
                                        Movimientos
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item" <?php  if(!in_array('14', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'movimientos/vista_mantenimiento_movimiento.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Salidas</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- FIN COTIZACIONES -->

                            <!-- OPCIN VENTAS -->
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-shopping-cart"></i>
                                    <p>
                                        Ventas
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item" <?php  if(!in_array('11', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'cliente/vista_mantenimiento_cliente.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Clientes</p>
                                        </a>
                                    </li>
                                    <li class="nav-item" <?php  if(!in_array('12', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'venta/vista_mantenimiento_venta.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>
                                                Ventas
                                            </p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- FIN OPCION VENTAS -->

                            <!-- COTIZACIONES -->
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-list-alt"></i>
                                    <p>
                                        Acciones
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item" <?php  if(!in_array('13', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'cotizacion/vista_mantenimiento_cotizacion.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Cotizacion / Orden de trabajo</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- FIN COTIZACIONES -->

                            <!-- OPCIN VENTAS -->
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-cogs"></i>
                                    <p>
                                        Trabajos
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item" <?php  if(!in_array('4', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'tareas/vista_mantenimiento_tareas.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Tareas</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- FIN OPCION VENTAS -->

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fa fa-wrench"></i>
                                    <p>
                                        Servicios
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item" <?php  if(!in_array('19', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'servicio/vista_mantenimiento_servicio.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Servicio</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            


                            

                            <!-- OPCION VEHICULOS  -->
                            <li class="nav-item" >
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-solid fa-car"></i>
                                    <p>
                                        Vehiculos
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">

                                    <li class="nav-item" <?php  if(!in_array('3', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'vehiculo/vista_mantenimiento_vehiculo.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Vehiculo</p>
                                        </a>
                                    </li>

                                    <li class="nav-item" <?php  if(!in_array('15', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'marca/vista_mantenimiento_marca.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Marca</p>
                                        </a>
                                    </li>

                                    <li class="nav-item" <?php  if(!in_array('16', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'modelo/vista_mantenimiento_modelo.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>
                                                Modelo
                                            </p>
                                        </a>
                                    </li>

                                </ul>
                            </li>

                            <!-- FIN OPCION VEHICULOS  -->

                            <!-- OPCION ACCESO -->
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-users-cog"></i>
                                    <p>
                                        Personal
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item" <?php  if(!in_array('17', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'persona/vista_mantenimiento_persona.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Personas</p>
                                        </a>
                                    </li>
                                    <li class="nav-item" <?php  if(!in_array('18', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'usuario/vista_mantenimiento_usuario.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Usuarios</p>
                                        </a>
                                    </li>
                                    <li class="nav-item" <?php  if(!in_array('20', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'rol/vista_mantenimiento_rol.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>
                                                Rol
                                            </p>
                                        </a>
                                    </li>

                                    <li class="nav-item" <?php  if(!in_array('2', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'acceso/vista_mantenimiento_acceso.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>
                                                Accesos
                                            </p>
                                        </a>
                                    </li>

                                    <li class="nav-item" <?php  if(!in_array('23', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'bitacora/vista_mantenimiento_bitacora.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>
                                                Bitacora
                                            </p>
                                        </a>
                                    </li>

                                </ul>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    
                                    <i class="nav-icon far fa-building"></i>
                                    <p>
                                        Configuracion
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview" <?php  if(!in_array('24', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link" onclick="cargarContenido('contenido-principal', 'configuracion/vista_mantenimiento_configuracion.php')">
                                            <i class="far fa-circle nav-icon"></i>
                                            
                                            <p>Configuracion</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            
                            <!-- FIN OPCION ACCESO -->
                        <?php } ?>

                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

        <!-- SETEANDO LA SESION -->
        <input type="text" value="<?php echo $_SESSION['S_IDUSUARIO']; ?>" id="txtIdUsuarioLogeado" hidden>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper" id="contenido-principal">

            <!-- CONTENIDO PRINCIPAL -->
            <div class="content py-4" <?php  if(!in_array('22', $_SESSION['S_ACCESOS'])) echo 'hidden'; ?>>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-6 mb-2">
                            <label for=""><b>Fecha Inicio</b></label>
                            <input type="date" id="txtFechaInicioDash" class="form-control">
                        </div>
                        <div class="col-lg-6 mb-2">
                            <label for=""><b>Fecha Fin</b></label>
                            <input type="date" id="txtFechaFinDash" class="form-control">
                        </div>

                    </div>
                    <div class="row mt-2" id="divWidget">

                    </div>

                    <div class="row" id="ejecutarGraficos">
                        <div class="col-lg-6">
                            <div class="card card-secondary">
                                <div class="card-header">
                                    <h3 class="card-title">Productos más vendidos</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <canvas id="canvasTop10Ventas" style="min-height: 250px; height: 450px; max-height: 450px; max-width: 100%;"></canvas>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card card-secondary">
                                <div class="card-header">
                                    <h3 class="card-title">Servicios más solicitados</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <canvas id="canvasTop10Servicios" style="min-height: 250px; height: 450px; max-height: 450px; max-width: 100%;"></canvas>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>


                        <div class="col-lg-6">
                            <div class="card card-secondary">
                                <div class="card-header">
                                    <h3 class="card-title">Top 10 Productos menos vendidos</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <canvas id="canvasTop10MenosVendidos" style="min-height: 250px; height: 450px; max-height: 450px; max-width: 100%;"></canvas>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="card card-secondary">
                                <div class="card-header">
                                    <h3 class="card-title">Top 10 Productos menos ingresados</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <canvas id="canvasTop10MenosIngresados" style="min-height: 250px; height: 450px; max-height: 450px; max-width: 100%;"></canvas>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="card card-secondary">
                                <div class="card-header">
                                    <h3 class="card-title">Top 10 Servicios menos solicitados</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <canvas id="top10ServiciosMenosSolicitados" style="min-height: 250px; height: 450px; max-height: 450px; max-width: 100%;"></canvas>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>


                        <div class="col-lg-6">
                            <div class="card card-secondary">
                                <div class="card-header">
                                    <h3 class="card-title">Top 10 Productos más ingresados</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <canvas id="canvasTop10Ingresos" style="min-height: 250px; height: 450px; max-height: 450px; max-width: 100%;"></canvas>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                        

                        

                        <div class="col-lg-12">
                            <div class="card card-secondary">
                                <div class="card-header">
                                    <h3 class="card-title">Meses con más ventas</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <canvas id="canvasMesesMasVentas" style="min-height: 250px; height: 700px; max-height: 700px; max-width: 100%;"></canvas>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>

                    </div>
                    <!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>

        <!-- /.control-sidebar -->

        <!-- Main Footer -->
        <footer class="main-footer">
            <div id="ejecutar__notificacion"></div> 
            <!-- To the right -->
            <div class="float-right d-none d-sm-inline">
                MecaniSoft
            </div>
            <!-- Default to the left -->
            <strong>Copyright &copy;<a href="#">MecaniSoft, Brayan Alvarez</a>.</strong> Todos los derechos reservados.
        </footer>
    </div>
    <!-- ./wrapper -->

    <!-- REQUIRED SCRIPTS -->

    <!-- jQuery -->
    <!-- <script src="plantilla/plugins/jquery/jquery.min.js"></script> -->
    <script src="plantilla/plugins/jquery/jquery-3.0.0.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plantilla/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="plantilla/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

    <!-- AdminLTE App -->
    <script src="plantilla/dist/js/adminlte.min.js"></script>

    <script src="plantilla/dist/js/demo.js"></script>

    <!-- PRUEBAS DATATABLE -->
    <script src="plantilla/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="plantilla/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="plantilla/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="plantilla/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="plantilla/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
    <script src="plantilla/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
    <script src="plantilla/plugins/jszip/jszip.min.js"></script>
    <script src="plantilla/plugins/pdfmake/pdfmake.min.js"></script>
    <script src="plantilla/plugins/pdfmake/vfs_fonts.js"></script>
    <script src="plantilla/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
    <script src="plantilla/plugins/datatables-buttons/js/buttons.print.min.js"></script>
    <script src="plantilla/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
    <script src="plantilla/plugins/datatables-select/js/dataTables.select.min.js"></script>

    <!-- SWALALERT -->
    <script src="plantilla/plugins/sweetalert2/sweetalert2.min.js"></script>

    <!-- CHART JS -->
    <script src="plantilla/plugins/chart.js/Chart.min.js"></script>

    <script src="../js/console_usuario.js?rev=<?php echo time(); ?>"></script>
    <script src="../js/notificaciones.js"></script>
    

    <!-- <script src="plantilla/plugins/jquery-ui/jquery-ui.min.js"></script> -->
    <script src="plantilla/plugins/fullcalendar/moment.min.js"></script>
    <script src="plantilla/plugins/fullcalendar/fullcalendar.min.js"></script>
    <script src="plantilla/plugins/fullcalendar/es.js"></script>

    <script>
        $(document).ready(function() {
            var fecha = new Date();
            var year = fecha.getFullYear();
            var mes = fecha.getMonth() + 1;
            var dia = fecha.getDate();

            if (dia < 10) {
                dia = '0' + dia;
            }
            if (mes < 10) {
                mes = '0' + mes;
            }

            document.querySelector('#txtFechaInicioDash').value = year + '-' + mes + '-' + dia;
            document.querySelector('#txtFechaFinDash').value = year + '-' + mes + '-' + dia;
            obtenerDatosWidgets();
        });
        document.addEventListener("DOMContentLoaded", function(event) { 
            var scrollpos = localStorage.getItem('scrollpos');
            if (scrollpos) window.scrollTo(0, scrollpos);
        });

        window.onbeforeunload = function(e) {
            localStorage.setItem('scrollpos', window.scrollY);
        };
    
        obtenerDatosUsuario();

        function cargarContenido(id, vista) {
            $("#" + id).load(vista);
        }

        function soloLetras(e) {
            key = e.keyCode || e.which;

            teclado = String.fromCharCode(key).toLowerCase();

            letras = "qwertyuiopasdfghjklñzxcvbnmáéíóúÁÉÍÓÚ' ";

            especiales = "8-37-38-46-164";

            teclado_especial = false;

            for (var i in especiales) {
                if (key == especiales[i]) {
                    teclado_especial = true;
                    break;
                }
            }

            if (letras.indexOf(teclado) == -1 && !teclado_especial) {
                return false;
            }
        }

        function soloNumeros(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 8) {
                return true;
            }
            // Patron de entrada, en este caso solo acepta numeros
            patron = /[0-9.]/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);
        }

        function filterFloat(evt, input) {
            var key = window.Event ? evt.which : evt.keyCode;
            var chark = String.fromCharCode(key);
            var tempValue = input.value + chark;
            if (key >= 48 && key <= 57) {
                if (!filter(tempValue)) {
                    return false;
                } else {
                    return true;
                }
            } else {
                if (key == 8 || key == 13 || key == 0) {
                    return true;
                } else if (key == 46) {
                    if (!filter(tempValue)) {
                        return false;
                    } else {
                        return true;
                    }
                } else {
                    return false;
                }
            }
        }

        function filter(__value__) {
            var preg = /^([0-9]+\.?[0-9]{0,2})$/;
            if (preg.test(__value__)) {
                return true;
            } else {
                return false;
            }
        }

        
    </script>
</body>

</html>