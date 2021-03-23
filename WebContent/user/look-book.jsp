<%@page import="database.ProductDao"%>
<%@page import="beans.Img"%>
<%@page import="beans.WishList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.WishListItem"%>
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
<title>Danh sách yêu thích</title>
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
				<li><a href="#">Trang Chủ</a></li>
				<li><a href="#">Trang</a></li>
				<li>Danh Sách Yêu Thích</li>
			</ul>
		</div>
	</div>
	<!-- Look Book AREA -->
	<%
		WishList wishList = (WishList) session.getAttribute("wishlist");
	%>
	<div class="look-book-area fix">
		<%
			if (wishList.getList().size() != 0) {
		%>
		<div id="owl-look-book" class="owl-carousel">
			<%
				ArrayList<WishListItem> list = wishList.getList();
					for (int i = 0; i < list.size(); i++) {
						ArrayList<Img> listImg = new ProductDao().getImgByProductID(list.get(i).getProduct().getID());
			%>
			<div class="single-look">
				<div class="single-look-img">
					<a href="#"> <img class="parimary"
						src=<%=listImg.get(0).getFileImg()%> alt="look" style="width: 318px;height: 350px;"> <img
						class="secondary" src=<%=listImg.get(1).getFileImg()%> alt="look" style="width: 318px;height: 350px;">
					</a>
				</div>
				<div class="single-look-action">
					<a href="http://localhost:8080/WebProject/AddToCartAndDeleteController?productID=<%=list.get(i).getID()%>&action=AddToCart">Add To Cart</a>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<%
			} else if (wishList.getList().size() == 0) {
		%>
		<div style="text-align: center">
			<div style="width: 100%; height: 100px;">
				<img alt="giohangtrong"
					src="http://localhost:8080/WebProject/user/img/giohangtrong.png"
					width="120" height="120">
			</div>
			<div style="margin-top: 1.125rem">Wish List của bạn còn trống</div>
		</div>
		<%
			}
		%>
	</div>
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
