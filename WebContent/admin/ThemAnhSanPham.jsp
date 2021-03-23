<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ThemAnhSanPham</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div class="container-fluid">
		<div class="col-lg-6 mb-4">
			<form
				action="http://localhost:8080/WebProject/AdminQuanLySanPham?action=saveAdd"
				method="post" enctype="multipart/form-data">
				<div class="card shadow mb-4" style="width: 205%;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Thông tin chung</h6>
					</div>
					<div class="card-body">
						<div style="display: flex;">
							<span style="padding-right: 120px; margin-top: 10px">Hình
								ảnh:</span>
							<div style="padding: 5px; border-radius: 3px; width: 600px">
								<input type="file" name="file" multiple="multiple"><span>Chọn
									3 file ảnh</span>
							</div>

						</div>
					</div>
				</div>
				<div class="card shadow mb-4" style="width: 205%;">
					<div class="card-body">
						<div style="padding-left: 195px">
							<button type="submit"
								style="border: none; background-color: #36b9cc; border-radius: 6px; margin-right: 10px">Lưu</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>