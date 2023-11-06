<?php
    require '../../modelo/modelo_configuracion.php';
    
    $MP = new Modelo_Configuracion();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";

    switch ($opcion) {
        case 'listar':
            $consulta = $MP->listarConfiguracion();
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
            $error = "";
            $contador = 0;

            $nombre = htmlspecialchars(trim($_POST['conf_nombre_empresa']), ENT_QUOTES, 'UTF-8');
            $direccion = htmlspecialchars($_POST['conf_direccion'], ENT_QUOTES, 'UTF-8');
            $telefono = htmlspecialchars($_POST['conf_telefono'], ENT_QUOTES, 'UTF-8');
            $celular = htmlspecialchars($_POST['conf_celular'], ENT_QUOTES, 'UTF-8');
            $rtn = htmlspecialchars(trim($_POST['conf_rtn']), ENT_QUOTES, 'UTF-8');
            $correo = htmlspecialchars($_POST['conf_correo'], ENT_QUOTES, 'UTF-8');
            $isv = htmlspecialchars($_POST['conf_isv'], ENT_QUOTES, 'UTF-8');
            $nombreArchivo = htmlspecialchars($_POST['nombreArchivo'], ENT_QUOTES, 'UTF-8');
            $cai = htmlspecialchars($_POST['conf_cai'], ENT_QUOTES, 'UTF-8');
            $fecha = htmlspecialchars($_POST['conf_fact_fechalimite_emision'], ENT_QUOTES, 'UTF-8');
            $cantidadFacturas = htmlspecialchars($_POST['conf_cantidad_fact'], ENT_QUOTES, 'UTF-8');
            $numeroInicial = htmlspecialchars($_POST['conf_numero_inicial'], ENT_QUOTES, 'UTF-8');
            $numeroFinal = htmlspecialchars($_POST['conf_numero_final'], ENT_QUOTES, 'UTF-8');
            $dolar = htmlspecialchars($_POST['conf_preciodolar'], ENT_QUOTES, 'UTF-8');
            

            if (!is_numeric($isv)) {
                $contador++;
                $error .= "El isv debe contener solo numeros. <br>";
            }
            if (!is_numeric($dolar)) {
                $contador++;
                $error .= "El dolar debe contener solo numeros. <br>";
            }
            if (!is_numeric($cantidadFacturas)) {
                $contador++;
                $error .= "Cantidad Facturas debe contener solo numeros. <br>";
            }

            if ($contador > 0) {
                echo $error;
            } else {
                if (is_array($_FILES) && count($_FILES) > 0) {//Validar que el input tiene datos
                    if (move_uploaded_file($_FILES['foto']['tmp_name'], "../../MPDF/img/".$nombreArchivo)) {
                        $ruta = 'img/'.$nombreArchivo;
                        $consulta = $MP->registrarConfiguracion($nombre,$direccion,$telefono,$celular,$rtn,$correo,$ruta,$isv,$cai,$fecha
                                                                ,$cantidadFacturas,$numeroInicial,$numeroFinal,$dolar);
                        echo $consulta;                     
                    }else {
                        echo 0;
                    }
                } else {
                    $ruta = 'controlador/configuracion/img/configuracion_default.jpg';
                    $consulta = $MP->registrarConfiguracion($nombre,$direccion,$telefono,$celular,$rtn,$correo,$ruta,$isv,$cai,$fecha
                                                        ,$cantidadFacturas,$numeroInicial,$numeroFinal,$dolar);
                    echo $consulta;
                }   
            }
            break;
        case 'editar':
            $error = "";
            $contador = 0;

            $id = htmlspecialchars(trim($_POST['idConfiguracion']), ENT_QUOTES, 'UTF-8');
            $nombre = htmlspecialchars(trim($_POST['nombre']), ENT_QUOTES, 'UTF-8');
            $direccion = htmlspecialchars($_POST['direccion'], ENT_QUOTES, 'UTF-8');
            $telefono = htmlspecialchars($_POST['telefono'], ENT_QUOTES, 'UTF-8');
            $celular = htmlspecialchars($_POST['celular'], ENT_QUOTES, 'UTF-8');
            $rtn = htmlspecialchars(trim($_POST['rtn']), ENT_QUOTES, 'UTF-8');
            $correo = htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8');
            $isv = htmlspecialchars($_POST['isv'], ENT_QUOTES, 'UTF-8');
           
            $cai = htmlspecialchars($_POST['cai'], ENT_QUOTES, 'UTF-8');
            $fecha = htmlspecialchars($_POST['fecha'], ENT_QUOTES, 'UTF-8');
            $cantidadFacturas = htmlspecialchars($_POST['cantidadFacturas'], ENT_QUOTES, 'UTF-8');
            $numeroInicial = htmlspecialchars($_POST['numeroInicial'], ENT_QUOTES, 'UTF-8');
            $numeroFinal = htmlspecialchars($_POST['numeroFinal'], ENT_QUOTES, 'UTF-8');
            $dolar = htmlspecialchars($_POST['dolar'], ENT_QUOTES, 'UTF-8');    
            

            //is_numeric = retorna false si el dato contiene letras
            if (!is_numeric($isv)) {
                $contador++;
                $error .= "El isv debe contener solo numeros. <br>";
            }
            if (!is_numeric($dolar)) {
                $contador++;
                $error .= "El dolar debe contener solo numeros. <br>";
            }
            if (!is_numeric($cantidadFacturas)) {
                $contador++;
                $error .= "Cantidad Facturas debe contener solo numeros. <br>";
            }

            if ($contador > 0) {
                echo $error;
            } else {    
                $consulta = $MP->editarConfiguracion($id, $nombre,$direccion,$telefono,$celular,$rtn,$correo,$isv,$cai,$fecha
                                                    ,$cantidadFacturas,$numeroInicial,$numeroFinal,$dolar);
                echo $consulta;
            }
            break;
        case 'editarFoto':
            $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
            $nombreArchivo = htmlspecialchars($_POST['nombreArchivo'], ENT_QUOTES, 'UTF-8');

            if (is_array($_FILES) && count($_FILES) > 0) {//Validar que el input tiene datos
                if (move_uploaded_file($_FILES['foto']['tmp_name'], "../../MPDF/img/".$nombreArchivo)) {
                    $ruta = 'img/'.$nombreArchivo;
                    $consulta = $MP->editarFotoConfiguracion($id, $ruta);
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