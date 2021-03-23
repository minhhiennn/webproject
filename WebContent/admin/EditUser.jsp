<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.User"%>
<!DOCTYPE html>
<html>
<head>

<title>ChiTietUser</title>

</head>
<jsp:include page="header.jsp"></jsp:include>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800"></h1>
	<div class="col-lg-6 mb-4">
		<%
			User user = (User) request.getAttribute("user");
			String err = (String) request.getAttribute("err");
		%>
		<form
			action="http://localhost:8080/WebProject/UserAdminView?userID=<%=user.getID()%>"
			method="post">
			<!-- Illustrations -->
			<div class="card shadow mb-4" style="width: 205%;">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Thông tin chung</h6>
				</div>
				<div class="card-body">
					<div>
						<span style="padding-right: 93px;">ID tài khoản:</span> <input
							type="text" value=<%=user.getID()%>
							style="width: 600px; padding: 3px" disabled="disabled">
					</div>
					<hr>
					<div>
						<span style="padding-right: 84px;">Tên tài khoản:</span> <input
							type="text" value=<%=user.getUsername()%>
							style="width: 600px; padding: 3px" name="username"
							required="required">
						<%
							if (err != null) {
						%>
						<br>
						<span style="color: red">Email không hợp lệ</span>
						<%
							}
						%>
					</div>
					<hr>
					<div>
						<span style="padding-right: 112px;">Mật khẩu:</span> <input
							type="text" value=<%=user.getPassword()%>
							style="width: 600px; padding: 3px" name="password"
							required="required">
					</div>
					<hr>
					<div>
						<span style="padding-right: 134px;">quyền:</span> <input
							type="text" value=<%=user.getQuyen()%>
							style="width: 600px; padding: 3px" name="quyen"
							required="required">
					</div>
				</div>
			</div>

			<!-- Approach -->
			<div class="card shadow mb-4" style="width: 205%;">
				<div class="card-body">
					<div style="padding-left: 177px">
						<button type="submit" value="saveEdit" name="action"
							style="border: none; background-color: #36b9cc; border-radius: 6px; margin-right: 10px">Lưu</button>
						<button type="submit" value="List" name="action"
							style="border: none; background-color: #36b9cc; border-radius: 6px;">Thoát</button>
					</div>
				</div>
			</div>
		</form>
	</div>

</div>
<!-- /.container-fluid -->

<!-- End of Main Content -->

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>