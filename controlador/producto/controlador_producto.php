<?php
    require '../../modelo/modelo_producto.php';

    require '../../modelo/modelo_bitacora.php';
    $MB = new ModeloBitacora();
    session_start();
    
    $MP = new Modelo_Producto();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";

    switch ($opcion) {
        case 'listar':
            $consulta = $MP->listarProducto();
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

            if($consulta > 0){
                $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Oferta", "Producto", "Se registro una oferta($idProducto)", $_SESSION["S_IPPUBLICA"]);
            }

            echo $consulta;
            break;
        case 'registrar':
            $error = "";
            $contador = 0;

            $producto = htmlspecialchars(trim($_POST['producto']), ENT_QUOTES, 'UTF-8');
            $stockMinimo = htmlspecialchars($_POST['stockMinimo'], ENT_QUOTES, 'UTF-8');
            $idCategoria = htmlspecialchars($_POST['idCategoria'], ENT_QUOTES, 'UTF-8');
            $idFabricante = htmlspecialchars($_POST['idFabricante'], ENT_QUOTES, 'UTF-8');
            $idUnidadMedida = htmlspecialchars(trim($_POST['idUnidadMedida']), ENT_QUOTES, 'UTF-8');
            $precioCompra = htmlspecialchars($_POST['precioCompra'], ENT_QUOTES, 'UTF-8');
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

            if (!is_numeric($precioCompra)) {
                $contador++;
                $error .= "El precio compra debe contener solo numeros. <br>";
            }

            if ($contador > 0) {
                echo $error;
            } else {
                if (is_array($_FILES) && count($_FILES) > 0) {//Validar que el input tiene datos
                    if (move_uploaded_file($_FILES['foto']['tmp_name'], "img/".$nombreArchivo)) {
                        $ruta = 'controlador/producto/img/'.$nombreArchivo;
                        $consulta = $MP->registrarProducto($producto,$stockMinimo, $idCategoria,$idFabricante, $idUnidadMedida, $ruta, $precioCompra, $precio, $descripcion,$tipo,$codigo);
                        
                        if($consulta > 0){
                            $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "Producto", "Se registro un Producto", $_SESSION["S_IPPUBLICA"]);
                        }
                        
                        echo $consulta;                     
                    }else {
                        echo 0;
                    }
                } else {
                    $ruta = 'controlador/producto/img/producto_default.png';
                    $consulta = $MP->registrarProducto($producto,$stockMinimo, $idCategoria,$idFabricante, $idUnidadMedida, $ruta, $precioCompra, $precio, $descripcion,$tipo,$codigo);
                    
                    if($consulta > 0){
                            $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "Producto", "Se registro un Producto", $_SESSION["S_IPPUBLICA"]);
                        }
                    
                    echo $consulta;
                }   
            }
            break;
        case 'editar':
            $error = "";
            $contador = 0;

            $id = htmlspecialchars(trim($_POST['idProducto']), ENT_QUOTES, 'UTF-8');
            $producto = htmlspecialchars(trim($_POST['producto']), ENT_QUOTES, 'UTF-8');
            $descripcion = htmlspecialchars($_POST['descripcion'], ENT_QUOTES, 'UTF-8');
            $idCategoria = htmlspecialchars($_POST['idCategoria'], ENT_QUOTES, 'UTF-8');
            $idUnidadMedida = htmlspecialchars(trim($_POST['idUnidad']), ENT_QUOTES, 'UTF-8');
            $precio = htmlspecialchars($_POST['precio'], ENT_QUOTES, 'UTF-8');
            $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');
            $precioCompra = htmlspecialchars($_POST['precioCompra'], ENT_QUOTES, 'UTF-8');
            $stockMinimo = htmlspecialchars($_POST['stockMinimo'], ENT_QUOTES, 'UTF-8');
            $idFabricante = htmlspecialchars($_POST['idFabricante'], ENT_QUOTES, 'UTF-8');

            //is_numeric = retorna false si el dato contiene letras
            if (!is_numeric($precio)) {
                $contador++;
                $error .= "El precio de venta debe contener solo numeros. <br>";
            }

            if (!is_numeric($precioCompra)) {
                $contador++;
                $error .= "El precio de compra debe contener solo numeros. <br>";
            }

            if ($contador > 0) {
                echo $error;
            } else {    
                $consulta = $MP->editarProducto($id, $producto, $idCategoria, $idUnidadMedida, $precio, $estatus, $descripcion, $precioCompra, $stockMinimo, $idFabricante);
                 if($consulta > 0){
                            $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "Producto", "Se edito un Producto($id)", $_SESSION["S_IPPUBLICA"]);
                        }

                echo $consulta;
            }
            break;
        case 'editarFoto':
            $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
            $nombreArchivo = htmlspecialchars($_POST['nombreArchivo'], ENT_QUOTES, 'UTF-8');

            if (is_array($_FILES) && count($_FILES) > 0) {//Validar que el input tiene datos
                if (move_uploaded_file($_FILES['foto']['tmp_name'], "img/".$nombreArchivo)) {
                    $ruta = 'controlador/producto/img/'.$nombreArchivo;
                    $consulta = $MP->editarFotoProducto($id, $ruta);
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
        case 'listarComboFabricante':
            $consulta = $MP->listarComboFabricante();
            echo json_encode($consulta);
            break;
        case 'listarUnidadCombo':
            $consulta = $MP->listarComboUnidad();
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