<?php

require_once __DIR__ . '/vendor/autoload.php';
require '../conexion_global/r_conexion.php';

$mpdf = new \Mpdf\Mpdf();
$sql = "SELECT producto_codigo, producto_nombre
FROM producto 
WHERE prod_serv_tipo = 'PRODUCTO'";

$html = '
    <div style="text-align: center;">
        <h2>CODIGOS DE BARRA - PRODUCTOS</h2>
    </div>
    <div style="text-align: center;"> ';
    $resultado = $mysqli->query($sql);
    while ($row = $resultado->fetch_assoc()) {
        $html .= '
        <div class="cont_barcode" style="margin-top: 10px; margin-bottom: 10px;">
            <barcode code="'.$row['producto_codigo'].'" type="EAN128A" class="barcode" size="1.5" disableborder="1"/>
            <p style="margin-top: 5px;">'.$row['producto_nombre'].'</p>
        </div>
            
        ';
    }   
    $html .= '</div>';


// $css = file_get_contents('css/estadisticas_ventas.css');
// $mpdf->WriteHTML($css, 1); 
$mpdf->WriteHTML($html);
$mpdf->Output();
