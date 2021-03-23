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
        <title>Quà tặng</title>
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
					<li>Quà tặng</li>
				</ul>
			</div>
		</div>
		<!-- Product Item AREA -->
		<div class="product-item-area">
			<div class="container">
				<div class="row" >
					<div style="float: right;"><img src="img/quatang.png" alt="" style="margin-right: -150px; margin-left: -40px;"></div>
					<jsp:include page="menu/Womenmenu.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<!-- Footer AREA -->
		<jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
