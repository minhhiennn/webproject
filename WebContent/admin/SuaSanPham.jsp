<%@page import="database.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.Product"%>
<%@ page import="beans.Img"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>SuaSanPham</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800"></h1>
	<div class="col-lg-6 mb-4">
		<%
			Product product = (Product) request.getAttribute("product");
			ArrayList<Img> listImg = new ProductDao().getImgByProductID(product.getID());
			String err = (String) request.getAttribute("err");
		%>
		<form
			action="http://localhost:8080/WebProject/AdminQuanLySanPham?productID=<%=product.getID()%>"
			method="post">
			<!-- Illustrations -->
			<div class="card shadow mb-4" style="width: 205%;">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Thông tin chung</h6>
				</div>
				<div class="card-body">
					<div>

						<span style="padding-right: 116px;">Hình ảnh:</span> <img
							alt="err" src=<%=listImg.get(0).getFileImg()%>
							style="width: 100px; height: 100px;"> <img alt="err"
							src=<%=listImg.get(1).getFileImg()%>
							style="width: 100px; height: 100px; margin-left: 75px"> <img
							alt="err" src=<%=listImg.get(2).getFileImg()%>
							style="width: 100px; height: 100px; margin-left: 75px">

					</div>
					<hr>
					<div>
						<span style="padding-right: 84px;">Tên sản phẩm:</span> <input
							type="text" value=<%=product.getName()%>
							style="width: 600px; padding: 3px" name="productName"
							required="required">
					</div>
					<hr>
					<div>
						<span style="padding-right: 80px;">Loại sản phẩm:</span> <input
							type="text" value=<%=product.getTypeproduct()%>
							style="width: 600px; padding: 3px" name="productType"
							disabled="disabled">
					</div>
					<hr>
					<div>
						<span style="padding-right: 68px;">Nhóm sản phẩm:</span> <input
							type="text" value=<%=product.getThuocnhom()%>
							style="width: 600px; padding: 3px" name="thuocnhom"
							disabled="disabled">
					</div>
					<hr>
					<div>
						<span style="padding-right: 93px;">ID sản phẩm:</span> <input
							type="text" value=<%=product.getID()%> name="productID"
							style="width: 600px; padding: 3px" disabled="disabled">
					</div>
					<hr>
					<div>
						<span style="padding-right: 160px;">Giá:</span> <input type="text"
							name="productPrice" value=<%=product.getPrice()%>
							style="width: 600px; padding: 3px" required="required">
							<%if(err != null && err.equalsIgnoreCase("errPrice")){ %>
							<br>
							<span style="color: red">Trường không hợp lệ</span>
							<%} %>
					</div>
					<hr>
					<div>
						<span style="padding-right: 125px;">Tồn kho:</span> <input
							type="text" value=<%=product.getSoLuongTonKho()%>
							style="width: 600px; padding: 3px" name="tonkho"
							required="required">
							<%if(err != null && err.equalsIgnoreCase("errTonkho")){ %>
							<br>
							<span style="color: red">Trường không hợp lệ</span>
							<%} %>
					</div>
				</div>
			</div>

			<!-- Approach -->
			<div class="card shadow mb-4" style="width: 205%">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Thông tin chung
						tiếp theo</h6>
				</div>
				<div class="card-body">
					<div>
						<span style="padding-right: 96px;">Link ảnh 1:</span> <input
							type="text" value=<%=listImg.get(0).getFileImg()%>
							style="width: 600px; padding: 3px" disabled="disabled">
					</div>
					<hr>
					<div>
						<span style="padding-right: 96px;">Link ảnh 2:</span> <input
							type="text" value=<%=listImg.get(1).getFileImg()%>
							style="width: 600px; padding: 3px" disabled="disabled">
					</div>
					<hr>
					<div>
						<span style="padding-right: 96px;">Link ảnh 3:</span> <input
							type="text" value=<%=listImg.get(2).getFileImg()%>
							style="width: 600px; padding: 3px" disabled="disabled">
					</div>
					<hr>
					<div style="display: flex;">
						<div style="">
							<span style="padding-right: 137px;">Mô tả:</span>
						</div>
						<textarea rows="5" cols="72" name="description"
							required="required"><%=product.getDescription()%></textarea>
					</div>
				</div>
			</div>
			<div class="card shadow mb-4" style="width: 205%;">
				<div class="card-body">
					<div style="padding-left: 177px">
						<button type="submit" value="saveEdit" name="action"
							style="border: none; background-color: #36b9cc; border-radius: 6px; margin-right: 10px">Lưu</button>
						<button type="submit" value="exitEdit" name="action"
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