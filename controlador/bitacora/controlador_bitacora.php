<?php
    require '../../modelo/modelo_bitacora.php';
    $MB = new ModeloBitacora();
    session_start();


    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";
    switch ($opcion) {
        case 'listar':
            $fechaInicio = htmlspecialchars($_POST['fechaInicio'], ENT_QUOTES, 'UTF-8');
            $fechaFin = htmlspecialchars($_POST['fechaFin'], ENT_QUOTES, 'UTF-8');
            $consulta = $MB->listarBitacora($fechaInicio, $fechaFin);
            
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

        default:
            # code...
            break;
    }
