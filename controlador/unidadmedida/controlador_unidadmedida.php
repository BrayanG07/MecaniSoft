<?php
    require '../../modelo/modelo_unidad_medida.php';

    $MU = new Modelo_Unidad_Medida();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";

    switch ($opcion) {
        case 'listar':
            $consulta = $MU->listarUnidadMedida();

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
            $unidad = htmlspecialchars($_POST['unidad'], ENT_QUOTES, 'UTF-8');
            $abreviatura = htmlspecialchars($_POST['abreviatura'], ENT_QUOTES, 'UTF-8');
            $consulta = $MU->registrarUnidadMedida($unidad, $abreviatura);
            echo $consulta;
            break;
        case 'editar':
            $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
            $unidadActual = htmlspecialchars($_POST['unidadActual'], ENT_QUOTES, 'UTF-8');
            $unidadNueva = htmlspecialchars($_POST['unidadNueva'], ENT_QUOTES, 'UTF-8');
            $abreviatura = htmlspecialchars($_POST['abreviatura'], ENT_QUOTES, 'UTF-8');
            $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');

            $consulta = $MU->modificarUnidadMedida($id, $unidadActual, $unidadNueva, $abreviatura, $estatus);
            echo $consulta;
            break;
        
        default:
            # code...
            break;
    }
?>