<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Thêm danh mục</title>

</head>
<jsp:include page="header.jsp"></jsp:include>
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-4 text-gray-800"></h1>
					<div class="col-lg-6 mb-4">

						<!-- Illustrations -->
						<div class="card shadow mb-4" style="width: 205%;">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Thông tin
									chung</h6>
							</div>
							<div class="card-body">
								<div>
									<span style="padding-right: 130px;">Danh mục:</span> <select
										style="padding: 3px; width: 600px">
										<option>Chọn mục làm cha</option>
										<option>Chọn mục làm con</option>
									</select>
								</div>
								<hr>
								<div>
									<span style="padding-right: 149px;">Module:</span> <select
										style="padding: 3px; width: 600px">
										<option>Sản phẩm</option>
										<option>Đồ nam</option>
										<option>Đồ nữ</option>
										<option>Đồ trẻ em</option>
									</select>
								</div>
								<hr>
								<div>
									<span style="padding-right: 149px;">Tiêu đề:</span> <input
										type="text" value="Sản phẩm"
										style="width: 600px; padding: 3px">
								</div>
								<hr>
								<div>
									<span style="padding-right: 123px;">Đường dẫn:</span> <input
										type="text" value="san-pham"
										style="width: 600px; padding: 3px">
								</div>
								<hr>
								<div>
									<span style="padding-right: 137px;">Số thứ tự:</span> <input
										type="text" value="san-pham"
										style="width: 600px; padding: 3px">
								</div>
								<hr>
								<div>
									<span style="padding-right: 42px;">Số thứ tự 2(Trang
										chủ):</span> <input type="text" value="san-pham"
										style="width: 600px; padding: 3px">
								</div>
								<hr>
								<div style="display: flex">
									<span style="padding-right: 160px; margin-top: 2px">Tác
										vụ:</span>
									<div style="display: flex;">
										<input type="checkbox" checked="checked"
											style="width: 20px; height: 20px; margin-right: 5px; margin-top: 5px">
										<span style="margin-top: 5px">Hiển thị</span>
									</div>
								</div>
								<hr>
								<div style="padding-left: 207px; margin-top: 30px;">
									<button
										style="border: none; background-color: #36b9cc; border-radius: 6px; margin-right: 10px;">Lưu</button>
									<button
										style="border: none; background-color: #36b9cc; border-radius: 6px;">Thoát</button>
								</div>
							</div>
						</div>

						<!-- Approach -->

					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
		<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>