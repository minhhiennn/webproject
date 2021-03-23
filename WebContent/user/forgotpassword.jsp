<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>forgot password</title>
</head>
<body>
	<!-- HEADER AREA -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- BODY -->
	<%
		String string = (String) request.getAttribute("forgotPassword");
	%>
	<div
		style="margin-left: 100px; padding-top: 30px; padding-bottom: 60px">
		<h1 style="margin-bottom: 20px; font-weight: bold;">Quên mật khẩu</h1>
		<form action="http://localhost:8080/WebProject/ForgotPasswordServlet?index=1"
			method="post">
			<div
				style="border: 1px solid white; width: 800px; padding: 25px; border-radius: 6px; background-color: #DCD9CD">
				<div style="display: block">
					<span style="margin-right: 13px; font-size: 16px">Địa chỉ
						Email</span> <span class="span"
						style="font-size: 30px; color: #c02222; display: inline; margin-right: 20px">*</span>
					<input type="email" autocomplete="email" name="email"
						style="width: 500px; height: 40px"><br><br>
					<%
						if (string != null) {
					%>
					<span style="color: red;margin-top: 30px; margin-left: 145px">Link xác nhận đã được gửi qua email của bạn</span>
					<%
						}
					%>
				</div>
				<div>
					<button type="submit" role="button" tabindex="2" accesskey="s"
						style="padding: 10px; margin-top: 30px; margin-left: 145px">Gửi link xác nhận</button>
				</div>
			</div>
		</form>
	</div>
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>