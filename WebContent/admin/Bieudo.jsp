<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>


    <title>SB Admin 2 - Charts</title>



</head>

 <jsp:include page="footer.jsp"></jsp:include>
				<!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Biểu Đồ</h1>
                    <p class="mb-4">
                        Chart.js là một plugin của bên thứ ba được sử dụng để tạo các biểu đồ trong chủ đề này.
                                                Các biểu đồ bên dưới đã được tùy chỉnh - để có thêm các tùy chọn tùy chỉnh, vui lòng truy cập <a
                            target="_blank" href="https://www.chartjs.org/docs/latest/">official Chart.js
                            documentation</a>.</p>

                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-8 col-lg-7">

                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Biểu Đồ Khu Vực</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                    <hr>
                                        
Tạo kiểu cho biểu đồ khu vực có thể được tìm thấy trong file
                                    <code>/js/demo/chart-area-demo.js</code> .
                                </div>
                            </div>

                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Biểu Đồ Cột</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-bar">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                    <hr>
                                    Tạo kiểu cho biểu đồ thanh có thể được tìm thấy trong file
                                    <code>/js/demo/chart-bar-demo.js</code> .
                                </div>
                            </div>

                        </div>

                        <!-- Donut Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Biểu Đồ Bánh Rán</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <hr>
                                  Biểu Đồ Bánh Rán Có Thể Được Tìm Thấy trong File
                                    <code>/js/demo/chart-pie-demo.js</code> .
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