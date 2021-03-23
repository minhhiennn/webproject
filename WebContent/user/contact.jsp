<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if lt IE 7 ]> <html lang="en" class="ie6">    <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7">    <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8">    <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9">    <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html class="no-js" lang="">
<head>
<title>Contact</title>
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
				<li><a href="#">Trang chủ</a></li>
				<li>Liên hệ</li>
			</ul>
		</div>
	</div>
	<!-- Contact-us area -->
	<div class="contact-us-area">
		<div class="map-area">
			<div class="contact-map">
				<div id="googleMap"></div>
			</div>
		</div>
		<div class="contact-information">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<div class="contact-details">
							<div class="contact-head">
								<h2>Chi tiết liên hệ</h2>
								<p>Nếu bạn muốn mua hàng hay có vấn đề gì cần giải đáp vui
									lòng liên hệ với địa chỉ bên dưới hoặc đến trực tiếp cửa hàng
									.Chi tiết tại</p>
							</div>
							<div class="contact-bottom">
								<p>
									<span><i class="fa fa-phone"></i></span> Điện thoại: +84
									8345678102
								</p>
								<p>
									<span><i class="fa fa-envelope"></i></span> E-mail:
									quanaoxin@gmail.com
								</p>
								<p>
									<span><i class="fa fa-link"></i></span> Website: <a href="#">www.Quanaoxin.com</a>
								</p>
								<p>
									<span><i class="fa fa-map-marker"></i></span> Địa chỉ: 32, Hai
									Bà Trưng
								</p>
							</div>
							<div class="contact-social-icon footer-social-icon">
								<ul class="list-inline">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
									<li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
									<li><a href="#"><i class="fa fa-vimeo"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<%
						String message = (String) request.getAttribute("message");
					%>
					<div class="col-md-6 col-sm-6">
						<div class="contact-leave-message">
							<div class="contact-head">
								<h2>Để Lại Lời Nhắn</h2>
							</div>
							<form action="http://localhost:8080/WebProject/ContactUsServlet"
								method="get" class="form-horizontal">
								<div class="form-group col-md-6">
									<label class="control-label"> Chủ đề </label> <input
										type="text" class="form-control" name="chude">
								</div>
								<div class="form-group col-md-6">
									<label class="control-label"> E-mail </label> <input
										type="text" class="form-control" name="email">
								</div>
								<div class="form-group col-md-12">
									<label class="control-label"> Nội dung </label>
									<textarea rows="5" class="form-control" name="noidung"></textarea>
								</div>
								<button type="submit" class="btn">Gửi phản hồi</button><br><br>
								<%
									if (message != null) {
								%>
								<span style="color: red;margin-left: 15px;">Gửi phản hồi thành công, cảm ơn bạn đã luôn đồng hành cùng chúng tôi</span>
								<%
									}
								%>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Google Map js -->
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script>
		function initialize() {
			var mapOptions = {
				zoom : 15,
				scrollwheel : false,
				center : new google.maps.LatLng(10.8679007,106.7856724)
			};

			var map = new google.maps.Map(document.getElementById('googleMap'),
					mapOptions);

			 var marker = new google.maps.Marker({
	                position: map.getCenter(),
	                map: map
	              });
		}

		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
</body>
</html>
