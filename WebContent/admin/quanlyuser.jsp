
<%@page import="database.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>


<title>Quanlyuser</title>


</head>
<jsp:include page="header.jsp"></jsp:include>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Quản Lí User</h1>
	<p class="mb-4">
		<a target="_blank" href="https://datatables.net"></a>.
	</p>
	<!-- Data Example -->
	<div class="card shadow mb-4">

		<div
			style="display: flex; justify-content: flex-end; text-align: right; padding: 10px 19px">
			<a
				href="http://localhost:8080/WebProject/UserAdminView?action=AddOrEdit">
				<button
					style="border: none; border-radius: 6px; padding: 8px; margin-right: 15px; background-color: #4e73df;">
					<i class="fas fa-plus" style="margin-right: 3px"></i> <span>Thêm</span>
				</button>
			</a>
			<button onclick="deleteAllFunction()"
				style="border: none; border-radius: 6px; padding: 8px; margin-right: 15px; background-color: #e74a3b;">
				<i class="fas fa-trash" style="margin-right: 5px"></i> <span>Xóa
					tất cả</span>
			</button>
			<button
				style="border: none; border-radius: 6px; padding: 8px; background-color: #1cc88a;">
				<i class="fas fa-file-upload" style="margin-right: 5px"></i> <span>Import
					to Excel</span>
			</button>
			<form
				action="http://localhost:8080/WebProject/UserAdminView?action=DeleteAll"
				method="post" id="submitDeleteAll"></form>
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
							<th>ID</th>
							<th>Username</th>
							<th>Mật khẩu</th>
							<th style="text-align: center;">Quyền hạn</th>
							<th style="text-align: center;">Xóa</th>
							<th style="text-align: center;">Sửa</th>
							<th style="text-align: center;">Chi tiết</th>
						</tr>
					</thead>

					<tbody>
						<%
							ArrayList<User> list2 = (ArrayList) request.getAttribute("Listcustomer");;
							for (int i = 0; i < list2.size(); i++) {
						%>
						<tr>
							<td><%=list2.get(i).getID()%></td>
							<td><%=list2.get(i).getUsername()%></td>
							<td><input type="password"
								value=<%=list2.get(i).getPassword()%> style="border: hidden"></td>
							<td style="text-align: center;"><%=list2.get(i).getQuyen()%></td>
							<td style="text-align: center; line-height: inherit;"><a
								href="http://localhost:8080/WebProject/UserAdminView?action=Delete&id=<%=list2.get(i).getID()%>">

									<i class="fas fa-trash-alt"
									style="width: 20px; height: 20px; margin-top: 15px"></i>
							</a></td>

							<td style="text-align: center; line-height: inherit;"><a
								href="http://localhost:8080/WebProject/UserAdminView?action=edit&id=<%=list2.get(i).getID()%>"><i class="fas fa-tools"
									style="width: 20px; height: 20px; margin-top: 15px"></i></a></td>
							<th style="text-align: center; line-height: inherit;"><a
								href="http://localhost:8080/WebProject/UserAdminView?action=Detail&id=<%=list2.get(i).getID()%>"><i
									class="fas fa-info-circle"
									style="width: 20px; height: 20px; margin-top: 15px"></i></a></th>


						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<script type="text/javascript">
	function deleteAllFunction() {
		let r = confirm("Bạn có chắc chắn sử dụng hành động này");
		if (r == true) {
			document.getElementById("submitDeleteAll").submit();
		}
	}
</script>
<!-- End of Main Content -->

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>