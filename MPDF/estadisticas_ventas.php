<?php

require_once __DIR__ . '/vendor/autoload.php';
require '../conexion_global/r_conexion.php';

$mpdf = new \Mpdf\Mpdf();

$query = "SELECT conf_nombre_empresa FROM configuracion";
$resp = $mysqli->query($query);
$fila = $resp->fetch_assoc();

$ventasPorMes = "SELECT MONTHNAME(t.transaccion_fecha) AS MES,
SUM(t.transaccion_total) AS TOTAL
FROM transacciones t
WHERE YEAR(t.transaccion_fecha) = YEAR(NOW())
AND t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO')
GROUP BY MES
ORDER BY MES ASC;";

$html = '
    <div class="title">
        <h1>'.$fila['conf_nombre_empresa'].'</h1>
        <h2>REPORTE DE VENTAS</h2>
    </div>
    <hr class="linea">
    <div>
        <h3>Total de ventas por mes del año actual</h3>
    </div>
    <table>
        <thead>
            <tr>
                <th class="service">#</th>
                <th class="desc">Mes</th>
                <th class="total">TOTAL</th>
            </tr>
        </thead>
        <tbody>';
        $contador = 0;  
        $total = 00.00;
        $resultado = $mysqli->query($ventasPorMes);
        while ($row = $resultado->fetch_assoc()) {  
            $contador++;
            $total += $row['TOTAL'];
            $html.='<tr>
              <td class="service">'.$contador.'</td>
              <td class="desc">'.$row['MES'].'</td>
              <td class="total">'.$row['TOTAL'].'</td>
            </tr>';
        }     
        $html.=' 
        <tr>
            <td colspan="2" class="service"><b>TOTAL: </b></td>
            <td class="total"> <b>'.$total.'</b></td>
        </tr>
        </tbody>
    </table>
    <hr class="linea">
    <div>
        <h3>Top 10 productos más vendidos</h3>
    </div>';
    $top10ProductosMasVendidos = "SELECT dt.detalletransaccion_nombrepro, SUM(dt.detalletransaccion_cantidad) AS CANTIDAD_PRODUCTOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON t.transaccion_id = dt.transaccion_id
    WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
    AND YEAR(t.transaccion_fecha) = YEAR(NOW())
    AND p.prod_serv_tipo = 'PRODUCTO'
    GROUP BY dt.detalletransaccion_nombrepro, dt.producto_id
    ORDER BY CANTIDAD_PRODUCTOS DESC
    LIMIT 10";
    $html .= '
    <table>
    <thead>
        <tr>
            <th class="service">#</th>
            <th class="desc">PRODUCTO</th>
            <th class="total">CANTIDAD</th>
        </tr>
    </thead>
    <tbody>';
    $contador = 0;  
    $resultado2 = $mysqli->query($top10ProductosMasVendidos);
    while ($row2 = $resultado2->fetch_assoc()) {  
        $contador++;
        $html.='<tr>
          <td class="service">'.$contador.'</td>
          <td class="desc">'.$row2['detalletransaccion_nombrepro'].'</td>
          <td class="total">'.$row2['CANTIDAD_PRODUCTOS'].'</td>
        </tr>';
    }     
    $html.=' 
    </tbody>
</table>
<hr class="linea">
<div>
    <h3>Top 10 Servicios mas solicitados</h3>
</div>';
$top10ServiciosMasSoli = "SELECT p.producto_nombre, SUM(dt.detalletransaccion_cantidad) AS CANTIDAD_SERVICIOS
FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
INNER JOIN transacciones t ON t.transaccion_id = dt.transaccion_id
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND YEAR(t.transaccion_fecha) = YEAR(NOW())
AND p.prod_serv_tipo = 'SERVICIO'
GROUP BY dt.producto_id
ORDER BY CANTIDAD_SERVICIOS DESC
LIMIT 10;";

    $html .= '
    <table>
    <thead>
        <tr>
            <th class="service">#</th>
            <th class="desc">SERVICIO</th>
            <th class="total">CANTIDAD</th>
        </tr>
    </thead>
    <tbody>';
    $contador = 0;  
    $resultado2 = $mysqli->query($top10ServiciosMasSoli);
    while ($row2 = $resultado2->fetch_assoc()) {  
        $contador++;
        $html.='<tr>
          <td class="service">'.$contador.'</td>
          <td class="desc">'.$row2['producto_nombre'].'</td>
          <td class="total">'.$row2['CANTIDAD_SERVICIOS'].'</td>
        </tr>';
    }     
    $html.=' 
    </tbody>
</table>';


$css = file_get_contents('css/estadisticas_ventas.css');
$mpdf->WriteHTML($css, 1); 
$mpdf->WriteHTML($html);
$mpdf->Output();
