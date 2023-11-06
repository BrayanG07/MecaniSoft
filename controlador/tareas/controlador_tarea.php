<?php
    require '../../modelo/modelo_tarea.php';
    require '../../modelo/modelo_bitacora.php';
    $MB = new ModeloBitacora();
    session_start();

    $modeloTarea = new ModeloTarea();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";

    switch ($opcion) {
        case 'listar':
            // session_start();
            $idUsuario = $_SESSION['S_IDUSUARIO'];
            $consulta = $modeloTarea->listarTareas($idUsuario);

            if ($consulta) {
                $data = array();
                foreach ($consulta as $row) {
                    $data[] = array(
                        'id'   => $row["id"],
                        'title'   => $row["title"],
                        'start'   => $row["start"],
                        'end'   => $row["end"],
                        'color'   => $row["color"],
                        'estado' => $row["estado"],
                        'notas' => $row["tarea_notas"],
                        'cliente' => $row["NOMBRE_CLIENTE"],
                        'vehiculo' => ($row["info_vehiculo"] == null ) ? 'Sin Información Del Vehículo': $row["info_vehiculo"]
                    );
                }

                echo json_encode($data);    
            } 
            break;
        case 'orderByClient':
            $consulta = $modeloTarea->listOrderByClient();
            echo json_encode($consulta);
            break;
        case 'listServices':
            $idTransaccion = htmlspecialchars($_POST['idTransaccion'], ENT_QUOTES, 'UTF-8');
            $consulta = $modeloTarea->listServicesByClient($idTransaccion);
            echo json_encode($consulta);
            break;

        case 'save':
            $works = htmlspecialchars($_POST['trabajos'], ENT_QUOTES, 'UTF-8');
            $start = htmlspecialchars($_POST['start'], ENT_QUOTES, 'UTF-8');
            $end = htmlspecialchars($_POST['end'], ENT_QUOTES, 'UTF-8');
            $description = htmlspecialchars($_POST['notas'], ENT_QUOTES, 'UTF-8');

            $arrayWorks = explode(",", $works); //arrayWorks = ID_DETALLETRANSACCION
            $arrayDescription = explode(",", $description);

            for ($i=0; $i < count($arrayWorks); $i++) { 
                $resp = $modeloTarea->saveTask($arrayWorks[$i], $start, $end, $arrayDescription[$i]);  
            }

             $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "tarea", "Se registro una tarea", $_SESSION["S_IPPUBLICA"]);

            echo $resp;    
            break;

        case 'updateDate':
            $idTarea = htmlspecialchars($_POST['idTarea'], ENT_QUOTES, 'UTF-8');
            $fstart = htmlspecialchars($_POST['fstart'], ENT_QUOTES, 'UTF-8');
            $fend = htmlspecialchars($_POST['fend'], ENT_QUOTES, 'UTF-8');

            $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Fecha", "tarea", "Se cambio la fecha($idTarea)", $_SESSION["S_IPPUBLICA"]);

            $consulta = $modeloTarea->updateDateSelected($idTarea, $fstart, $fend);


            echo $consulta;
            break;
        case 'updateTask':
            $idTarea = htmlspecialchars($_POST['idTarea'], ENT_QUOTES, 'UTF-8');
            $description = htmlspecialchars($_POST['description'], ENT_QUOTES, 'UTF-8');
            $state = htmlspecialchars($_POST['state'], ENT_QUOTES, 'UTF-8');
            $idUsuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');

            $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "tarea", "Se edito una tarea($idTarea)", $_SESSION["S_IPPUBLICA"]);

            $consulta = $modeloTarea->updatetask($idTarea, $description, $state, $idUsuario);
            echo $consulta;
            break;

        case 'deleteTask':
            $idDetailTra = htmlspecialchars($_POST['idDetailTra'], ENT_QUOTES, 'UTF-8');
            $consulta = $modeloTarea->deleteTask($idDetailTra);
            echo $consulta;
            break;
        
        default:
            # code...
            break;
    }
?>