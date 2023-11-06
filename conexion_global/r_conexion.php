<?php
    $server = "localhost";
    $user = "root";
    $password = "";
    $database = "db_mecanisoft";

    $mysqli = new mysqli($server, $user, $password, $database);

    $mysqli->set_charset("utf8mb4");

    if (mysqli_connect_errno()) {
        echo 'Error en la conexion: '.mysqli_connect_errno();
        exit();
    }
