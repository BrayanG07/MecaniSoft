<?php
require_once __DIR__ . '/vendor/autoload.php';
require '../conexion_global/r_conexion.php';

$mpdf = new \Mpdf\Mpdf();
$query = "";
$html="";

$query = "SELECT
                h.producto_codigo,
                h.producto_nombre,
                h.producto_nombre_nuevo,
                h.producto_precio_venta,
                h.producto_precio_venta_nuevo,
                h.fecha_historial,
                c.conf_nombre_empresa
                FROM producto_historial h,configuracion c
                WHERE h.producto_codigo ='".$_GET['codigo']."'"; 

$resultado = $mysqli->query($query);

if ($resultado) {
  while ($row = $resultado->fetch_assoc()) {         

    $html = '
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <title>HISTORIAL DE CAMBIO DE SERVICIO</title>
        <link rel="stylesheet" href="style.css" media="all" />
      </head>
      <body>
        <header class="clearfix">
          <table border="1">
            <thead>
                <tr>
                    
                    <th style="text-align: center;">
                      <h1 style="color: black;">'.$row['conf_nombre_empresa'].'</h1>
                      <h2 style="color: black;">HISTORIAL DE CAMBIO DE SERVICIOS </h2>
                      <h3 style="color: black;"> '.$row['producto_nombre_nuevo'].' - '.$row['producto_codigo'].' </h3>
                    </th>
                </tr>
            </thead>
          </table>
        </header>
        <main>
          <table>
            <thead>
              <tr>
                <th class="service">#</th>
                <th class="desc">Codigo</th>
                <th class="desc">Nombre</th>
                <th class="desc">Nombre Nuevo</th>
                <th class="desc">Precio Venta</th>
                <th class="desc">Precio Venta Nuevo</th>
                <th class="desc">Fecha</th>
              </tr>
            </thead>
            <tbody>';
            $contador = 0;  
            //$sql = "call SP_LISTAR_HISTORIAL_PRODUCTO('".$row['producto_codigo']."')";
            $sql = "SELECT
                            h.producto_codigo,
                            h.producto_nombre,
                            h.producto_nombre_nuevo,
                            h.producto_precio_venta,
                            h.producto_precio_venta_nuevo,
                            h.fecha_historial
                          FROM producto_historial h
                          WHERE h.producto_codigo = '".$row['producto_codigo']."'";
            $resultado2 = $mysqli->query($sql);
            print_r($resultado2);
            while ($row2 = $resultado2->fetch_assoc()) {   
              $contador++;
              $html.='<tr>
                <td class="service">'.$contador.'</td>
                <td class="desc">'.$row2['producto_codigo'].'</td>
                <td class="desc">'.$row2['producto_nombre'].'</td>
                <td class="desc">'.$row2['producto_nombre_nuevo'].'</td>
                <td class="desc">'.$row2['producto_precio_venta'].'</td>
                <td class="desc">'.$row2['producto_precio_venta_nuevo'].'</td>
                <td class="desc">'.$row2['fecha_historial'].'</td>
                
              </tr>';
            }  
              $html.='
            </tbody>
          </table>
  
        </main>
        <footer>
        Copyright © MecaniSoft, Brayan Alvarez
        </footer>
      </body>
    </html>';
  } 
} 

$vacio='
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SIN HISTORIAL DE CAMBIO DE SERVICIO</title>
    <link rel="stylesheet" href="style.css" media="all" />
  </head>
  <body>
  <h3>SIN HISTORIAL DE CAMBIO DE SERVICIO</h3>
  </body>
  </html>
  
';



$css = file_get_contents('css/style.css');
$mpdf->WriteHTML($css, 1); //1 = es para que ejecute el css
$mpdf->WriteHTML($html==''?$vacio:$html);
$mpdf->Output();

