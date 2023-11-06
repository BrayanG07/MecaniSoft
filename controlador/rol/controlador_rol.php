<?php
    require '../../modelo/modelo_rol.php';

    $MR = new Modelo_Rol();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";

    switch ($opcion) {
        case 'listar':
            $consulta = $MR->listarRol();

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
            $rol = htmlspecialchars($_POST['rol'], ENT_QUOTES, 'UTF-8');
            $consulta = $MR->registrarRol($rol);
            echo $consulta;
            break;
        case 'editar':
            $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
            $rolActual = htmlspecialchars($_POST['rolactual'], ENT_QUOTES, 'UTF-8');
            $rolNuevo = htmlspecialchars($_POST['rolnuevo'], ENT_QUOTES, 'UTF-8');
            $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');

            $consulta = $MR->modificarRol($id, $rolActual, $rolNuevo, $estatus);
            echo $consulta;
            break;
        
        default:
            # code...
            break;
    }
?>