<?php
    require '../../modelo/modelo_isv.php';

    $MR = new Modelo_ISV();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";

    switch ($opcion) {
        case 'listar':

            $consulta = $MR->listarImpuesto();
            echo $consulta;
            
            break;
        
        
        default:
            # code...
            break;
    }
?>