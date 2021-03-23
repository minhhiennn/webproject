<%@page import="database.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if lt IE 7 ]> <html lang="en" class="ie6">    <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7">    <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8">    <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9">    <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html class="no-js" lang="">
<head>
<title>Giỏ hàng</title>
</head>
<body class="">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- HEADER AREA -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Breadcurb AREA -->
	<div class="breadcurb-area">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="index.html">Trang Chủ</a></li>
				<li><a href="#">Trang</a></li>
				<li>Mua Hàng</li>
			</ul>
		</div>
	</div>
	<!-- Chart AREA -->
	<%
		Cart cart = (Cart) session.getAttribute("cart");
		String err = (String) request.getAttribute("err");
	%>
	<div class="chart-area">
		<div class="container">
			<%
				if (cart.getList().size() != 0) {
			%>
			<div class="row">
				<div class="col-md-12">
					<div class="chart-item table-responsive fix">
						<table class="col-md-12">
							<thead>
								<tr>
									<th class="th-product">Sản Phẩm</th>
									<th class="th-details">Chi Tiết</th>
									<th class="th-qty">Số Lượng</th>
									<th class="th-price">Giá</th>
									<th class="th-total">Tổng Phụ</th>
									<th class="th-delate">Xóa</th>
								</tr>
							</thead>
							<tbody>
								<%
									ArrayList<CartItem> list = cart.getList();
										for (int i = 0; i < list.size(); i++) {
											ArrayList<Img> listImg = new ProductDao().getImgByProductID(list.get(i).getProduct().getID());
								%>
								<tr>
									<td class="th-product"><a href="#"><img
											src=<%=listImg.get(0).getFileImg()%> alt="cart"
											style="width: 165px; height: 197px;"></a></td>
									<td class="th-details">
										<h2>
											<a href="#"><%=list.get(i).getProduct().getName()%></a>
										</h2>
										<div class="best-product-rating"></div>

									</td>
									<td class="th-qty"><input type="number" min="0"
										name=<%=list.get(i).getProduct().getID()%> placeholder="0"
										value=<%=list.get(i).getSoLuong()%> form="update"></td>
									<td class="th-price"><%=list.get(i).getProduct().getPrice()%></td>
									<td class="th-total"><%=list.get(i).getPrice()%></td>
									<td class="th-delate"><a
										href="http://localhost:8080/WebProject/AddToCartAndDeleteController?productID=<%=list.get(i).getProduct().getID()%>&action=delete"><i
											class="fa fa-trash"></i></a></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
					<div class="cart-button">
						<button type="button" class="btn" name="continue">Tiếp
							Tục Mua Sắm</button>
						<form action="http://localhost:8080/WebProject/OnSubmitTest"
							method="get" id="update" class="btn floatright"
							style="padding: 0px; margin: 0px">
							<button type="submit" class="btn floatright">Cập Nhật
								Giỏ Hàng</button>
						</form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="cart-shopping-area fix">
					<div class="col-md-4 col-sm-4">
						<div class="calculate-shipping chart-all">
							<h2>Tính Toán Vận Chuyển</h2>
							<p>Nhập điểm đến của bạn để nhận ước tính vận chuyển.</p>
							<select>
								<option>Chọn Quốc Gia</option>
								<option>Mỹ</option>
								<option>Nhật</option>
								<option>trung quốc</option>


							</select> <select>
								<option>Thị Trấn/Thành Phố</option>
								<option>Hà Nội</option>
								<option>HCM</option>
								<option>Gajipur</option>
								<option>Kustiya</option>
								<option>Vola</option>
								<option>Gaibandha</option>
							</select> <input type="text" placeholder="Mã Bưu Điện">
							<button type="button" class="btn">Nhận Báo Giá</button>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="chart-all">
							<h2>Mã Khuyến Mãi</h2>
							<p>Nhập điểm đến của bạn để nhận ước tính vận chuyển.</p>
							<input type="text" placeholder="Mã Bưu Điện">
							<button type="button" class="btn">Nhận Báo Giá</button>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="shopping-summary chart-all">
							<div class="shopping-cost-area">
								<h2>Tóm Tắt giỏ Hàng</h2>
								<div class="shopping-cost">
									<div class="shopping-cost-left">
										<p>Tổng Phụ</p>
										<p>Tổng Cộng</p>
									</div>
									<div class="shopping-cost-right">
										<p><%=cart.getTotal() + " VND"%></p>
										<p><%=cart.getTotal() + " VND"%></p>
									</div>
								</div>
								<a href="http://localhost:8080/WebProject/KiemTraGioHang">
									<button type="button" class="btn">Tiến Hành Kiểm Tra</button>
								</a>
							</div>
							<%
								if (err != null) {
							%>
							<div style="margin-left: 142px">
								<span style="color: red">Vượt quá số lượng tồn kho</span>
							</div>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
			<%
				} else if (cart.getList().size() == 0) {
			%>
			<div style="text-align: center">
				<div style="width: 100%; height: 100px;">
					<img alt="giohangtrong"
						src="http://localhost:8080/WebProject/user/img/giohangtrong.png"
						width="120" height="120">
				</div>
				<div style="margin-top: 1.125rem">Giỏ hàng của bạn còn trống</div>
			</div>
			<%
				}
			%>
			<!-- ------------------------------------------------- -->
		</div>
	</div>
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
