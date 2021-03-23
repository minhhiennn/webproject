<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Thay đổi mật khẩu</title>
</head>
<body>
	<!-- HEADER AREA -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- BODY -->
	<%
		String err = (String) request.getAttribute("err");
	%>
	<form action="http://localhost:8080/WebProject/NewPassword"
		method="get">
		<div class="containerRegister">
			<h1>LƯU Ý :</h1>
			<p>nhập email của bạn để chúng tôi cung cấp cho bạn một mật khẩu
				mới</p>
			<hr>

			<label for="email"><b>Mật khẩu mới</b></label> <input type="password"
				placeholder="Nhập mật khẩu mới" name="new-psw" id="psw" required>
			<label for="psw"><b>Email</b></label> <input type="text"
				placeholder="Nhập email" name="email" id="email" required> <label
				for="psw-repeat"><b>Nhập lại mật khẩu</b></label> <input
				type="password" placeholder="Nhập lại mật khẩu" name="psw" id="psw"
				required>
			<%
				if (err != null && err.equals("email is not available in database")) {
			%>
			<span style="color: red">email không tồn tại</span>
			<%
				} else if (err != null && err.equals("That password doesn't match. Try again")) {
			%>
			<span style="color: red">Mật khẩu đó không khớp. Hãy thử lại</span>
			<%
				}
			%>
			<hr>
			<button type="submit" class="registerbtn">Thay đổi mật khẩu</button>
		</div>
	</form>
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>