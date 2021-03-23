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
		%>
		<form
			action="http://localhost:8080/WebProject/UserAdminView?action=List"
			method="post">
			<!-- Illustrations -->
			<div class="card shadow mb-4" style="width: 205%;">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Thông tin chung</h6>
				</div>
				<div class="card-body">
					<div>
						<span style="padding-right: 93px;">ID tài khoản:</span> <input
							type="text" value=<%=user.getID()%> name="productID"
							style="width: 600px; padding: 3px" disabled="disabled">
					</div>
					<hr>
					<div>
						<span style="padding-right: 84px;">Tên tài khoản:</span> <input
							type="text" value=<%=user.getUsername()%>
							style="width: 600px; padding: 3px" name="productName"
							disabled="disabled">
					</div>
					<hr>
					<div>
						<span style="padding-right: 112px;">Mật khẩu:</span> <input
							type="text" value=<%=user.getPassword()%>
							style="width: 600px; padding: 3px" name="productType"
							disabled="disabled">
					</div>
					<hr>
					<div>
						<span style="padding-right: 134px;">quyền:</span> <input
							type="text" value=<%=user.getQuyen()%>
							style="width: 600px; padding: 3px" name="thuocnhom"
							disabled="disabled">
					</div>
				</div>
			</div>

			<!-- Approach -->
			<div class="card shadow mb-4" style="width: 205%;">
				<div class="card-body">
					<div style="padding-left: 177px">
						<button type="submit"
							style="border: none; background-color: #36b9cc; border-radius: 6px; margin-right: 10px">Thoát</button>
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