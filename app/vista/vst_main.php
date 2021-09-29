<!DOCTYPE html>
<?php
session_start();
if (isset($_SESSION['usuario'])){

?>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>INICIO DE SESION - SISRECOCOAP</title>
    <meta name="description" content="SISRECOCOAP">
    <link rel="stylesheet" href="../../public/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="../../public/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="../../public/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="../../public/fonts/fontawesome5-overrides.min.css">
    <script type="text/javascript" src="../../public/js/jquery.js"></script>
</head>

<body id="page-top">
    <?php
        require_once("../controlador/ctrl_socios.php");
        $obj_ctrl=new ctrl_socios();
        $resp=$obj_ctrl->listartodos();

        require_once("../controlador/ctrl_empleado.php");
        $obj_ctrlE=new ctrl_empleado();
        $respE=$obj_ctrlE->listar();

        require_once("../controlador/ctrl_consumo.php");
        $obj_ctrlC=new ctrl_consumo();
        $respC=$obj_ctrlC->listarpagados();

        //$obj_ctrlCD=new ctrl_consumo();
        $respCD=$obj_ctrlC->listardeudores()
    ?>
<div id="wrapper">
    <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
        <div class="container-fluid d-flex flex-column p-0"><a
                    class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-lock" style="color:green"></i></div>
                <div class="sidebar-brand-text mx-3"><span>SISRECOCOAP</span></div>
            </a>
            <hr class="sidebar-divider my-0">
            <ul class="navbar-nav text-light" id="accordionSidebar">
                <li class="nav-item"><a class="nav-link active" href="vst_main.php"><i class="fa fa-home"></i><span>INICIO</span></a></li>
                <li class="nav-item"><a class="nav-link" href=""><i class="fa fa-money"></i><span>COBROS</span></a></li>
                <li class="nav-item"><a class="nav-link" href="vst_consumos.php"><i class="fas fa-tachometer-alt"></i><span>CONSUMOS</span></a></li>
                <li class="nav-item" id="btn_periodo"><a class="nav-link" href="vst_periodos.php"><i class="fa fa-pencil-square"></i><span>PERIODOS</span></a></li>
                <li class="nav-item" id="btn_socio"><a class="nav-link" href="vst_socios.php"><i class="fa fa-user"></i><span>SOCIOS</span></a></li>
                <li class="nav-item"><a class="nav-link" href="vst_empleados.php"><i class="fa fa-users"></i><span>EMPLEADOS</span></a>
                
            </ul>
            <div class="text-center d-none d-md-inline">
                <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
            </div>
        </div>
    </nav>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                <div class="container-fluid">
                    <ul class="navbar-nav flex-nowrap ms-auto">
                        <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link"
                                                                            aria-expanded="false"
                                                                            data-bs-toggle="dropdown" href="#"><i
                                        class="fas fa-search"></i></a>
                            <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in"
                                 aria-labelledby="searchDropdown">
                                <form class="me-auto navbar-search w-100">
                                    <div class="input-group"><input class="bg-light form-control border-0 small"
                                                                    type="text" placeholder="Search for ...">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary py-0" type="button"><i
                                                        class="fas fa-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <li class="nav-item dropdown no-arrow">
                            <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link"
                                                                       aria-expanded="false" data-bs-toggle="dropdown"
                                                                       href="#"><span
                                            class="d-none d-lg-inline me-2 text-gray-600 small"><?php echo 'Bienvenid@: '.$_SESSION['usuario']; ?> </span><img class="border rounded-circle img-profile"
                                                                          src="../../public/img/avatar5.jpeg"></a>
                                <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in"><a
                                            class="dropdown-item" href=""><i
                                                class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Cuenta</a><a
                                            class="dropdown-item" href=""><i
                                                class="fas fa-cogs fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Configuración</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="../config/logout.php"><strong>Salida</strong></a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        <!-- --contenido -->
        <main id="main-container">
                <div class="content">
                    <div class="block">
                        <div class="block-header block-header-default">
                        
                            <!-- <h3 class="block-title">ESTADISTICAS</h3> -->
                    <!-- AQUI LOS CUADROS -->
                        </div>
                        <div class="block-content block-content-full">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="card">
                                        <div class="card-body text-white bg-success">
                                        <!-- <img class="card-img-top" src=".../100px180/" alt="Card image cap"> -->
                                        <?php
                                                $rows = $respC->fetchAll();
                                                echo "<td>" . count($rows) . "</td>";
                                            ?>
                                        Cuentas Pagadas del mes: <strong><span id="connected_users">0</span></strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="card">
                                        <div class="card-body text-white bg-primary">
                                            <?php
                                                $rows = $resp->fetchAll();
                                                echo "<td>" . count($rows) . "</td>";
                                            ?>
                                            SOCIOS REGISTRADOS: <strong>$ <span id="daily_revenue">0</span></strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="card">
                                        <div class="card-body text-white bg-danger">
                                            <?php
                                                $rows = $respE->fetchAll();
                                                echo "<td>" . count($rows) . "</td>";
                                            ?>
                                            Empleados Registrados <strong>$ <span id="daily_revenue">0</span></strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="card">
                                        <div class="card-body text-white bg-warning">
                                            <?php
                                                $rows = $respCD->fetchAll();
                                                foreach ($rows as $row ) {
                                                echo "<td>".$row["Cuenta"]."</td>";
                                                echo "<td>".$row["ApellidosNombres"]."</td>";
                                                }
                                            ?>
                                            SOCIOS DEUDORES: <strong>$ <span id="daily_revenue">0</span></strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="card">
                                        <div class="card-body text-white bg-info">
                                            <?php
                                                $rows = $resp->fetchAll();
                                                echo "<td>" . count($rows) . "</td>";
                                            ?>
                                            Dato1: <strong>$ <span id="daily_revenue">0</span></strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="card">
                                        <div class="card-body text-white bg-dark">
                                            <?php
                                                $rows = $resp->fetchAll();
                                                echo "<td>" . count($rows) . "</td>";
                                            ?>
                                            Datos2: <strong>$ <span id="daily_revenue">0</span></strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </main>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Copyright © SISRECOCOAP 2021</span></div>
            </div>
        </footer>
    </div>
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
<script src="../../public/bootstrap/js/bootstrap.min.js"></script>
<script src="../../public/js/theme.js"></script>
</body>
</html>
<?php
}else{
    header("location: vst_index.php");
}
?>