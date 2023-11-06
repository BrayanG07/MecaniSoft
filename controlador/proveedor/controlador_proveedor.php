<?php
    require '../../modelo/modelo_proveedor.php';

     require '../../modelo/modelo_bitacora.php';
    $MB = new ModeloBitacora();
    session_start();

    $MP = new Modelo_Proveedor();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";

    switch ($opcion) {
        case 'listar':
            $consulta = $MP->listarProveedor();
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
            $razonSocial = htmlspecialchars($_POST['razonSocial'], ENT_QUOTES, 'UTF-8');
            $nombreContacto = htmlspecialchars($_POST['nombreContacto'], ENT_QUOTES, 'UTF-8');
            $numeroContacto = htmlspecialchars($_POST['numeroContacto'], ENT_QUOTES, 'UTF-8');
            $apellidoPaterno = htmlspecialchars($_POST['apellidoPaterno'], ENT_QUOTES, 'UTF-8');
            $apellidoMaterno = htmlspecialchars($_POST['apellidoMaterno'], ENT_QUOTES, 'UTF-8');
            $tipoDocumento = htmlspecialchars($_POST['tipoDocumento'], ENT_QUOTES, 'UTF-8');
            $numeroDocumento = htmlspecialchars($_POST['numeroDocumento'], ENT_QUOTES, 'UTF-8');
            $sexo = htmlspecialchars(strtoupper($_POST['sexo']), ENT_QUOTES, 'UTF-8');
            $telefono = htmlspecialchars($_POST['telefono'], ENT_QUOTES, 'UTF-8');
            $correo = htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8');
            
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
            if (!preg_match($expresionLetras,trim($nombreContacto))) {
                $contador++;
                $error .= "El nombre de contacto debe contener solo letras. <br>";
            }

            //is_numeric = retorna false si el dato contiene letras
            if (!is_numeric($numeroDocumento)) {
                $contador++;
                $error .= "El numero de documento debe contener solo numeros. <br>";
            }

            if (!is_numeric($numeroContacto)) {
                $contador++;
                $error .= "El numero de contacto debe contener solo numeros. <br>";
            }

            if ($contador > 0) { //Es porque hay un error
                echo $error;
            } else {
                $consulta = $MP->registrarProveedor($nombre, $apellidoPaterno, $apellidoMaterno,$tipoDocumento,$numeroDocumento,$sexo,$telefono, $razonSocial, $nombreContacto, $numeroContacto, $correo);

                if($consulta > 0){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "proveedor", "Se registro un nuevo proveedor", $_SESSION["S_IPPUBLICA"]);
                 }


                echo $consulta;
            }
            break;
        case 'estatus':
            $idProveedor = htmlspecialchars($_POST['idProveedor'], ENT_QUOTES, 'UTF-8');
            $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');
            
            $consulta = $MP->editarEstatusProveedor($idProveedor, $estatus);

                if($consulta > 0){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "proveedor", "Se edito  un  proveedor($idProveedor)", $_SESSION["S_IPPUBLICA"]);
                 }


            echo $consulta;
            break;
        case 'editar':
            $expresionLetras = '/^(?!-+)[a-zA-Z-ñáéíóúÁÉÍÓÚ\s]*$/';
            $error = "";
            $contador = 0;

            /*CAPTURANDO LA DATA ENVIADA POR MEDIO DE AJAX*/
            $idProveedor = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
            $idPersona = htmlspecialchars($_POST['idPersona'], ENT_QUOTES, 'UTF-8');
            $razonSocial = htmlspecialchars($_POST['razonSocial'], ENT_QUOTES, 'UTF-8');
            $nombreContacto = htmlspecialchars($_POST['nombreContacto'], ENT_QUOTES, 'UTF-8');
            $numeroContacto = htmlspecialchars($_POST['numeroContacto'], ENT_QUOTES, 'UTF-8');
            $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
            $apellidoPaterno = htmlspecialchars($_POST['apellidoPaterno'], ENT_QUOTES, 'UTF-8');
            $apellidoMaterno = htmlspecialchars($_POST['apellidoMaterno'], ENT_QUOTES, 'UTF-8');
            $correo = htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8');
            $numeroDocumento = htmlspecialchars($_POST['numeroDocumento'], ENT_QUOTES, 'UTF-8');
            $telefono = htmlspecialchars($_POST['telefono'], ENT_QUOTES, 'UTF-8');
            $tipoDocumento = htmlspecialchars($_POST['tipoDocumento'], ENT_QUOTES, 'UTF-8');
            $genero = htmlspecialchars($_POST['genero'], ENT_QUOTES, 'UTF-8');
            
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
            if (!preg_match($expresionLetras,trim($nombreContacto))) {
                $contador++;
                $error .= "El nombre de contacto debe contener solo letras. <br>";
            }

            if (!is_numeric($numeroContacto)) {
                $contador++;
                $error .= "El numero de contacto debe contener solo numeros. <br>";
            }
            if (!is_numeric($numeroDocumento)) {
                $contador++;
                $error .= "El numero de documente debe contener solo numeros. <br>";
            }

            if ($contador > 0) { //Es porque hay un error
                echo $error;
            } else {
                $consulta = $MP->editarProveedor($idProveedor, $razonSocial, $nombreContacto,$numeroContacto, $nombre, $apellidoPaterno, $apellidoMaterno,$correo,$numeroDocumento, $telefono, $tipoDocumento,$genero, $idPersona);
                if($consulta > 0){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "proveedor", "Se edito  un  proveedor($idProveedor)", $_SESSION["S_IPPUBLICA"]);
                 }

                echo $consulta;
            }
            break;
        
        default:
            # code...
            break;
    }
?>