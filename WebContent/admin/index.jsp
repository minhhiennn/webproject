<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>


<title>SB Admin 2 - Dashboard</title>



</head>
<jsp:include page="header.jsp"></jsp:include>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Bảng thống kê</h1>
		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Tạo báo cáo</a>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-primary text-uppercase mb-1">
								Tổng User</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">40</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-calendar fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">
								Tổng sản phẩm</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">215,000</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-info text-uppercase mb-1">Tổng
								đơn đặt hàng</div>
							<div class="row no-gutters align-items-center">

								<div class="h5 mb-0 font-weight-bold text-gray-800">80,000</div>
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
							<div
								class="text-xs font-weight-bold text-warning text-uppercase mb-1">
								Tổng bình luận</div>
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

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-8 col-lg-7">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">Biểu đồ về tổng
						sản phẩm bán được trong những năm gần đây</h6>
					<div class="dropdown no-arrow">
						<a class="dropdown-toggle" href="#" role="button"
							id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i
							class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
							aria-labelledby="dropdownMenuLink">
							<div class="dropdown-header">Dropdown Header:</div>
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div>
					</div>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="chart-area">
						<canvas id="myAreaChart"></canvas>
					</div>
				</div>
			</div>
		</div>

		<!-- Pie Chart -->
		<div class="col-xl-4 col-lg-5">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">Tổng quát sản
						phẩm trong kho</h6>
					<div class="dropdown no-arrow">
						<a class="dropdown-toggle" href="#" role="button"
							id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i
							class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
							aria-labelledby="dropdownMenuLink">
							<div class="dropdown-header">Dropdown Header:</div>
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div>
					</div>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="chart-pie pt-4 pb-2">
						<canvas id="myPieChart"></canvas>
					</div>
					<div class="mt-4 text-center small">
						<span class="mr-2"> <i class="fas fa-circle text-primary"></i>
							Đồ nam
						</span> <span class="mr-2"> <i class="fas fa-circle text-success"></i>
							Đồ nữ
						</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
							Đồ trẻ em
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Content Column -->
		<div class="col-lg-6 mb-4">

			<!-- Project Card Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Tự đánh giá</h6>
				</div>
				<div class="card-body">
					<h4 class="small font-weight-bold">
						Quản lý, thống kê dữ liệu <span class="float-right">20%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-danger" role="progressbar"
							style="width: 20%" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						Quản lý bán hàng <span class="float-right">40%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: 40%" aria-valuenow="40" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						Quản lý cơ sỡ dữ liệu khách hàng <span class="float-right">60%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar" role="progressbar" style="width: 60%"
							aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						Quản lý kho <span class="float-right">80%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-info" role="progressbar"
							style="width: 80%" aria-valuenow="80" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						Quản lý bình luận <span class="float-right">Tốt !</span>
					</h4>
					<div class="progress">
						<div class="progress-bar bg-success" role="progressbar"
							style="width: 100%" aria-valuenow="100" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>

			<!-- Color System -->
			<div class="row">
				<div class="col-lg-6 mb-4">
					<div class="card bg-primary text-white shadow">
						<div class="card-body">
							Trên 50%
							<div class="text-white-50 small">#4e73df</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-success text-white shadow">
						<div class="card-body">
							Tốt
							<div class="text-white-50 small">#1cc88a</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-info text-white shadow">
						<div class="card-body">
							Khá
							<div class="text-white-50 small">#36b9cc</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-warning text-white shadow">
						<div class="card-body">
							Dưới 50%
							<div class="text-white-50 small">#f6c23e</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-danger text-white shadow">
						<div class="card-body">
							Dưới 25%
							<div class="text-white-50 small">#e74a3b</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-secondary text-white shadow">
						<div class="card-body">
							Dưới 15%
							<div class="text-white-50 small">#858796</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-light text-black shadow">
						<div class="card-body">
							Dưới 10%
							<div class="text-black-50 small">#f8f9fc</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-dark text-white shadow">
						<div class="card-body">
							Chưa làm gì
							<div class="text-white-50 small">#5a5c69</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<div class="col-lg-6 mb-4">

			<!-- Illustrations -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Hình minh họa</h6>
				</div>
				<div class="card-body">
					<div class="text-center">
						<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
							style="width: 25rem;" src="img/undraw_posting_photo.svg" alt="">
					</div>
					<p>Lý do chính khiến việc chụp ảnh sản phẩm trở nên quan trọng
						là vì mọi người thường không giỏi trong việc mô tả những thứ họ
						thấy. Đối với các đơn vị kinh doanh online, chụp ảnh sản phẩm giúp
						bổ sung thông tin trực quan cho khách hàng- một trong những yếu tố
						mà người tiêu dùng sử dụng để đưa ra quyết định mua hàng.</p>

				</div>
			</div>

			<!-- Approach -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Cách phát triển</h6>
				</div>
				<div class="card-body">
					<p>Sự phát triển mạnh mẽ của Internet đã khiến cho các hoạt
						động bán hàng trên website trở thành một công cụ thương mại gian
						tạo ra vô số cơ hội kinh doanh khác nhau. Các website cũng chính
						là chất xúc tác, làm khăng khít thêm mối quan hệ giữa người bán
						hàng và khách hàng, gia tăng doanh thu và lợi nhuận theo cấp số
						nhân.</p>
					<p class="mb-0">Tuy nhiên để có thể thành công trong việc bán
						hàng trên website thì không phải doanh nghiệp nào cũng có thể thực
						hiện được. Dưới đây là một số yếu tố doanh nghiệp cần tập trung để
						có thể làm “bá chủ” hoạt động bán hàng trên website của mình.</p>
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