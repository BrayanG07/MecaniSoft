<?php
    require '../../modelo/modelo_acceso.php';
    require '../../modelo/modelo_bitacora.php';

    session_start();

    $MR = new ModeloAcceso();
    $MB = new ModeloBitacora();

    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";

    switch ($opcion) {
        case 'listarAccesosUsuario':
             $idUsuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');

             $consulta = $MR->listarAccesoUsuario($idUsuario);

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

            case 'listarAccesosUsuarioNoTiene':
             $idUsuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');

             $consulta = $MR->listarAccesoUsuarioNoTiene($idUsuario);

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

        case 'registrar':
            $usuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');
            $modulo = htmlspecialchars($_POST['idModulo'], ENT_QUOTES, 'UTF-8');
            $usuarioLog = htmlspecialchars($_POST['usuarioLog'], ENT_QUOTES, 'UTF-8');

            $arrayModulo = explode(",", $modulo);
            for ($i=0; $i < sizeof($arrayModulo); $i++) { 
                $consulta = $MR->registrarAcceso($usuario, $arrayModulo[$i]);
                
            } 
            
            $MR->cerrarConexion();

            if($consulta == 1){
                for ($i=0; $i < sizeof($arrayModulo); $i++) { 
                    $bita =  $MB->registrarBitacoraAcceso($_SESSION['S_IDUSUARIO'], "Registrar", "accesos", "Se registro un acceso(".$arrayModulo[$i]."), en el usuario ($usuario)",$_SESSION["S_IPPUBLICA"]);
                }   
                $MB->cerrarConexion(); 
            }

            echo $consulta;
            break;

         case 'eliminar':
            $usuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');
            $modulo = htmlspecialchars($_POST['idModulo'], ENT_QUOTES, 'UTF-8');

            $usuarioLog = htmlspecialchars($_POST['usuarioLog'], ENT_QUOTES, 'UTF-8');


            $consulta = $MR->eliminarAcceso($usuario, $modulo);

             if($consulta == 1){
                $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Eliminar", "accesos", "Se elimino un acceso($modulo), en el usuario ($usuario)",$_SESSION["S_IPPUBLICA"]);
            }

            echo $consulta;
            break;    

        case 'editar':
            $usuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');
            $modulo = htmlspecialchars($_POST['idModulo'], ENT_QUOTES, 'UTF-8');
            $usuarioLog = htmlspecialchars($_POST['usuarioLog'], ENT_QUOTES, 'UTF-8');


            $consulta = $MR->editarAcceso($usuario, $modulo);

            if($consulta == 1){
                $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "accesos", "Se edito un acceso($modulo), en el usuario ($usuario)",$_SESSION["S_IPPUBLICA"]);
            }

            echo $consulta;
            break;
        
        default:
            # code...
            break;
    }
?>