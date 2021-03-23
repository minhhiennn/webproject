<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>


    <title>SB Admin 2 - Cards</title>

</head>

<jsp:include page="header.jsp"></jsp:include>
               

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">CÃ¡c Tháº»</h1>
                    </div>

                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Thu Nháº­p(HÃ ng ThÃ¡ng)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Annual) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Thu Nháº­p(HÃ ng NÄm)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Tasks Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">NhiÃªm Vá»¥
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                YÃªu Cáº§u Äang Äá»£i Giáº£i Quyáº¿t</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-lg-6">

                            <!-- Default Card Example -->
                            <div class="card mb-4">
                                <div class="card-header">
                                    VÃ­ Dá»¥ CÃ¡c Tháº» Máº·c Äá»nh
                                </div>
                                <div class="card-body">
                                    Tháº» nÃ y sá»­ dá»¥ng kiá»u máº·c Äá»nh cá»§a Bootstrap mÃ  khÃ´ng cÃ³ lá»p tiá»n Ã­ch nÃ o ÄÆ°á»£c thÃªm vÃ o. ToÃ n cáº§u
                                    kiá»u lÃ  nhá»¯ng thá»© duy nháº¥t sá»­a Äá»i giao diá»n cá»§a vÃ­ dá»¥ tháº» máº·c Äá»nh nÃ y.
                                </div>
                            </div>

                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">VÃ­ Dá»¥ Vá» CÃ¡c Tháº» CÆ¡ Báº£n </h6>
                                </div>
                                <div class="card-body">
                                    Kiá»u cho vÃ­ dá»¥ tháº» cÆ¡ báº£n nÃ y ÄÆ°á»£c táº¡o báº±ng cÃ¡ch sá»­ dá»¥ng Bootstrap máº·c Äá»nh
                                    cÃ¡c lá»p tiá»n Ã­ch. Báº±ng cÃ¡ch sá»­ dá»¥ng cÃ¡c lá»p tiá»n Ã­ch, kiá»u dÃ¡ng cá»§a thÃ nh pháº§n tháº» cÃ³ thá»
                                    dá» dÃ ng sá»­a Äá»i mÃ  khÃ´ng cáº§n báº¥t ká»³ CSS tÃ¹y chá»nh nÃ o!
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-6">

                            <!-- Dropdown Card Example -->
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">VÃ­ dá»¥ vá» tháº» tháº£ xuá»ng</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">
                                                TiÃªu Äá» tháº£ xuá»ng:</div>
                                            <a class="dropdown-item" href="#">Hoáº¡t Äá»ng </a>
                                            <a class="dropdown-item" href="#">Má»t HÃ nh Äá»ng KhÃ¡c</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Má»t cÃ¡i gÃ¬ ÄÃ³ khÃ¡c á» ÄÃ¢y</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    Dropdown menus can be placed in the card header in order to extend the functionality
                                    of a basic card. In this dropdown card example, the Font Awesome vertical ellipsis
                                    icon in the card header can be clicked on in order to toggle a dropdown menu.
                                </div>
                            </div>

                            <!-- Collapsable Card Example -->
                            <div class="card shadow mb-4">
                                <!-- Card Header - Accordion -->
                                <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse"
                                    role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">
                                        VÃ­ dá»¥ vá» tháº» cÃ³ thá» thu gá»n</h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse show" id="collapseCardExample">
                                    <div class="card-body">
                                      ÄÃ¢y lÃ  má»t vÃ­ dá»¥ vá» tháº» cÃ³ thá» thu gá»n báº±ng cÃ¡ch sá»­ dá»¥ng tÃ­nh nÄng thu gá»n ÄÆ°á»£c tÃ­ch há»£p sáºµn cá»§a Bootstrap
chá»©c nÄng. <strong>Nháº¥p vÃ o tiÃªu Äá» tháº»</strong> Äá» xem pháº§n thÃ¢n tháº»
                                        sá»¥p Äá» vÃ  má» rá»ng!
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
  <jsp:include page="footer.jsp"></jsp:include>

</body>

</html>