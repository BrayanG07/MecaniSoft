<?php

use PHPMailer\PHPMailer\PHPMailer;

require '../../modelo/modelo_persona.php';
    
    require '../PHPMailer/Exception.php';
    require '../PHPMailer/PHPMailer.php';
    require '../PHPMailer/SMTP.php';

    $MP = new Modelo_Persona();
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
        case 'listar':
            $consulta = $MP->listarPersona();
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

            if ($contador > 0) { //Es porque hay un error
                echo $error;
            } else {
                $consulta = $MP->registrarPersona($nombre, $apellidoPaterno, $apellidoMaterno,$tipoDocumento,$numeroDocumento,$sexo,$telefono);
                echo $consulta;//Retornaremos 0 - 1, es lo que contendra la variable consulta
            }
            break;
        case 'editar':
            $expresionLetras = '/^(?!-+)[a-zA-Z-ñáéíóúÁÉÍÓÚ\s]*$/';
            $error = "";
            $contador = 0;

            /*CAPTURANDO LA DATA ENVIADA POR MEDIO DE AJAX*/
            $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
            $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
            $apellidoPaterno = htmlspecialchars($_POST['apellidoPaterno'], ENT_QUOTES, 'UTF-8');
            $apellidoMaterno = htmlspecialchars($_POST['apellidoMaterno'], ENT_QUOTES, 'UTF-8');
            $tipoDocumento = htmlspecialchars($_POST['tipoDocumento'], ENT_QUOTES, 'UTF-8');
            $numeroDocumentoActual = htmlspecialchars($_POST['numeroDocumentoActual'], ENT_QUOTES, 'UTF-8');
            $numeroDocumentoNuevo = htmlspecialchars($_POST['numeroDocumentoNuevo'], ENT_QUOTES, 'UTF-8');
            $sexo = htmlspecialchars(strtoupper($_POST['sexo']), ENT_QUOTES, 'UTF-8');
            $telefono = htmlspecialchars($_POST['telefono'], ENT_QUOTES, 'UTF-8');
            $estatus = htmlspecialchars(strtoupper($_POST['estatus']), ENT_QUOTES, 'UTF-8');
            
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
            if (!is_numeric($numeroDocumentoNuevo)) {
                $contador++;
                $error .= "El numero de documento debe contener solo numeros. <br>";
            }

            if ($contador > 0) { //Es porque hay un error
                echo $error;
            } else {
                $consulta = $MP->editarPersona($id, $nombre, $apellidoPaterno, $apellidoMaterno,$tipoDocumento,$numeroDocumentoActual, $numeroDocumentoNuevo ,$sexo,$telefono, $estatus);
                echo $consulta;//Retornaremos 0 - 1, es lo que contendra la variable consulta
            }
            break;
        case 'estatus':
            $idPerson = htmlspecialchars($_POST['idCliente'], ENT_QUOTES, 'UTF-8');
            $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');
            
            $consulta = $MP->updateStatePerson($idPerson, $estatus);
            echo $consulta;
            break;
        case 'credenciales':
            $personaId = htmlspecialchars($_POST['personaId'], ENT_QUOTES, 'UTF-8');
            $username = htmlspecialchars($_POST['username'], ENT_QUOTES, 'UTF-8');
            $correo = htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8');
            $nombrePersona = htmlspecialchars($_POST['nombrePersona'], ENT_QUOTES, 'UTF-8');
            $existeCorreo = htmlspecialchars($_POST['existeCorreo'], ENT_QUOTES, 'UTF-8');
 
            $password = ($existeCorreo == 2) ? newPassword(11) : $username;
            $encriptado = password_hash($password, PASSWORD_DEFAULT, ['cost' => 10]);
            
            $resp = $MP->crearCredencialesPersona($personaId, $username, $encriptado);
            if ($resp == 1 && $existeCorreo == 2) {
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
                    $mail->addAddress($correo, $nombrePersona); //PARA QUIEN VA DIRIGIDO EL GMAIL

                    //Content
                    $mail->isHTML(true);                                  //Set email format to HTML
                    $mail->Subject = 'Hola ' . $nombrePersona . ' adjuntamos sus credenciales.';
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
                                    <h3 style="font-weight:100; color:#999">CREEDENCIALES</h3>
                                    <hr style="border:1px solid #ccc; width:80%">
                                    <h2 style="font-weight:100; color:#999; padding:0 20px";>Usuario: <b>' . $username . '</b></h2>
                                    <h2 style="font-weight:100; color:#999; padding:0 20px";>Contraseña: <b>' . $password . '</b></h2>
                                    
                                    <a href="https://dennisdomain.com/sistemataller/vista/login.php" target="_blank"
                                        style="text-decoration:none">
                                        <div style="line-height:60px; background:#0aa; width:60%; color:white">Ingrese al sitio</div>
                                    </a>
                    
                                    <br>
                                    <hr style="border:1px solid #ccc; width:80%">
                    
                                    <h3 style="font-weight:100; color:#999">SU PRIVACIADA ES IMPORTANTE, debido a eso tenga en cuenta que la contraseña asignada es temporal, por lo tanto cuando usted ingrese al sistema debera cambiar esa contraseña.</h3>
                                </center>
                    
                            </div>
                        </div>
                    </body>
                    </html>';

                    $mail->send();
                    echo 1;
                } catch (Exception $e) {
                    echo "Mensaje de error: {$mail->ErrorInfo}";
                }
            } else {
                echo $resp;
            }
            
            break;
        
        default:
            # code...
            break;
    }
