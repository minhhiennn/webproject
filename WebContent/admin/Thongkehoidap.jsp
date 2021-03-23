<%@page import="beans.LienHe"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Thống kê hỏi đáp</title>

</head>
<jsp:include page="header.jsp"></jsp:include>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800"></h1>

	<div>
		<h1>Thống Kê Hỏi Đáp</h1>
		<hr>
	</div>
	<form
		action="http://localhost:8080/WebProject/ThongKeHoiDap?action=thongke"
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

		<span>Danh sách các hỏi đáp</span>

	</div>
	<div class="card shadow mb-4" style="margin-top: 10px">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>STT</th>
							<th>Ngày gởi</th>
							<th>Email</th>
							<th>Nội dung</th>
							<th style="text-align: center;">Xóa</th>
							<th style="text-align: center;">Trạng thái</th>
						</tr>
					</thead>

					<%
						String dateStart = (String) request.getAttribute("dateStart");
						String dateEnd = (String) request.getAttribute("dateEnd");
						ArrayList<LienHe> list = (ArrayList<LienHe>) request.getAttribute("listlienhe");
						int count = 0;
						for (int i = 0; i < list.size(); i++) {
							count++;
					%>
					<tbody>
						<tr>
							<td><%=count%></td>
							<td><%=list.get(i).getNgayGui()%></td>
							<td><%=list.get(i).getEmail()%></td>
							<td><%=list.get(i).getNoiDung()%></td>
							<td style="text-align: center; line-height: inherit;"><a
								href="http://localhost:8080/WebProject/ThongKeHoiDap?action=xoa&index=<%=list.get(i).getId()%>&dateStart=<%=dateStart%>&dateEnd=<%=dateEnd%>">
									<i class="fas fa-trash-alt"
									style="width: 20px; height: 20px; margin-top: 15px"></i>
							</a></td>

							<th style="text-align: center;"><a
								href="http://localhost:8080/WebProject/ThongKeHoiDap?action=traloi&index=<%=list.get(i).getId()%>&dateStart=<%=dateStart%>&dateEnd=<%=dateEnd%>"><button
										type="button"
										style="text-transform: capitalize; font-weight: 400; text-decoration: underline; border: none; outline: none; background: none; color: #05a; font-size: 16px;">
										<%=list.get(i).getTrangThai()%></i>
									</button></a></th>


						</tr>

					</tbody>
					<%
						}
					%>
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