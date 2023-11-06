<?php
    require '../../modelo/modelo_fabricante.php';

    $MC = new ModeloFabricante();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";
    
    switch ($opcion) {
        case 'listar':
            $consulta = $MC->listarFabricante();
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
            $fabricante = htmlspecialchars($_POST['fabricante'], ENT_QUOTES, 'UTF-8');        
            $descripcion = htmlspecialchars($_POST['descripcion'], ENT_QUOTES, 'UTF-8');        
            $consulta = $MC->registrarFabricante($fabricante, $descripcion);
            echo $consulta;
            break;
        case 'editar':
            $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
            $fabricanteActual = htmlspecialchars($_POST['fabricanteActual'], ENT_QUOTES, 'UTF-8');
            $fabricanteNuevo = htmlspecialchars($_POST['fabricanteNuevo'], ENT_QUOTES, 'UTF-8');
            $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');
            $descripcion = htmlspecialchars($_POST['descripcion'], ENT_QUOTES, 'UTF-8');   

            $consulta = $MC->modificarFabricante($id, $fabricanteActual, $fabricanteNuevo, $estatus, $descripcion);
            echo $consulta;
            break;        
        default:
            # code...
            break;
    }
?>