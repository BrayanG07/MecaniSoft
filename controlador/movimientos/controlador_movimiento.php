<?php
require '../../modelo/modelo_movimientos.php';
require '../../modelo/modelo_bitacora.php';
    $MB = new ModeloBitacora();
    session_start();

$modeloMovimiento = new ModeloMovimiento();
$opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";
switch ($opcion) {
    case 'listar':
        $fechaInicio = htmlspecialchars($_POST['fechaInicio'], ENT_QUOTES, 'UTF-8');
        $fechaFin = htmlspecialchars($_POST['fechaFin'], ENT_QUOTES, 'UTF-8');
        $consulta = $modeloMovimiento->listarMovimiento($fechaInicio, $fechaFin);

        if ($consulta) {
            echo json_encode($consulta);
        } else {

            echo '{
                "sEcho": 1, 
                "iTotalRecords": "0", 
                "ITotalDisplayRecords": "0", 
                "aaData": [] 
            }';
        }
        break;
    case 'listarDetalleMovimiento':
        $idTransaccion = htmlspecialchars($_POST['idTransaccion'], ENT_QUOTES, 'UTF-8');
        $consulta = $modeloMovimiento->listarDetalleMovimiento($idTransaccion);

        if ($consulta) {
            echo json_encode($consulta);
        } else {

            echo '{
                    "sEcho": 1, 
                    "iTotalRecords": "0", 
                    "ITotalDisplayRecords": "0", 
                    "aaData": [] 
                }';
        }
        break;
    case 'registrarMovimiento':
        $motivo = htmlspecialchars($_POST['motivo'], ENT_QUOTES, 'UTF-8');
        $idUsuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');

        $consulta = $modeloMovimiento->registrarMovimiento($motivo, $idUsuario);

        echo $consulta;
        break;
    case 'editarMovimiento':
        $motivo = htmlspecialchars($_POST['motivo'], ENT_QUOTES, 'UTF-8');
        $idUsuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');
        $idTransaccion = htmlspecialchars($_POST['idTransaccion'], ENT_QUOTES, 'UTF-8');

        $modelMov = new ModeloMovimiento();
        $response = $modelMov->anularMovimiento($idTransaccion);
        if ($response == 1) {
            $consulta = $modeloMovimiento->updateMovement($motivo, $idUsuario, $idTransaccion);

            if($consulta == 1){
                $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "movimiento", "Se edito un  movimiento($idTransaccion)", $_SESSION["S_IPPUBLICA"]);
            }
            echo $consulta;
        } else {
            echo 0;
        }
        
        break;
    case 'registrarDetalleMovimiento':
        $idMovimiento = htmlspecialchars($_POST['idMovimiento'], ENT_QUOTES, 'UTF-8');
        $accion = htmlspecialchars($_POST['accion'], ENT_QUOTES, 'UTF-8');
        $producto = htmlspecialchars($_POST['producto'], ENT_QUOTES, 'UTF-8');
        $cantidad = htmlspecialchars($_POST['cantidad'], ENT_QUOTES, 'UTF-8');

        if ($accion == "editar") {
            $modeloMovimiento->deleteDetailMovement($idMovimiento);
        }
        
        $arrayProducto = explode(",", $producto);
        $arrayCantidad = explode(",", $cantidad);
        
        for ($i = 0; $i < sizeof($arrayProducto); $i++) {
            $consulta = $modeloMovimiento->registrarDetalleMovimiento($idMovimiento, $arrayProducto[$i], $arrayCantidad[$i]);
        }

        $modeloMovimiento->cerrarConexion();
        
        if ($accion == "editar") {
            if($consulta == 1){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "movimiento", "Se edito un  movimiento($idMovimiento)", $_SESSION["S_IPPUBLICA"]);
                }
        }



        echo $consulta;
        break;
    case 'anular':
        $idTransaccion = htmlspecialchars($_POST['idTransaccion'], ENT_QUOTES, 'UTF-8');        

        $consulta = $modeloMovimiento->anularMovimiento($idTransaccion);

        if($consulta == 1){
                $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Anular", "movimiento", "Se anulo un  movimiento($idTransaccion)", $_SESSION["S_IPPUBLICA"]);
            }

        echo $consulta;
        break;
    default:
        # code...
        break;
}
