<%@page import="beans.LienHe"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Quản lý hỏi đáp</title>


</head>
<jsp:include page="header.jsp"></jsp:include>

<!-- Begin Page Content -->
<!-- Body User -->
<div class="container-fluid">


	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Quản Lí Hỏi Đáp</h1>
	<hr>
	<p class="mb-4">
		<a target="_blank" href="https://datatables.net"></a>.
	</p>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div
			style="display: flex; justify-content: flex-end; text-align: right; padding: 10px 19px">
			<a
				href="http://localhost:8080/WebProject/ThongKeHoiDap?action=thongke">
				<button
					style="border: none; border-radius: 6px; padding: 8px; margin-right: 15px; background-color: #4e73df;">
					<i class="fas fa-plus" style="margin-right: 3px"></i> <span>Thống
						kê</span>
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
				action="http://localhost:8080/WebProject/AdminQuanLiHoiDap?run=xoafull"
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
							<th>STT</th>

							<th>Email</th>
							<th>Ngày gởi</th>
							<th>Nội dung</th>
							<th style="text-align: center;">Xóa</th>
							<th style="text-align: center;">Tác vụ</th>
						</tr>
					</thead>
					<%
						int count = 0;
						ArrayList<LienHe> list = (ArrayList<LienHe>) request.getAttribute("listlienhe");
						for (int i = 0; i < list.size(); i++) {
							count++;
					%>
					<tbody>
						<tr>
							<td><%=count%></td>
							<td><%=list.get(i).getEmail()%></td>
							<td><%=list.get(i).getNgayGui()%></td>
							<td><%=list.get(i).getNoiDung()%></td>
							<td style="text-align: center; line-height: inherit;"><a
								href="http://localhost:8080/WebProject/AdminQuanLiHoiDap?run=xoa&index=<%=list.get(i).getId()%>">
									<i class="fas fa-trash-alt"
									style="width: 20px; height: 20px; margin-top: 15px"></i>
							</a></td>

							<th style="text-align: center;"><a
								href="http://localhost:8080/WebProject/AdminQuanLiHoiDap?run=traloi&index=<%=list.get(i).getId()%>">
									<i
									style="text-transform: capitalize; font-weight: 400; text-decoration: underline; border: none; outline: none; background: none; color: #05a; font-size: 16px;"><%=list.get(i).getTrangThai()%></i>
							</a></th>


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
<!-- End of Body User -->
<!-- End of Main Content -->
<script type="text/javascript">
	function deleteAllFunction() {
		let r = confirm("Bạn có chắc chắn muốn sử dụng chức năng này");
		if (r == true) {
			document.getElementById("submitDeleteAll").submit();
		}
	}
</script>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>