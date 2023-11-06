<?php
    require '../../modelo/modelo_servicio.php';
        require '../../modelo/modelo_bitacora.php';
        $MB = new ModeloBitacora();
        session_start();
    
    $MP = new Modelo_Servicio();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";

    switch ($opcion) {
        case 'listar':
            $consulta = $MP->listarServicio();
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
        case 'oferta':
            $oferta = htmlspecialchars(trim($_POST['oferta']), ENT_QUOTES, 'UTF-8');
            $descuento = htmlspecialchars(trim($_POST['descuento']), ENT_QUOTES, 'UTF-8');
            $idProducto = htmlspecialchars(trim($_POST['idProducto']), ENT_QUOTES, 'UTF-8');

            $consulta = $MP->agregarOferta($oferta, $descuento, $idProducto);

            if($consulta >0){
                $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Oferta", "servicio", "Se registro una oferta en servicio($idProducto)", $_SESSION["S_IPPUBLICA"]);
            }

            echo $consulta;
            break;
        case 'registrar':
            $error = "";
            $contador = 0;

            $servicio = htmlspecialchars(trim($_POST['servicio']), ENT_QUOTES, 'UTF-8');
            $idCategoria = htmlspecialchars($_POST['idCategoria'], ENT_QUOTES, 'UTF-8');
            $precio = htmlspecialchars($_POST['precio'], ENT_QUOTES, 'UTF-8');
            $nombreArchivo = htmlspecialchars($_POST['nombreArchivo'], ENT_QUOTES, 'UTF-8');
            $descripcion = htmlspecialchars($_POST['descripcion'], ENT_QUOTES, 'UTF-8');

          
            $tipo = htmlspecialchars($_POST['tipo'], ENT_QUOTES, 'UTF-8');
            $codigo = htmlspecialchars($_POST['codigo'], ENT_QUOTES, 'UTF-8');
            //$tipo = htmlspecialchars($_POST['prod_serv_tipo'], ENT_QUOTES, 'UTF-8');

            //is_numeric = retorna false si el dato contiene letras
            if (!is_numeric($precio)) {
                $contador++;
                $error .= "El precio venta debe contener solo numeros. <br>";
            }


            if ($contador > 0) {
                echo $error;
            } else {
                if (is_array($_FILES) && count($_FILES) > 0) {//Validar que el input tiene datos
                    if (move_uploaded_file($_FILES['foto']['tmp_name'], "img/".$nombreArchivo)) {

                        $ruta = 'controlador/servicio/img/'.$nombreArchivo;

                        $consulta = $MP->registrarServicio($servicio, $idCategoria, $ruta, $precio, $descripcion,$tipo,$codigo);

                         if($consulta >0){
                            $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "servicio", "Se registro una  servicio", $_SESSION["S_IPPUBLICA"]);
                        }
                        
                        echo $consulta;                     
                    }else {
                        echo 0;
                    }
                } else {
                    $ruta = 'controlador/servicio/img/producto_default.png';
                    
                    $consulta = $MP->registrarServicio($servicio, $idCategoria, $ruta, $precio, $descripcion,$tipo,$codigo);
                   
                    if($consulta >0){
                       $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "servicio", "Se registro una  servicio", $_SESSION["S_IPPUBLICA"]);
                   }
                    echo $consulta;
                }   
            }
            break;
        case 'editar':
            $error = "";
            $contador = 0;

            $id = htmlspecialchars(trim($_POST['idProducto']), ENT_QUOTES, 'UTF-8');
            $servicio = htmlspecialchars(trim($_POST['servicio']), ENT_QUOTES, 'UTF-8');
            $descripcion = htmlspecialchars($_POST['descripcion'], ENT_QUOTES, 'UTF-8');
            $idCategoria = htmlspecialchars($_POST['idCategoria'], ENT_QUOTES, 'UTF-8'); 
            $precio = htmlspecialchars($_POST['precio'], ENT_QUOTES, 'UTF-8');
            $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');

            //is_numeric = retorna false si el dato contiene letras
            if (!is_numeric($precio)) {
                $contador++;
                $error .= "El precio debe contener solo numeros. <br>";
            }

            if ($contador > 0) {
                echo $error;
            } else {    
                $consulta = $MP->editarServicio($id, $servicio, $idCategoria, $precio, $estatus, $descripcion);
                 if($consulta >0){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "servicio", "Se edito un servicio($id)", $_SESSION["S_IPPUBLICA"]);
                }
                echo $consulta;
            }
            break;
        case 'editarFoto':
            $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
            $nombreArchivo = htmlspecialchars($_POST['nombreArchivo'], ENT_QUOTES, 'UTF-8');

            if (is_array($_FILES) && count($_FILES) > 0) {//Validar que el input tiene datos
                if (move_uploaded_file($_FILES['foto']['tmp_name'], "img/".$nombreArchivo)) {
                    $ruta = 'controlador/servicio/img/'.$nombreArchivo;
                    $consulta = $MP->editarFotoServicio($id, $ruta);
                    echo $consulta;
                }else {
                    echo 0;
                }
            } else {
                echo 0;
            }
            break;
        case 'listarComboCategoria':
            $consulta = $MP->listarComboCategoria();
            echo json_encode($consulta);
            break;
        case 'generarCodigo':
                $consulta = $MP->generarCodigo();
                echo json_encode($consulta);
            break;
        default:
            # code...
            break;
    }

    function existeCodigo() {

    }
?>