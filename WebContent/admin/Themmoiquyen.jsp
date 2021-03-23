<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Thêm mới quyền</title>

</head>
<jsp:include page="header.jsp"></jsp:include>
				<!-- Begin Page Content -->
				<!-- Body User -->
				<div class="quanlyquyenhanuser" style="margin-left: 30px">
					<h2>
						Thêm mới quyền<br>
						<hr>
						<br>
					</h2>
					<form>
						<div>
							<label for="Loai tai khoan">Nhóm quyền:</label> <select
								name="Loai tai khoan"
								style="padding: 2px; margin-left: 72px; width: 500px">
								<option value="Quantridanhmuc">Quản trị danh mục</option>
								<option value="Quantrigiaodien">Quản trị giao diện</option>
								<option value="Quantrithongtin">Quản trị thông tin</option>
								<option value="Seowebsite">Seo website</option>
							</select><br> <br>
						</div>
						<div>
							<label for="Ten tai khoan">Tên quyền:</label> <input type="text"
								name="Tenquyen" style="margin-left: 88px; width: 500px"
								placeholder="Nhập tên quyền"><br> <br>
						</div>
						<div style="display: flex">
							<div>
								<span
									style="padding-top: 10px; padding-left: 2px; padding-bottom: 5px">Mô
									tả:</span>
							</div>
							<textarea rows="5" cols="60" style="margin-left: 123px"></textarea>
						</div>
					</form>
				</div>
				<div class="quanlyquyenhanuser" style="margin-left: 30px;margin-top: 70px">
					<h2>
						Thêm mới nhóm quyền<br>
						<hr>
						<br>
					</h2>
					<form>
						<div>
							<label for="Nhomquyen">Nhóm quyền:</label><input type="text"
								name="Nhomquyen" style="margin-left: 74px; width: 500px"
								placeholder="Nhập tên nhóm quyền"> <br> <br>
						</div>
						<div style="display: flex">
							<div>
								<span
									style="padding-top: 10px; padding-left: 2px; padding-bottom: 5px">Mô
									tả:</span>
							</div>
							<textarea rows="5" cols="60" style="margin-left: 123px"></textarea>
						</div>
						<div style="margin-left: 169px; margin-top: 50px">
							<button type="button"
								style="background-color: #1E90FF; padding: 5px; border-radius: 6px; color: white; border: none">Thêm</button>
							<button type="button"
								style="background-color: #1E90FF; padding: 5px; border-radius: 6px; margin-left: 20px; color: white; border: none">Thoát</button>
						</div>
					</form>
				</div>
				<!-- End of Body User -->
				<!-- End of Main Content -->

				<!-- Footer -->
				<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>