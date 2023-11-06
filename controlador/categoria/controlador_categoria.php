<?php
    require '../../modelo/modelo_categoria.php';

    $MC = new Modelo_Categoria();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";
    
    switch ($opcion) {
        case 'listar':
            $consulta = $MC->listarCategoria();
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
            $categoria = htmlspecialchars($_POST['categoria'], ENT_QUOTES, 'UTF-8');        
            $consulta = $MC->registrarCategoria($categoria);
            echo $consulta;
            break;
        case 'editar':
            $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
            $categoriaActual = htmlspecialchars($_POST['categoriaActual'], ENT_QUOTES, 'UTF-8');
            $categoriaNueva = htmlspecialchars($_POST['categoriaNueva'], ENT_QUOTES, 'UTF-8');
            $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');

            $consulta = $MC->modificarCategoria($id, $categoriaActual, $categoriaNueva, $estatus);
            echo $consulta;
            break;        
        default:
            # code...
            break;
    }
?>