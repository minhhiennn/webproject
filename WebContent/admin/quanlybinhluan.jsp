<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="beans.Comment"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>quanlybinhluan</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<!-- Begin Page Content -->
<!-- Body User -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Quản Lí Bình Luận</h1>
	<hr>
	<p class="mb-4">
		<a target="_blank" href="https://datatables.net"></a>.
	</p>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div
			style="display: flex; justify-content: flex-end; text-align: right; padding: 10px 19px">
			<a href="http://localhost:8080/WebProject/admin/Thongkebinhluan.jsp">
				<button
					style="border: none; border-radius: 6px; padding: 8px; margin-right: 15px; background-color: #4e73df;">
					<i class="fas fa-plus" style="margin-right: 3px"></i> <span>Thống
						kê</span>
				</button>
			</a>
			<button onclick="deleteAllFunction()"
				style="border: none; border-radius: 6px; padding: 8px; margin-right: 15px; background-color: #e74a3b;">
				<i class="fas fa-trash" style="margin-right: 5px"></i> <span
					id="deleteSpan">Xóa tất cả</span>
			</button>
			<button
				style="border: none; border-radius: 6px; padding: 8px; background-color: #1cc88a;">
				<i class="fas fa-file-upload" style="margin-right: 5px"></i> <span>Import
					to Excel</span>
			</button>
			<form
				action="http://localhost:8080/WebProject/AdminQuanLyBinhLuan?action=deleteAll"
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
							<th>Tên Khách Hàng</th>
							<th>Ngày gởi</th>
							<th style="text-align: center;">Nội dung</th>
							<th style="text-align: center;">ID Sản Phẩm</th>
							<th style="text-align: center;">Xóa</th>
						</tr>
					</thead>

					<tbody>
						<%
							List<Comment> list = (ArrayList<Comment>) request.getAttribute("list");
							for (int i = 0; i < list.size(); i++) {
						%>

						<tr>
							<td><%=list.get(i).getID()%></td>
							<td><%=list.get(i).getTennguoigui()%></td>
							<td><%=list.get(i).getNgaygui()%></td>
							<td><%=list.get(i).getBinhluan()%></td>
							<td style="text-align: center;"><%=list.get(i).getProduct_id()%></td>

							<th style="text-align: center; line-height: inherit;"><a
								href="http://localhost:8080/WebProject/AdminQuanLyBinhLuan?action=deletecomment&productID=<%=list.get(i).getProduct_id()%>&commentID=<%=list.get(i).getID()%>"><i
									class="fas fa-trash-alt"
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
<script type="text/javascript">
	function deleteAllFunction() {
		let r = confirm("Bạn có chắc chắn sử dụng hành động này");
		if (r == true) {
			document.getElementById("submitDeleteAll").submit();
		}
	}
</script>
<!-- End of Body User -->

<!-- End of Main Content -->

<!-- Footer --><jsp:include page="footer.jsp"></jsp:include>
</body>
</html>