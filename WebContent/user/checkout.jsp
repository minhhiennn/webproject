<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="database.ProductDao"%>
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
<title>Thanh toán</title>
</head>
<body class="">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- HEADER AREA -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Breadcurb AREA -->
	<%
		Cart cart = (Cart) session.getAttribute("cart");
	%>
	<div class="breadcurb-area">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="index.html">Trang Chủ</a></li>
				<li><a href="#">Trang</a></li>
				<li>Thanh Toán</li>
			</ul>
		</div>
	</div>
	<!-- Checkout AREA -->
	<div class="checkout-area">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-sm-7">
					<div class="billing-address">
						<div class="checkout-head">
							<h2>Địa Chỉ Thanh Toán</h2>
							<p></p>
						</div>
						<div class="checkout-form">
							<form action="http://localhost:8080/WebProject/CheckOutServlet?action=checkout" method="post" class="form-horizontal" id="formcheckout">
								<div class="form-group">
									<label class="control-label col-md-3"> Quốc Gia <sup>*</sup>
									</label>
									<div class="col-md-9">
										<select name = "country" form="formcheckout">
											<option value = "Việt Nam">Việt Nam</option>
											<option value = "Châu Mỹ">Châu Mỹ</option>
											<option value = "Nhật">Nhật</option>
											<option value = "Trung Quốc">Trung Quốc</option>
											<option value = "Lào">Lào</option>
											<option value = "Pháp">Pháp</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> Họ Và Tên <sup>*</sup>
									</label>
									<div class="col-md-9">
										<input type="text" class="form-control" name ="name" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> Địa Chỉ <sup>*</sup>
									</label>
									<div class="col-md-9">
										<input type="text" class="form-control" name="address" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> Thị Trấn / Thành
										Phố <sup>*</sup>
									</label>
									<div class="col-md-9">
										<input type="text" class="form-control" name="city" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> Số Điện Thoại <sup>*</sup>
									</label>
									<div class="col-md-9">
										<input type="text" class="form-control" name="phone" required="required">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-5">
					<div class="review-order">
						<div class="checkout-head">
							<h2>Xem Lại Đơn Hàng Của Bạn</h2>
						</div>
						<%
							ArrayList<CartItem> list = cart.getList();
							for (int i = 0; i < list.size(); i++) {
								ArrayList<Img> listImg = new ProductDao().getImgByProductID(list.get(i).getProduct().getID());
						%>
						<div class="single-review">
							<div class="single-review-img">
								<a href="#"><img src=<%=listImg.get(0).getFileImg()%> alt="review"
									style="height: 120px; width: 100px;"></a>
							</div>
							<div class="single-review-content fix">
								<h2>
									<a href="#"><%=list.get(i).getProduct().getName()%></a>
								</h2>
								<p>
									<span>số lượng :</span> <%=list.get(i).getSoLuong()%>
								</p>
								<h3><%=list.get(i).getPrice()+ " VNĐ" %></h3>
							</div>
						</div>
						<%
							}
						%>
						<div class="subtotal-area">
							<div class="subtotal-content fix">
								<h2 class="floatleft">Tổng chi phí</h2>
								<h2 class="floatright"><%=cart.getTotal() +" VNĐ" %></h2>
							</div>
							<div class="subtotal-content fix">
								<h2 class="floatleft">Tổng thu</h2>
								<h2 class="floatright"><%=cart.getTotal() +" VNĐ" %></h2>
							</div>
						</div>
						<div class="payment-method">
							<h2>Phương Thức Thanh Toán</h2>
							<div class="payment-checkbox">
								<input type="checkbox" checked> Chuyển Tiền Trực tiếp
								Qua Ngân Hàng
							</div>
							<p>Thực hiện thanh toán của bạn trực tiếp vào tài khoản ngân
								hàng của chúng tôi. Vui lòng sử dụng ID đơn đặt hàng của bạn làm
								tham chiếu thanh toán. Đơn đặt hàng của bạn sẽ không được giao
								cho đến khi tiền hết trong tài khoản của chúng tôi.</p>
							<div class="payment-checkbox">
								<input type="checkbox"> Thanh Toán Qua Payment <br>
								<input type="checkbox"> Thanh Toán Qua Paypal
							</div>
							<button type="submit" class="btn" form="formcheckout">Đặt Hàng</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
