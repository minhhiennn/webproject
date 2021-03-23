<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
</head>
<body>
	<!-- HEADER AREA -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- BODY -->
	<%
		String err = (String) request.getAttribute("err");
	%>
	<form action="http://localhost:8080/WebProject/RegisterServlet"
		method="get">
		<div class="containerRegister">
			<h1>Đăng ký</h1>
			<p>Làm ơn điền vào mục dưới đây để tạo tài khoản</p>
			<hr>

			<label for="email"><b>Email</b></label> <input type="text"
				placeholder="Nhập Email" name="email" id="email" required> <label
				for="psw"><b>Mật khẩu</b></label> <input type="password"
				placeholder="Nhập mật khẩu" name="psw" id="psw" required> <label
				for="psw-repeat"><b>Nhập lại mật khẩu</b></label> <input
				type="password" placeholder="Nhập lại mật khẩu" name="psw-repeat"
				id="psw-repeat" required>
			<%
				if (err != null && err.equalsIgnoreCase("this username has already used")) {
			%>
			<span style="color: red">Tên người dùng này đã được sử dụng</span>
			<%
				} else if (err != null && err.equalsIgnoreCase("That password doesn't match. Try again")) {
			%>
			<span style="color: red">Mật khẩu đó không khớp. Hãy thử lại</span>
			<%
				} else if (err != null && err.equalsIgnoreCase("invalid email")) {
			%>
			<span style="color: red">Email không hợp lệ</span>
			<%
				}
			%>
			<hr>

			<p>
				Bạn đã đồng ý với điều khoản này <a href="#">Terms & Privacy</a>.
			</p>
			<button type="submit" class="registerbtn">Đăng ký</button>
		</div>

		<div class="container signin" style="width: 100%">
			<p>
				Đã có tài khoản? <a
					href="http://localhost:8080/WebProject/user/login.jsp">Đăng
					nhập</a>.
			</p>
		</div>
	</form>
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>