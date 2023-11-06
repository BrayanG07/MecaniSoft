<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Arvo'>
  <!-- <link rel="stylesheet" href="404.css"> -->
  <style>
    .page_404 {
      padding: 40px 0;
      background: #fff;
      font-family: "Arvo", serif;
    }

    .page_404 img {
      width: 100%;
    }

    .four_zero_four_bg {
      background-image: url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);
      height: 400px;
      background-position: center;
    }

    .four_zero_four_bg h1 {
      font-size: 80px;
    }

    .four_zero_four_bg h3 {
      font-size: 80px;
    }

    .link_404 {
      color: #fff !important;
      padding: 10px 20px;
      background: #39ac31;
      margin: 20px 0;
      display: inline-block;
      text-decoration: none;
    }

    .contant_box_404 {
      margin-top: -50px;
    }
  </style>
  <title>404 error | MecaniSoft</title>
</head>

<body>
  <section class="page_404">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 ">
          <div class="col-sm-10 col-sm-offset-1  text-center">
            <div class="four_zero_four_bg">
              <h1 class="text-center ">404</h1>

            </div>

            <div class="contant_box_404">
              <h3 class="h2">
                Parece que estás perdido
              </h3>

              <p>la página que busca no está disponible!</p>

              

              <!-- <?php echo $_SERVER['SERVER_NAME']; ?> -->

              <a href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/sistemataller/" class="link_404">Ir a la página principal.</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>

</html>