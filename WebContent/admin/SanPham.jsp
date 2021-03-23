<%@page import="database.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.Product"%>
<%@ page import="beans.Img"%>
<!DOCTYPE html>
<html>
<head>
<title>SanPham</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Danh Sách Sản Phẩm</h1>
	<hr>
	<p class="mb-4">
		<a target="_blank" href="https://datatables.net"></a>.
	</p>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div
			style="display: flex; justify-content: flex-end; text-align: right; padding: 10px 19px">
			<a href="http://localhost:8080/WebProject/admin/ThemSanPham.jsp">
				<button
					style="border: none; border-radius: 6px; padding: 8px; margin-right: 15px; background-color: #4e73df;">
					<i class="fas fa-plus" style="margin-right: 3px"></i> <span>Thêm
					</span>
				</button>
			</a>
			<button onclick="deleteAll()"
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
				action="http://localhost:8080/WebProject/AdminQuanLySanPham?action=deleteAll"
				method="post" id="deleteAll"></form>
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
							<th>Tên sản phẩm</th>
							<th style="text-align: center;">Ảnh</th>
							<th>Giá</th>
							<th style="text-align: center;">Xóa</th>
							<th style="text-align: center;">Sửa</th>
							<th style="text-align: center;">Chi tiết</th>

						</tr>
					</thead>
					<%
						ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
					%>
					<tbody>
						<%
							for (int i = 0; i < list.size(); i++) {
								ArrayList<Img> listImg = new ProductDao().getImgByProductID(list.get(i).getID());
						%>
						<tr>
							<td><%=list.get(i).getID()%></td>
							<td><%=list.get(i).getName()%></td>
							<td style="text-align: center;"><img alt=""
								src=<%=listImg.get(0).getFileImg()%>
								style="width: 50px; height: 50px"></td>
							<td><%=list.get(i).getPrice()%></td>
							<td style="text-align: center; line-height: inherit;"><a
								href="http://localhost:8080/WebProject/AdminQuanLySanPham?action=delete&productID=<%=list.get(i).getID()%>"><i
									class="fas fa-trash-alt"
									style="width: 20px; height: 20px; margin-top: 15px"></i></a></td>

							<td style="text-align: center; line-height: inherit;"><a
								href="http://localhost:8080/WebProject/AdminQuanLySanPham?action=edit&productID=<%=list.get(i).getID()%>"><i
									class="fas fa-tools"
									style="width: 20px; height: 20px; margin-top: 15px"></i></a></td>
							<th style="text-align: center; line-height: inherit;"><a
								href="http://localhost:8080/WebProject/AdminQuanLySanPham?action=view&productID=<%=list.get(i).getID()%>"><i class="fas fa-info-circle"
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
	function deleteAll() {
		let r = confirm("Bạn có chắc chắn sử dụng hành động này");
		if (r == true) {
			document.getElementById("deleteAll").submit();
		}
	}
</script>
<!-- End of Main Content -->
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>