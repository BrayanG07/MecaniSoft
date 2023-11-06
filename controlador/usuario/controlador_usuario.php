<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../../modelo/modelo_usuario.php';
require '../../modelo/modelo_acceso.php';
require '../../modelo/modelo_bitacora.php';

require '../PHPMailer/Exception.php';
require '../PHPMailer/PHPMailer.php';
require '../PHPMailer/SMTP.php';

session_start();

$MB = new ModeloBitacora();
$MU = new Modelo_Usuario();
$MA = new ModeloAcceso();
$opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";

function newPassword($longitud) {
    $str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
    $password = "";
    for ($i = 0; $i < $longitud; $i++) {
        $password .= substr($str, rand(0, 62), 1);
    }
    return $password;
}

switch ($opcion) {
    case 'verificarUsuario':

        $usuario = htmlspecialchars($_POST['usuario_ajax'], ENT_QUOTES, 'UTF-8'); //u = es la variable que mando desde Ajax, contiene el valor del input de usuario
        $password = htmlspecialchars($_POST['password_ajax'], ENT_QUOTES, 'UTF-8'); //P = es la variable que mando desde Ajax, contiene el valor del input de usuario

        $consulta = $MU->verificarUsuario($usuario, $password);
        $data = json_encode($consulta);

        // print_r($data);

        if (count($consulta) > 0) { //Si tiene datos
            echo  $data;
        } else {
            echo 0;
        }
        break;
    case 'crearSesion':
        $IDUSUARIO = $_POST['idusuario'];
        $USUARIO = $_POST['usuario'];
        $ROL = $_POST['rol'];

        $accesos = [];
        $accesos = $MA->listarAccesoActivosUsuario($IDUSUARIO);

                $client  = @$_SERVER['HTTP_CLIENT_IP'];
			    $forward = @$_SERVER['HTTP_X_FORWARDED_FOR'];
			    $remote  = $_SERVER['REMOTE_ADDR'];

			    if(filter_var($client, FILTER_VALIDATE_IP))
			    {
			        $ip = $client;
			    }
			    elseif(filter_var($forward, FILTER_VALIDATE_IP))
			    {
			        $ip = $forward;
			    }
			    else
			    {
			        $ip = $remote;
			    }
			    $_SESSION["S_IPPUBLICA"]=$ip;
        
        $_SESSION['S_IDUSUARIO'] = $IDUSUARIO;
        $_SESSION['S_USUARIO'] = $USUARIO;
        $_SESSION['S_ROL'] = $ROL;
        $_SESSION['S_ACCESOS'] = $accesos;

        $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Login", "", "El usuario inicio sesion",  $_SESSION["S_IPPUBLICA"]);
        break;
    case 'listar':
        $consulta = $MU->listarUsuarios();

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
    case 'listByMechanic':
        $consulta = $MU->listUserByMechanic();

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
    case 'listarComboPersona':
        $consulta = $MU->listarComboPersona();
        echo json_encode($consulta);
        break;
    case 'listarComboRol':
        $consulta = $MU->listarComboRol();
        echo json_encode($consulta);
        break;
    case 'registrar':
        $usuario = htmlspecialchars(trim($_POST['usuario']), ENT_QUOTES, 'UTF-8');
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT, ['cost' => 10]);
        $email = htmlspecialchars(trim($_POST['email']), ENT_QUOTES, 'UTF-8');
        $idRol = htmlspecialchars($_POST['idRol'], ENT_QUOTES, 'UTF-8');
        $nombreArchivo = htmlspecialchars($_POST['nombreArchivo'], ENT_QUOTES, 'UTF-8');

        $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
        $apellidoPaterno = htmlspecialchars(trim($_POST['apellidoPaterno']), ENT_QUOTES, 'UTF-8');
        $apellidoMaterno = htmlspecialchars($_POST['apellidoMaterno'], ENT_QUOTES, 'UTF-8');
        $tipoDocumento = htmlspecialchars($_POST['tipoDocumento'], ENT_QUOTES, 'UTF-8');
        $numeroDocumento = htmlspecialchars($_POST['numeroDocumento'], ENT_QUOTES, 'UTF-8');
        $telefono = htmlspecialchars($_POST['telefono'], ENT_QUOTES, 'UTF-8');
        $genero = htmlspecialchars($_POST['genero'], ENT_QUOTES, 'UTF-8');

        if (is_array($_FILES) && count($_FILES) > 0) { //Validar que el input tiene datos
            if (move_uploaded_file($_FILES['foto']['tmp_name'], "img/" . $nombreArchivo)) {
                $ruta = 'controlador/usuario/img/' . $nombreArchivo;
                $consulta = $MU->registrarUsuario($usuario, $password, $email, $idRol, $ruta, $nombre, $apellidoPaterno, $apellidoMaterno, $tipoDocumento, $numeroDocumento, $genero, $telefono);
                $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "usuario", "Se registro usuario",  $_SESSION["S_IPPUBLICA"]);
                echo $consulta;
            } else {
                echo 0;
            }
        } else {
            $ruta = 'controlador/usuario/img/user_default.png';
            $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "usuario", "Se registro usuario",  $_SESSION["S_IPPUBLICA"]);
            $consulta = $MU->registrarUsuario($usuario, $password, $email, $idRol, $ruta, $nombre, $apellidoPaterno, $apellidoMaterno, $tipoDocumento, $numeroDocumento, $genero, $telefono);
            echo $consulta;
        }
        break;
    case 'editar':
        $id = htmlspecialchars(trim($_POST['id']), ENT_QUOTES, 'UTF-8');
        $idPersona = htmlspecialchars(trim($_POST['idPersona']), ENT_QUOTES, 'UTF-8');
        $idRol = htmlspecialchars($_POST['idRol'], ENT_QUOTES, 'UTF-8');
        $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');

        $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "usuario", "Se edito usuario($id)",  $_SESSION["S_IPPUBLICA"]);
        $ruta = 'controlador/usuario/img/user_default.png';
        $consulta = $MU->editarUsuario($id, $idPersona, $idRol, $estatus);
        echo $consulta;
        break;
    case 'editarFoto':
        $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
        $nombreArchivo = htmlspecialchars($_POST['nombreArchivo'], ENT_QUOTES, 'UTF-8');

        if (is_array($_FILES) && count($_FILES) > 0) { //Validar que el input tiene datos
            if (move_uploaded_file($_FILES['foto']['tmp_name'], "img/" . $nombreArchivo)) {
                $ruta = 'controlador/usuario/img/' . $nombreArchivo;
                $consulta = $MU->editarFoto($id, $ruta);
                echo $consulta;
            } else {
                echo 0;
            }
        } else {
            echo 0;
        }
        break;
    case 'editarFotoProfile':
        $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
        $nombreArchivo = htmlspecialchars($_POST['nombreArchivo'], ENT_QUOTES, 'UTF-8');

        if (is_array($_FILES) && count($_FILES) > 0) { //Validar que el input tiene datos
            if (move_uploaded_file($_FILES['foto']['tmp_name'], "img/" . $nombreArchivo)) {
                $ruta = 'controlador/usuario/img/' . $nombreArchivo;
                $consulta = $MU->editarFoto($id, $ruta);
                echo $consulta;
            } else {
                echo 0;
            }
        } else {
            echo 0;
        }
        break;
    case 'obtenerDatosUsuario':
        $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');

        $consulta = $MU->obtenerDatosUsuario($id);
        echo json_encode($consulta);
        break;
    case 'obtenerDatosPerfil':
        $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');

        $consulta = $MU->obtenerDatosUsuario($id);
        echo json_encode($consulta);
        break;
    case 'actualizarDatosProfile':
        $expresionLetras = '/^(?!-+)[a-zA-Z-ñáéíóúÁÉÍÓÚ\s]*$/';
        $error = "";
        $contador = 0;

        /*CAPTURANDO LA DATA ENVIADA POR MEDIO DE AJAX*/
        $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
        $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
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
        if (!preg_match($expresionLetras, trim($apellidoPaterno))) {
            $contador++;
            $error .= "El apellido paterno debe contener solo letras. <br>";
        }
        if (!preg_match($expresionLetras, trim($apellidoMaterno))) {
            $contador++;
            $error .= "El apellido materno debe contener solo letras. <br>";
        }

        //is_numeric = retorna false si el dato contiene letras
        if (!is_numeric($numeroDocumento)) {
            $contador++;
            $error .= "El numero de documento debe contener solo numeros. <br>";
        }

        if ($contador > 0) { //Es porque hay un error
            echo $error;
        } else {
            $consulta = $MU->actualizarDatosProfile($id, $nombre, $apellidoPaterno, $apellidoMaterno, $tipoDocumento, $numeroDocumento, $sexo, $telefono, $correo);
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "usuario", "Se edito usuario($id)",  $_SESSION["S_IPPUBLICA"]);

            echo $consulta; //Retornaremos 0 - 1, es lo que contendra la variable consulta
        }
        break;
    case 'actualizarPassword':
        $id = htmlspecialchars(trim($_POST['id']), ENT_QUOTES, 'UTF-8');
        $passwordActual = htmlspecialchars(trim($_POST['passwordActual']), ENT_QUOTES, 'UTF-8');
        $passwordActualEscrita = htmlspecialchars(trim($_POST['passwordActualEscrita']), ENT_QUOTES, 'UTF-8');
        $passwordNuevo = password_hash($_POST['passwordNuevo'], PASSWORD_DEFAULT, ['cost' => 10]);

        if (password_verify($passwordActualEscrita, $passwordActual)) {
            $consulta = $MU->editarPassword($id, $passwordNuevo, 0);
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "usuario", "Se edito password($id)",  $_SESSION["S_IPPUBLICA"]);

            echo $consulta;
        } else {
            echo 2;
        }
        break;
    case 'obtenerDatosWidgets':
        $fechaInicio = htmlspecialchars(trim($_POST['fechaInicio']), ENT_QUOTES, 'UTF-8');
        $fechaFin = htmlspecialchars(trim($_POST['fechaFin']), ENT_QUOTES, 'UTF-8');
        $consulta = $MU->obtenerDatosWidget($fechaInicio, $fechaFin);
        echo json_encode($consulta);
        break;

    case 'productosMasVendidos':
        $fechaInicio = htmlspecialchars(trim($_POST['fechaInicio']), ENT_QUOTES, 'UTF-8');
        $fechaFin = htmlspecialchars(trim($_POST['fechaFin']), ENT_QUOTES, 'UTF-8');
        $modelo1 = new Modelo_Usuario();
        $modelo2 = new Modelo_Usuario();
        $modelo3 = new Modelo_Usuario();
        $modelo4 = new Modelo_Usuario();
        $modelo5 = new Modelo_Usuario();
        $modelo6 = new Modelo_Usuario();

        $arregloGeneral = array();

        $arregloproductoMasVendidos = $MU->getTop10ProductosMasVendidos($fechaInicio, $fechaFin);
        $arregloServiciosSolicitados = $modelo1->getTop10ServiciosSolicitados($fechaInicio, $fechaFin);
        $arregloTop10Ingresos = $modelo2->obtenerTop10Ingresos($fechaInicio, $fechaFin);
        $top10ProductosMenosvendidos = $modelo3->getTop10ProductoMenosVendidos($fechaInicio, $fechaFin);
        $top10ProductosMenosIng = $modelo4->getTop10ProductosMenosIngresados($fechaInicio, $fechaFin);
        $top10ServiciosMenosSolci = $modelo5->getTop10ServiciosMenosSolicitados($fechaInicio, $fechaFin);
        $mesesMasVentas = $modelo6->obtenerMesesMasVentas();

        array_push($arregloGeneral, $arregloproductoMasVendidos);
        array_push($arregloGeneral, $arregloServiciosSolicitados);
        array_push($arregloGeneral, $arregloTop10Ingresos);
        array_push($arregloGeneral, $top10ProductosMenosvendidos);
        array_push($arregloGeneral, $top10ProductosMenosIng);
        array_push($arregloGeneral, $top10ServiciosMenosSolci);
        array_push($arregloGeneral, $mesesMasVentas);
        
        echo json_encode($arregloGeneral);
        break;
    case 'validateDataRecuperation':
        $username = htmlspecialchars(trim($_POST['username']), ENT_QUOTES, 'UTF-8');
        $email = htmlspecialchars(trim($_POST['email']), ENT_QUOTES, 'UTF-8');

        $respuesta = $MU->existsUsernameAndPassword($username, $email);
        $valResp = floatval($respuesta);

        if ($valResp > 0) {
            $idUsuario = $valResp;
            $password = newPassword(11);
            $encriptado = password_hash($password, PASSWORD_DEFAULT, ['cost' => 10]);
            $temporal = 1;

            $resp = $MA->actualizarPassword($idUsuario, $encriptado, $temporal);
            if ($resp == 1) {
                $mail = new PHPMailer(true);
                try {
                    $mail->SMTPOptions = array(
                        'ssl' => array(
                            'verify_peer' => false,
                            'verify_peer_name' => false,
                            'allow_self_signed' => true
                        )
                    );

                    //Server settings
                    $mail->SMTPDebug = 0;                      //Enable verbose debug output
                    $mail->isSMTP();                                            //Send using SMTP
                    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
                    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
                    $mail->Username   = 'tallerautomotriz905@gmail.com';                     //SMTP username
                    $mail->Password   = 'honduras100';                               //SMTP password
                    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
                    $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

                    //Recipients
                    $mail->setFrom('tallerautomotriz905@gmail.com', 'MecaniSoft'); //QUE PERSONA LO ESTA ENVIANDO
                    $mail->addAddress($email, $username); //PARA QUIEN VA DIRIGIDO EL GMAIL

                    //Content
                    $mail->isHTML(true);                                  //Set email format to HTML
                    $mail->Subject = 'Hola ' . $username . ' adjuntamos su nuevo password.';
                    $mail->Body    = '
                    <!DOCTYPE html>
                    <html lang="en">
                    
                    <head>
                        <meta charset="UTF-8">
                        <title>Document</title>
                    </head>
                    
                    <body>
                    
                        <div style="width:100%; background:#eee; position:relative; font-family:sans-serif; padding-bottom:40px">
                    
                            <center>
                                <img style="padding:20px; width:10%" src="https://cdn-icons-png.flaticon.com/512/4768/4768930.png">
                            </center>
                    
                            <div style="position:relative; margin:auto; width:600px; background:white; padding:20px">
                    
                                <center>
                                    <img style="padding:20px; width:15%" src="https://image.flaticon.com/icons/png/512/3064/3064211.png">
                                    <h3 style="font-weight:100; color:#999">SOLICITUD DE NUEVA CONTRASEÑA</h3>
                                    <hr style="border:1px solid #ccc; width:80%">
                                    <h2 style="font-weight:100; color:#999; padding:0 20px";>Su nueva contraseña: <b>' . $password . '</b></h2>
                                    
                                    <a href="https://dennisdomain.com/sistemataller/vista/login.php" target="_blank"
                                        style="text-decoration:none">
                                        <div style="line-height:60px; background:#0aa; width:60%; color:white">Ingrese de nuevo al sitio</div>
                                    </a>
                    
                                    <br>
                                    <hr style="border:1px solid #ccc; width:80%">
                    
                                    <h5 style="font-weight:100; color:#999">Si no se inscribió en esta cuenta, puede ignorar este correo
                                        electrónico y la cuenta se eliminará.</h5>
                                </center>
                    
                            </div>
                        </div>
                    </body>
                    </html>';

                    $mail->send();
                    echo $resp;
                } catch (Exception $e) {
                    echo "Mensaje de error: {$mail->ErrorInfo}";
                }
            } else {
                echo $resp;
            }
        } else {
            echo $respuesta;
        }
        break;
    case 'newCredentials':
        $id = htmlspecialchars(trim($_POST['userId']), ENT_QUOTES, 'UTF-8');
        $temporal = htmlspecialchars(trim($_POST['temporal']), ENT_QUOTES, 'UTF-8');
        $passwordNuevo = password_hash($_POST['newPassword'], PASSWORD_DEFAULT, ['cost' => 10]);

        $consulta = $MU->editarPassword($id, $passwordNuevo, $temporal);
        echo $consulta;
        break;
    case 'notificaciones':

        $consulta = $MU->addNotifications();
        $data = json_encode($consulta);
    
        if (count($consulta) > 0) {
            echo  $data;
        } else {
            echo 0;
        }
        break;
        

    default:
        # code...
        break;
}
