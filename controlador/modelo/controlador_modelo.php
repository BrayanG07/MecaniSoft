<?php
    require '../../modelo/modelo_modelo.php';

    $MM = new ModeloModelo();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";
    
    switch ($opcion) {
        case 'listar':
            $consulta = $MM->listarModelo();
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
            $modelo = htmlspecialchars($_POST['modelo'], ENT_QUOTES, 'UTF-8');        
            $idmarca = htmlspecialchars($_POST['idmarca'], ENT_QUOTES, 'UTF-8');        
            $descripcion = htmlspecialchars($_POST['descripcion'], ENT_QUOTES, 'UTF-8');        
            $estado = htmlspecialchars($_POST['estado'], ENT_QUOTES, 'UTF-8');        
            $usuario = htmlspecialchars($_POST['usuario'], ENT_QUOTES, 'UTF-8');        
            
             $consulta = $MM->registrarModelo($usuario, $modelo, $descripcion, $estado, $idmarca);
            echo $consulta;
            break;

            case 'editar':
                $idmodelo = htmlspecialchars($_POST['idmodelo'], ENT_QUOTES, 'UTF-8');
                $modeloActual = htmlspecialchars($_POST['modeloActual'], ENT_QUOTES, 'UTF-8');
                $modeloNuevo = htmlspecialchars($_POST['modeloNuevo'], ENT_QUOTES, 'UTF-8');
                $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');
                $descripcion = htmlspecialchars($_POST['descripcion'], ENT_QUOTES, 'UTF-8');   
                $idmarca = htmlspecialchars($_POST['idmarca'], ENT_QUOTES, 'UTF-8');   
                $usuario = htmlspecialchars($_POST['usuario'], ENT_QUOTES, 'UTF-8');        
                
                $consulta = $MM->modificarModelo($usuario, $idmodelo, $modeloActual, $modeloNuevo, $estatus, $descripcion, $idmarca);
                
                echo $consulta;
                break;        
                
                case 'listarComboModeloMarca':
                    $idmarca = htmlspecialchars($_POST['idmarca'], ENT_QUOTES, 'UTF-8');
                    $consulta = $MM->listarComboModeloMarca($idmarca);
                    echo json_encode($consulta);
                break;

             
        default:
            # code...
            break;
    }
?>