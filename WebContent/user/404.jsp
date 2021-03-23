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
<title>Error 404</title>
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
				<li><a href="#">Trang</a></li>
				<li>404</li>
			</ul>
		</div>
	</div>
	<!-- 404 AREA -->
	<div class="not-found-area fix">
		<div class="container">
			<div class="not-found">
				<h1>Ồ ồ! Có vẻ như đã xảy ra sự cố</h1>
				<img src="img/404.jpg" alt="404">
				<h2>Trang không tồn tại</h2>
				<p>Xin lỗi nhưng chúng tôi không thể tìm thấy trang bạn đang tìm
					kiếm. Vui lòng kiểm tra để đảm bảo bạn đã nhập đúng URL. Bạn cũng
					có thể muốn tìm kiếm những gì bạn đang tìm kiếm.</p>
				<a href="index.html">Trở về trang chủ</a>
			</div>
		</div>
	</div>
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
