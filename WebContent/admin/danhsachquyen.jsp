<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>DanhSachQuyen</title>
</head>

<jsp:include page="header.jsp"></jsp:include>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Quản Lý Quyền</h1>
					<hr>
					<p class="mb-4">
						<a target="_blank" href="https://datatables.net"></a>.
					</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div
							style="display: flex; justify-content: flex-end; text-align: right; padding: 10px 19px">
							<a href="http://localhost:8080/WebProject/admin/Themmoiquyen.jsp">
								<button
									style="border: none; border-radius: 6px; padding: 8px; margin-right: 15px; background-color: #4e73df;">
									<i class="fas fa-plus" style="margin-right: 3px"></i> <span>Thêm</span>
								</button>
							</a>
							<button
								style="border: none; border-radius: 6px; padding: 8px; margin-right: 15px; background-color: #e74a3b;">
								<i class="fas fa-trash" style="margin-right: 5px"></i> <span>Xóa
									tất cả</span>
							</button>
							<button
								style="border: none; border-radius: 6px; padding: 8px; background-color: #1cc88a;">
								<i class="fas fa-file-upload" style="margin-right: 5px"></i> <span>Import
									to Excel</span>
							</button>
						</div>
						<div style="display: flex; padding: 5px 19px">
							<button
								style="padding: 8px 15px; border: 1px solid black; border-right: 1px solid #fff; background-color: #fff;">Copy</button>
							<button
								style="padding: 8px 15px; border: 1px solid black; border-right: 1px solid #fff; background-color: #fff;">CSV</button>
							<button
								style="padding: 8px 15px; border: 1px solid black; border-right: 1px solid #fff; background-color: #fff;">Excel</button>
							<button
								style="padding: 8px 15px; border: 1px solid black; background-color: #fff;">Print</button>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>STT</th>
											<th>Tên Quyền</th>
											<th>Nhóm Quyền</th>
											<th>Mô tả</th>
											<th>Xóa</th>
											<th>Sửa</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td>1</td>
											<td>Quản lý hình ảnh</td>
											<td>Quản trị giao diện</td>
											<td>Quản lý hình ảnh</td>

											<td>
												<button type="button">
													<i class="fas fa-trash-alt"></i>
												</button>
											</td>

											<th>
												<button type="button">
													<i class="fas fa-tools"></i>
												</button>
											</th>


										</tr>
										<tr>
											<td>2</td>
											<td>Quản trị bài viết</td>
											<td>Quản trị danh mục</td>
											<td>Quản trị bài viết</td>

											<td>
												<button type="button">
													<i class="fas fa-trash-alt"></i>
												</button>
											</td>

											<th>
												<button type="button">
													<i class="fas fa-tools"></i>
												</button>
											</th>


										</tr>
										<tr>
											<td>3</td>
											<td>Quản trị sản phẩm</td>
											<td>Quản trị danh mục</td>
											<td>Quản trị sản phẩm</td>

											<td>
												<button type="button">
													<i class="fas fa-trash-alt"></i>
												</button>
											</td>

											<th>
												<button type="button">
													<i class="fas fa-tools"></i>
												</button>
											</th>


										</tr>
										<tr>
											<td>4</td>
											<td>Hỗ trợ trực tuyến</td>
											<td>Quản trị giao diện</td>
											<td>Hỗ trợ trực tuyến</td>

											<td>
												<button type="button">
													<i class="fas fa-trash-alt"></i>
												</button>
											</td>

											<th>
												<button type="button">
													<i class="fas fa-tools"></i>
												</button>
											</th>

										</tr>
										<tr>
											<td>5</td>
											<td>Danh sách đơn hàng</td>
											<td>Quản trị thông tin</td>
											<td>Quản lý danh sách đơn hàng</td>

											<td>
												<button type="button">
													<i class="fas fa-trash-alt"></i>
												</button>
											</td>

											<th>
												<button type="button">
													<i class="fas fa-tools"></i>
												</button>
											</th>
										</tr>
									</tbody>
								</table>
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