<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>ThemSanPham</title>

</head>
<jsp:include page="header.jsp"></jsp:include>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800"></h1>
	<div class="col-lg-6 mb-4">
		<form
			action="http://localhost:8080/WebProject/AdminQuanLySanPham?action=continue"
			method="post">
			<!-- Illustrations -->
			<div class="card shadow mb-4" style="width: 205%;">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Thông tin chung</h6>
				</div>
				<div class="card-body">
					<div>
						<span style="padding-right: 84px;">Tên sản phẩm:</span> <input
							type="text" style="width: 600px; padding: 3px" name="productName"
							required="required">
					</div>
					<hr>
					<div>
						<span style="padding-right: 80px;">Loại sản phẩm:</span> <input
							type="text" style="width: 600px; padding: 3px" name="productType"
							required="required">
					</div>
					<hr>
					<div>
						<span style="padding-right: 68px;">Nhóm sản phẩm:</span> <input
							type="text" style="width: 600px; padding: 3px" name="thuocnhom"
							required="required">
					</div>
					<hr>
					<div>
						<span style="padding-right: 160px;">Giá:</span> <input type="text"
							name="productPrice" style="width: 600px; padding: 3px"
							required="required">
					</div>
					<hr>
					<div>
						<span style="padding-right: 125px;">Tồn kho:</span> <input
							type="text" style="width: 600px; padding: 3px" name="tonkho"
							required="required">
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
					<div style="display: flex;">
						<div style="">
							<span style="padding-right: 137px;">Mô tả:</span>
						</div>
						<textarea rows="5" cols="72" name="description"
							required="required"></textarea>
					</div>
				</div>

			</div>
			<div class="card shadow mb-4" style="width: 205%;">
				<div class="card-body">
					<div style="padding-left: 177px">
						<button type="submit"
							style="border: none; background-color: #36b9cc; border-radius: 6px; margin-right: 10px">Tiếp theo</button>
						<a
							href="http://localhost:8080/WebProject/AdminQuanLySanPham?action=exitAdd"><button
								type="button"
								style="border: none; background-color: #36b9cc; border-radius: 6px;">Thoát</button></a>
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