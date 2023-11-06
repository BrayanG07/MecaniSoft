<?php
    require '../../modelo/modelo_vehiculo.php';

    require '../../modelo/modelo_bitacora.php';
    $MB = new ModeloBitacora();
    session_start();
    
    $MV = new ModeloVehiculo();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";

    switch ($opcion) {
        case 'listar':
            $consulta = $MV->listarVehiculo();
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
        case 'listByClient':
            $idCliente = htmlspecialchars($_POST['idCliente'], ENT_QUOTES, 'UTF-8');
            $consulta = $MV->listCarByIdClient($idCliente);
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

            $placa = htmlspecialchars(trim($_POST['placa']), ENT_QUOTES, 'UTF-8');
            $combustible = htmlspecialchars(trim($_POST['combustible']), ENT_QUOTES, 'UTF-8');
            $transmicion = htmlspecialchars(trim($_POST['transmicion']), ENT_QUOTES, 'UTF-8');
            $marca = htmlspecialchars(trim($_POST['marca']), ENT_QUOTES, 'UTF-8');
            $modelo = htmlspecialchars(trim($_POST['modelo']), ENT_QUOTES, 'UTF-8');
            $anio = htmlspecialchars(trim($_POST['anio']), ENT_QUOTES, 'UTF-8');
            $nchasis = htmlspecialchars(trim($_POST['nchasis']), ENT_QUOTES, 'UTF-8');
            $nmotor = htmlspecialchars(trim($_POST['nmotor']), ENT_QUOTES, 'UTF-8');
            $nombreArchivo = htmlspecialchars(trim($_POST['nombreArchivo']), ENT_QUOTES, 'UTF-8');
            $tipo = htmlspecialchars(trim($_POST['tipo']), ENT_QUOTES, 'UTF-8');
            $cliente = htmlspecialchars(trim($_POST['cliente']), ENT_QUOTES, 'UTF-8');
            $descripcion = htmlspecialchars(trim($_POST['descripcion']), ENT_QUOTES, 'UTF-8');

            $error = "";
            $contador = 0;



            //is_numeric = retorna false si el dato contiene letras
            if (!is_numeric($anio)) {
                $contador++;
                $error .= "El año  debe contener solo numeros. <br>";
            }

            // if (!is_numeric($precioCompra)) {
            //     $contador++;
            //     $error .= "El precio compra debe contener solo numeros. <br>";
            // }

            if ($contador > 0) {
                echo $error;
            } else {
                if (is_array($_FILES) && count($_FILES) > 0) {//Validar que el input tiene datos
                    if (move_uploaded_file($_FILES['foto']['tmp_name'], "img/".$nombreArchivo)) {
                        $ruta = 'controlador/vehiculo/img/'.$nombreArchivo;
                        $consulta = $MV->registrarVehiculo($placa, $anio, $transmicion, $combustible, $nchasis, $nmotor, $descripcion, $ruta, $tipo, $modelo, $cliente);
                        
                        if($consulta > 0){
                            $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "vehiculo", "Se registro un nuevo vehiculo", $_SESSION["S_IPPUBLICA"]);
                        }
                        
                        echo $consulta;
                    }else {
                        echo 0;
                    }
                } else {
                    $ruta = 'controlador/vehiculo/img/vehiculo_default.png';

                    $consulta = $MV->registrarVehiculo($placa, $anio, $transmicion, $combustible, $nchasis, $nmotor, $descripcion, $ruta, $tipo, $modelo, $cliente);
                    
                    if($consulta > 0){
                            $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "vehiculo", "Se registro un nuevo vehiculo", $_SESSION["S_IPPUBLICA"]);
                        }
                    
                    echo $consulta;
                }   
            }
            break;

        case 'editar':

            $idVehiculo = htmlspecialchars(trim($_POST['idVehiculo']), ENT_QUOTES, 'UTF-8');
            $placaN = htmlspecialchars(trim($_POST['placaNueva']), ENT_QUOTES, 'UTF-8');
            $placaA = htmlspecialchars(trim($_POST['placaActual']), ENT_QUOTES, 'UTF-8');
            $combustible = htmlspecialchars(trim($_POST['combustible']), ENT_QUOTES, 'UTF-8');
            $transmicion = htmlspecialchars(trim($_POST['transmicion']), ENT_QUOTES, 'UTF-8');
            $modelo = htmlspecialchars(trim($_POST['modelo']), ENT_QUOTES, 'UTF-8');
            $anio = htmlspecialchars(trim($_POST['anio']), ENT_QUOTES, 'UTF-8');
            $chasis = htmlspecialchars(trim($_POST['nchasis']), ENT_QUOTES, 'UTF-8');
            $motor = htmlspecialchars(trim($_POST['nmotor']), ENT_QUOTES, 'UTF-8');
            $tipo = htmlspecialchars(trim($_POST['tipo']), ENT_QUOTES, 'UTF-8');
            $cliente = htmlspecialchars(trim($_POST['cliente']), ENT_QUOTES, 'UTF-8');
            $descripcion = htmlspecialchars(trim($_POST['descripcion']), ENT_QUOTES, 'UTF-8');
            $estado = htmlspecialchars(trim($_POST['estado']), ENT_QUOTES, 'UTF-8');

            $error = "";
            $contador = 0;



            //is_numeric = retorna false si el dato contiene letras
            if (!is_numeric($anio)) {
                $contador++;
                $error .= "El año  debe contener solo numeros. <br>";
            }



            if ($contador > 0) {
                echo $error;
            } else {    
                $consulta = $MV->editarVehiculo($idVehiculo, $placaN, $placaA, $anio, $transmicion, $combustible, $chasis, $motor, $descripcion, $tipo, $estado, $modelo, $cliente);
                if($consulta > 0){
                            $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "vehiculo", "Se edito un  vehiculo($idVehiculo)", $_SESSION["S_IPPUBLICA"]);
                        }
                echo $consulta;
            }
            break;

        case 'editarFoto':
            $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
            $nombreArchivo = htmlspecialchars($_POST['nombreArchivo'], ENT_QUOTES, 'UTF-8');

            if (is_array($_FILES) && count($_FILES) > 0) {//Validar que el input tiene datos
                if (move_uploaded_file($_FILES['foto']['tmp_name'], "img/".$nombreArchivo)) {
                    $ruta = 'controlador/vehiculo/img/'.$nombreArchivo;
                    $consulta = $MV->editarFotoVehiculo($id, $ruta);
                    if($consulta > 0){
                            $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "vehiculo", "Se edito un  vehiculo($id)", $_SESSION["S_IPPUBLICA"]);
                        }
                    echo $consulta;
                }else {
                    echo 0;
                }
            } else {
                echo 0;
            }
            break;


        default:
            # code...
            break;
    }

    function existeCodigo() {

    }
?>