<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>


<title>Thêm mới user</title>


</head>
<jsp:include page="header.jsp"></jsp:include>
<%
	String err = (String) request.getAttribute("err");
%>
<!-- Begin Page Content -->
<!-- Body User -->
<div class="quanlyquyenhanuser" style="margin-left: 30px">
	<h2>
		Thêm mới user<br> <br>
	</h2>
	<form
		action="http://localhost:8080/WebProject/UserAdminView?action=Insert"
		method="post">
		<div>
			<label for="Loai tai khoan">Loại tài khoản:</label> <select
				name="quyen" style="padding: 2px; margin-left: 72px; width: 500px">
				<option value="admin">Quản trị viên</option>
				<option value="user">Người dùng</option>
			</select><br> <br>
		</div>
		<div>
			<label for="Ten tai khoan">Tên tài khoản:</label> <input type="text"
				name="username" style="margin-left: 75px; width: 500px"
				placeholder="nhập tên tài khoản" required="required"><br>

			<%
				if (err != null && err.equals("invalid email")) {
			%>
			<span style="color: red">Email không hợp lệ</span>
			<%
				}
			%>
			<br>
		</div>
		<div>
			<label for="Mat khau">Mật khẩu:</label> <input type="password"
				style="margin-left: 105px; width: 500px" name="password"
				placeholder="nhập mật khẩu" required="required"><br> <br>
		</div>
		<div>
			<label for="nhaplaimatkhau">Nhập lại mật khẩu:</label><input
				type="password" style="margin-left: 46px; width: 500px"
				name="password_repeat" placeholder="nhập lại mật khẩu"
				required="required"><br>
			<%
				if (err != null && err.equals("password does not match")) {
			%>
			<span style="color: red">Mật khẩu không hợp lệ</span>
			<%
				}
			%>
			<br>
		</div>
		<div style="display: flex">
			<p style="margin-right: 98px">Quyền hạn:</p>
			<div style="">
				<input type="checkbox" style="margin-top: 5px"><label
					style="margin-left: 3px">Quản trị danh mục</label><br> <input
					type="checkbox"><label style="margin-left: 3px">Bài
					viết</label><br> <input type="checkbox"><label
					style="margin-left: 3px">Danh mục</label><br> <input
					type="checkbox"><label style="margin-left: 3px">Sản
					phẩm</label>
			</div>
			<div style="margin-left: 25px">
				<input type="checkbox"><label style="margin-left: 3px">Quản
					trị giao diện</label><br> <input type="checkbox"><label
					style="margin-left: 3px">Hình ảnh</label><br> <input
					type="checkbox"><label style="margin-left: 3px">Hỗ
					trợ trực tuyến </label><br> <input type="checkbox"><label>Video</label><br>
				<input type="checkbox"><label style="margin-left: 3px">Nội
					dung khác</label>
			</div>
			<div style="margin-left: 25px">
				<input type="checkbox"><label style="margin-left: 3px">Quản
					trị thông tin</label><br> <input type="checkbox"><label
					style="margin-left: 3px">Danh sách đơn hàng</label><br> <input
					type="checkbox"><label style="margin-left: 3px">Khách
					hàng Liên hệ</label><br> <input type="checkbox"><label
					style="margin-left: 3px">Danh sách Điện thoại</label>
			</div>
			<div style="margin-left: 25px">
				<input type="checkbox"><label style="margin-left: 3px">Seo
					website</label><br> <input type="checkbox"><label
					style="margin-left: 3px">Seo cơ bản</label><br> <input
					type="checkbox"><label style="margin-left: 3px">Seo
					nâng cao</label>
			</div>
		</div>
		<div style="margin-left: 174px; margin-top: 15px">
			<button type="submit"
				style="background-color: #1E90FF; padding: 5px; border-radius: 6px; color: white; border: none">Thêm</button>
			<a><button
					style="background-color: #1E90FF; padding: 5px; border-radius: 6px; margin-left: 20px; color: white; border: none">Thoát</button></a>
		</div>
	</form>
</div>
<!-- End of Body User -->
<!-- End of Main Content -->

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>