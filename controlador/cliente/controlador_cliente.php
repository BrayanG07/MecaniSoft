<?php
    require '../../modelo/modelo_cliente.php';
    require '../../modelo/modelo_bitacora.php';

    session_start();

    $MB = new ModeloBitacora();

    $MC = new Modelo_Cliente();

    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";
    
    switch ($opcion) {
        case 'listar':
            $consulta = $MC->listarCliente();

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
            $expresionLetras = '/^(?!-+)[a-zA-Z-ñáéíóúÁÉÍÓÚ\s]*$/';
            $error = "";
            $contador = 0;

            /*CAPTURANDO LA DATA ENVIADA POR MEDIO DE AJAX*/
            $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
            $apellidoPaterno = htmlspecialchars($_POST['apellidoPaterno'], ENT_QUOTES, 'UTF-8');
            $apellidoMaterno = htmlspecialchars($_POST['apellidoMaterno'], ENT_QUOTES, 'UTF-8');
            $tipoDocumento = htmlspecialchars($_POST['tipoDocumento'], ENT_QUOTES, 'UTF-8');
            $numeroDocumento = htmlspecialchars($_POST['numeroDocumento'], ENT_QUOTES, 'UTF-8');
            $sexo = htmlspecialchars(strtoupper($_POST['sexo']), ENT_QUOTES, 'UTF-8');
            $telefono = htmlspecialchars($_POST['telefono'], ENT_QUOTES, 'UTF-8');
            $correo = htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8');
            $empresa = htmlspecialchars($_POST['empresa'], ENT_QUOTES, 'UTF-8');
            $usuarioLog = htmlspecialchars($_POST['usuarioLog'], ENT_QUOTES, 'UTF-8');
            
            
            //ctype_alpha() = retorna verdadero si el dato solo tiene letras
            if (!preg_match($expresionLetras, $nombre)) {
                $contador++;
                $error .= "El nombre debe contener solo letras. <br>";
            }
            if (!preg_match($expresionLetras,trim($apellidoPaterno))) {
                $contador++;
                $error .= "El apellido paterno debe contener solo letras. <br>";
            }
            if (!preg_match($expresionLetras,trim($apellidoMaterno))) {
                $contador++;
                $error .= "El apellido materno debe contener solo letras. <br>";
            }

            //is_numeric = retorna false si el dato contiene letras
            if (!is_numeric($numeroDocumento)) {
                $contador++;
                $error .= "El numero de documento debe contener solo numeros. <br>";
            }

            if ($contador > 0) { 
                echo $error;
            } else {
                
                $consulta = $MC->registrarCliente($nombre, $apellidoPaterno, $apellidoMaterno,$tipoDocumento,$numeroDocumento,$sexo,$telefono, $correo, $empresa);
                
                
                 if($consulta == 1){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "cliente", "Se registro un nuevo cliente($numeroDocumento)",$_SESSION["S_IPPUBLICA"] );
                }
                
                
                echo $consulta;//Retornaremos 0 - 1, es lo que contendra la variable consulta
            }
            break;
        case 'estatus':
            $idCliente = htmlspecialchars($_POST['idCliente'], ENT_QUOTES, 'UTF-8');
            $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');
            $usuarioLog = htmlspecialchars($_POST['usuarioLog'], ENT_QUOTES, 'UTF-8');
            
            $consulta = $MC->editarEstatusCliente($idCliente, $estatus);

              if($consulta == 1){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "cliente", "Se cambio el estado del  cliente($idCliente)($estatus)",$_SESSION['S_IPPUBLICA']);
                    }

            echo $consulta;
            break;

        case 'editar':
            $expresionLetras = '/^(?!-+)[a-zA-Z-ñáéíóúÁÉÍÓÚ\s]*$/';
            $error = "";
            $contador = 0;

            /*CAPTURANDO LA DATA ENVIADA POR MEDIO DE AJAX*/
            $idPersona = htmlspecialchars($_POST['idPersona'], ENT_QUOTES, 'UTF-8');
            $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
            $apellidoPaterno = htmlspecialchars($_POST['apellidoPaterno'], ENT_QUOTES, 'UTF-8');
            $apellidoMaterno = htmlspecialchars($_POST['apellidoMaterno'], ENT_QUOTES, 'UTF-8');
            $correo = htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8');
            $numeroDocumento = htmlspecialchars($_POST['numeroDocumento'], ENT_QUOTES, 'UTF-8');
            $telefono = htmlspecialchars($_POST['telefono'], ENT_QUOTES, 'UTF-8');
            $tipoDocumento = htmlspecialchars($_POST['tipoDocumento'], ENT_QUOTES, 'UTF-8');
            $genero = htmlspecialchars($_POST['genero'], ENT_QUOTES, 'UTF-8');
            $empresa = htmlspecialchars($_POST['empresa'], ENT_QUOTES, 'UTF-8');

            $usuarioLog = htmlspecialchars($_POST['usuarioLog'], ENT_QUOTES, 'UTF-8');
            
            if (!preg_match($expresionLetras,trim($nombre))) {
                $contador++;
                $error .= "El nombre debe contener solo letras. <br>";
            }
            if (!preg_match($expresionLetras,trim($apellidoPaterno))) {
                $contador++;
                $error .= "El apellido paterno debe contener solo letras. <br>";
            }
            if (!preg_match($expresionLetras,trim($apellidoMaterno))) {
                $contador++;
                $error .= "El apellido materno debe contener solo letras. <br>";
            }


            if (!is_numeric($numeroDocumento)) {
                $contador++;
                $error .= "El numero de documente debe contener solo numeros. <br>";
            }

            if ($contador > 0) { //Es porque hay un error
                echo $error;
            } else {
                $consulta = $MC->editarCliente($nombre, $apellidoPaterno, $apellidoMaterno,$correo,$numeroDocumento, $telefono, $tipoDocumento,$genero, $idPersona, $empresa);
                
                     if($consulta == 1){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "cliente", "Se edito un  cliente($numeroDocumento)", $_SESSION['S_IPPUBLICA']);
                    }
                
                echo $consulta;
            }
            break;
        
        default:
            # code...
            break;
    }
?>