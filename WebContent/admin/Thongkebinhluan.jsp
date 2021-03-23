<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.Comment"%>
<!DOCTYPE html>
<html>
<head>

<title>ThongKeBinhLuan</title>

</head>
<jsp:include page="header.jsp"></jsp:include>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800"></h1>

	<div>
		<h1>Thống Kê Bình Luận</h1>
		<hr>
	</div>
	<form
		action="http://localhost:8080/WebProject/AdminThongKeBinhLuan?action=thongke"
		method="post">
		<div style="display: flex; margin-top: 45px">
			<div style="margin-right: 45px">
				<h3>Thời gian bắt đầu:</h3>
				<input type="date" name="dateStart">

			</div>
			<div style="margin-right: 60px">
				<h3>Thời gian kết thúc:</h3>
				<input type="date" name="dateEnd">
			</div>
			<div>
				<button type="submit"
					style="margin-top: 37px; border: none; background-color: #4e73df; border-radius: 6px; padding: 5px">Thống
					kê</button>
			</div>
		</div>
	</form>
	<div
		style="border-radius: 6px; text-align: center; padding: 10px; margin-top: 10px; color: white; background-color: #36b9cc">

		<span>Danh sách các bình luận</span>

	</div>
	<%
		ArrayList<Comment> list = (ArrayList<Comment>) request.getAttribute("list");
	%>
	<div class="card shadow mb-4" style="margin-top: 10px">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>ID</th>
							<th>Tên Khách Hàng</th>
							<th>Ngày gởi</th>
							<th style="text-align: center;">Nội dung</th>
							<th style="text-align: center;">ID Sản Phẩm</th>
							<th style="text-align: center;">Xóa</th>
						</tr>
					</thead>
					<tbody>	
					<%
						if (list == null) {
					%>
				
						<tr>
						</tr>

					
					<%
						} else {
							String dateStart = (String) request.getAttribute("dateStart");
							String dateEnd = (String) request.getAttribute("dateEnd");
							for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getID()%></td>
						<td><%=list.get(i).getTennguoigui()%></td>
						<td><%=list.get(i).getNgaygui()%></td>
						<td><%=list.get(i).getBinhluan()%></td>
						<td style="text-align: center;"><%=list.get(i).getProduct_id()%></td>

						<th style="text-align: center; line-height: inherit;"><a
							href="http://localhost:8080/WebProject/AdminThongKeBinhLuan?action=delete&productID=<%=list.get(i).getProduct_id()%>&commentID=<%=list.get(i).getID()%>&dateStart=<%=dateStart%>&dateEnd=<%=dateEnd%>"><i
								class="fas fa-trash-alt"
								style="width: 20px; height: 20px; margin-top: 15px"></i></a></th>
					</tr>
					<%
						}
						}
					%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<!-- End of Main Content -->

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>