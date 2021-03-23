<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Loại danh mục</title>

</head>
<jsp:include page="header.jsp"></jsp:include>
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-4 text-gray-800">Loại Danh Mục</h1>
					<hr>
					<p class="mb-4">
						<a target="_blank" href="https://datatables.net"></a>.
					</p>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div
							style="display: flex; justify-content: flex-end; text-align: right; padding: 10px 19px">
							<a href="http://localhost:8080/WebProject/admin/Themdanhmuc.jsp">
								<button
									style="border: none; border-radius: 6px; padding: 8px; margin-right: 15px; background-color: #4e73df;">
									<i class="fas fa-plus" style="margin-right: 3px"></i> <span>Thêm
									</span>
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
											<th>Danh mục</th>
											<th style="text-align: center;">Module</th>
											<th style="text-align: center;">Trang chủ</th>
											<th style="text-align: center;">Danh mục</th>
											<th style="text-align: center;">Hiển thị</th>
											<th>Xóa</th>
											<th>Sửa</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td>1</td>
											<td>Giới thiệu</td>
											<td style="text-align: center;">Bài viết</td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
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
											<td>Sản phẩm</td>
											<td style="text-align: center;">Sản phẩm</td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
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
											<td>Đồ nam</td>
											<td style="text-align: center;">Sản phẩm</td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
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
											<td>Đồ nữ</td>
											<td style="text-align: center;">Sản phẩm</td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
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
											<td>Đồ trẻ em</td>
											<td style="text-align: center;">Sản phẩm</td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
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
											<td>6</td>
											<td>Giỏ hàng</td>
											<td style="text-align: center;">Giỏ hàng</td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
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
											<td>7</td>
											<td>Blog</td>
											<td style="text-align: center;">Bài viết</td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
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
											<td>8</td>
											<td>Liên hệ</td>
											<td style="text-align: center;">Liên hệ</td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
											<td style="text-align: center; line-height: inherit;"><input
												type="checkbox"
												style="width: 20px; height: 20px; margin-top: 15px"
												checked="checked"></td>
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