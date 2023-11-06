<?php
    require '../../modelo/modelo_marca.php';

    $MM = new ModeloMarca();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";
    
    switch ($opcion) {
        case 'listar':
            $consulta = $MM->listarMarca();
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
            $marca = htmlspecialchars($_POST['marca'], ENT_QUOTES, 'UTF-8');        
            $descripcion = htmlspecialchars($_POST['descripcion'], ENT_QUOTES, 'UTF-8');        
            $estado = htmlspecialchars($_POST['estado'], ENT_QUOTES, 'UTF-8');        
            $usuario = htmlspecialchars($_POST['usuario'], ENT_QUOTES, 'UTF-8');        
            
            $consulta = $MM->registrarMarca($usuario, $marca, $descripcion, $estado);
            echo $consulta;
            break;

            case 'editar':
                $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
                $marcaActual = htmlspecialchars($_POST['marcaActual'], ENT_QUOTES, 'UTF-8');
                $marcaNuevo = htmlspecialchars($_POST['marcaNuevo'], ENT_QUOTES, 'UTF-8');
                $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');
                $descripcion = htmlspecialchars($_POST['descripcion'], ENT_QUOTES, 'UTF-8');   
                
                $usuario = htmlspecialchars($_POST['usuario'], ENT_QUOTES, 'UTF-8');        
            $consulta = $MM->modificarMarca($usuario, $id, $marcaActual, $marcaNuevo, $estatus, $descripcion);
            echo $consulta;
            break;        


            case 'listarComboMarca':
                $consulta = $MM->listarComboMarca();
                echo json_encode($consulta);
            break;
        default:
            # code...
            break;
    }
