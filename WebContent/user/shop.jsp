<%@page import="database.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.Img"%>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if lt IE 7 ]> <html lang="en" class="ie6">    <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7">    <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8">    <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9">    <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html class="no-js" lang="">
<head>
<title>b-Sale | Shop List</title>
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
				<li>Shop</li>
			</ul>
		</div>
	</div>
	<!-- Product Item AREA -->
	<div class="product-item-area">
		<div class="container">
			<div class="row">
				<jsp:include page="menu/Shopmenu.jsp"></jsp:include>
				<div class="col-md-9 col-sm-8">
					<div class="product-item-list">
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<div class="product-item-heading">
									<div class="item-heading-title">
										<h2>Sản phẩm hot</h2>
									</div>
									<div class="result-short-view">
										<div class="result-short">
											<p>Hiển thị 9 sản phẩm 1 page</p>
											<div class="result-short-selection">
												<select>
													<option>Mặc định phân loại</option>
													<option>Sắp xếp theo tên từ A đến Z</option>
													<option>Sắp xếp theo tên từ Z đến A</option>
													<option>Sắp xếp theo giá thấp đến cao</option>
													<option>Sắp xếp theo giá cao đến thấp</option>
												</select> <i class="fa fa-sort-alpha-asc"></i>
											</div>
										</div>
										<div class="view-mode">
											<a href="shop.html" class="active"><i
												class="fa fa-th-large"></i></a> <a href="single-shop.html"><i
												class="fa fa-th-list"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<%
								ArrayList<Product> list = new ProductDao().getListProductByType("aokhoacnam");
								for (int i = 0; i < 3; i++) {
									ArrayList<Img> listImg = new ProductDao().getImgByProductID(list.get(i).getID());
							%>
							<div class="col-md-4 col-sm-6">
								<div class="single-item-area">
									<div class="single-item">
										<div class="product-item-img">
											<a href="http://localhost:8080/WebProject/SingleProductServlet?productID=<%=list.get(i).getID()%>&index=1"> <img class="primary-img"
												src=<%=listImg.get(0).getFileImg()%> alt="item"
												 style="width: 264px; height: 296px;"> <img 
												class="secondary-img" src=<%=listImg.get(1).getFileImg()%> 
												alt="item" style="width: 264px; height: 296px;" >
											</a>
											<div class="product-item-action">
												<a href="http://localhost:8080/WebProject/SingleProductServlet?productID=<%=list.get(i).getID()%>&index=1"><i class="fa fa-external-link"></i></a> <a
													href="http://localhost:8080/WebProject/AddToCartAndDeleteController?productID=<%=list.get(i).getID()%>&action=AddToCart"><i class="fa fa-shopping-cart"></i></a>
											</div>
										</div>
										<div class="single-item-content">
											<h2>
												<a href="#"><%=list.get(i).getName()%></a>
											</h2>
											<div class="best-product-rating">
												<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
													class="fa fa-star"></i></a> <a href="#"><i
													class="fa fa-star"></i></a> <a href="#"><i
													class="fa fa-star"></i></a> <a href="#"><i
													class="fa fa-star"></i></a>
											</div>
											<h3><%=list.get(i).getPrice() + " VNĐ"%></h3>
										</div>
									</div>
									<div class="item-action-button fix">
										<a href="http://localhost:8080/WebProject/AddToCartAndDeleteController?productID=<%=list.get(i).getID()%>&action=AddToCart">Thêm vào giỏ</a>
										<div class="item-action-icon">
											<a href="http://localhost:8080/WebProject/AddToWishListController?productID=<%=list.get(i).getID()%>"><i class="fa fa-heart"></i></a> <a href="#"><i
												class="fa fa-signal"></i></a> <a href="#"><i
												class="fa fa-search"></i></a>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
							<%
								ArrayList<Product> list2 = new ProductDao().getListProductByType("aokhoacnu");
								for (int i = 0; i < 3; i++) {
									ArrayList<Img> listImg2 = new ProductDao().getImgByProductID(list2.get(i).getID());
							%>
							<div class="col-md-4 col-sm-6">
								<div class="single-item-area">
									<div class="single-item">
										<div class="product-item-img">
											<a href="http://localhost:8080/WebProject/SingleProductServlet?productID=<%=list2.get(i).getID()%>&index=1"> <img class="primary-img"
												src=<%=listImg2.get(0).getFileImg()%> alt="item"
												style="width: 264px; height: 296px;"> <img
												class="secondary-img" src=<%=listImg2.get(1).getFileImg()%>
												alt="item" style="width: 264px; height: 296px;">
											</a>
											<div class="product-item-action">
												<a href="http://localhost:8080/WebProject/SingleProductServlet?productID=<%=list2.get(i).getID()%>&index=1"><i class="fa fa-external-link"></i></a> <a
													href="http://localhost:8080/WebProject/AddToCartAndDeleteController?productID=<%=list2.get(i).getID()%>&action=AddToCart"><i class="fa fa-shopping-cart"></i></a>
											</div>
										</div>
										<div class="single-item-content">
											<h2>
												<a href="#"><%=list2.get(i).getName()%></a>
											</h2>
											<div class="best-product-rating">
												<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
													class="fa fa-star"></i></a> <a href="#"><i
													class="fa fa-star"></i></a> <a href="#"><i
													class="fa fa-star"></i></a> <a href="#"><i
													class="fa fa-star"></i></a>
											</div>
											<h3><%=list2.get(i).getPrice() + " VNĐ"%></h3>
										</div>
									</div>
									<div class="item-action-button fix">
										<a href="http://localhost:8080/WebProject/AddToCartAndDeleteController?productID=<%=list2.get(i).getID()%>&action=AddToCart">Thêm vào giỏ</a>
										<div class="item-action-icon">
											<a href="http://localhost:8080/WebProject/AddToWishListController?productID=<%=list2.get(i).getID()%>"><i class="fa fa-heart"></i></a> <a href="#"><i
												class="fa fa-signal"></i></a> <a href="#"><i
												class="fa fa-search"></i></a>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
							<%
								ArrayList<Product> list3 = new ProductDao().getListProductByType("begai5tuoi");
								for (int i = 0; i < 3; i++) {
									ArrayList<Img> listImg3 = new ProductDao().getImgByProductID(list3.get(i).getID());
							%>
								<div class="col-md-4 col-sm-6">
								<div class="single-item-area">
									<div class="single-item">
										<div class="product-item-img">
											<a href="http://localhost:8080/WebProject/SingleProductServlet?productID=<%=list3.get(i).getID()%>&index=1"> <img class="primary-img"
												src=<%=listImg3.get(0).getFileImg()%> alt="item"
												style="width: 264px; height: 296px;"> <img
												class="secondary-img" src=<%=listImg3.get(1).getFileImg()%>
												alt="item" style="width: 264px; height: 296px;">
											</a>
											<div class="product-item-action">
												<a href="http://localhost:8080/WebProject/SingleProductServlet?productID=<%=list3.get(i).getID()%>&index=1"><i class="fa fa-external-link"></i></a> <a
													href="http://localhost:8080/WebProject/AddToCartAndDeleteController?productID=<%=list3.get(i).getID()%>&action=AddToCart"><i class="fa fa-shopping-cart"></i></a>
											</div>
										</div>
										<div class="single-item-content">
											<h2>
												<a href="#"><%=list3.get(i).getName()%></a>
											</h2>
											<div class="best-product-rating">
												<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
													class="fa fa-star"></i></a> <a href="#"><i
													class="fa fa-star"></i></a> <a href="#"><i
													class="fa fa-star"></i></a> <a href="#"><i
													class="fa fa-star"></i></a>
											</div>
											<h3><%=list3.get(i).getPrice() + " VNĐ"%></h3>
										</div>
									</div>
									<div class="item-action-button fix">
										<a href="http://localhost:8080/WebProject/AddToCartAndDeleteController?productID=<%=list3.get(i).getID()%>&action=AddToCart">Thêm vào giỏ</a>
										<div class="item-action-icon">
											<a href="http://localhost:8080/WebProject/AddToWishListController?productID=<%=list3.get(i).getID()%>"><i class="fa fa-heart"></i></a> <a href="#"><i
												class="fa fa-signal"></i></a> <a href="#"><i
												class="fa fa-search"></i></a>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>
					<div class="shop-pagination floatright">
						<ul class="pagination">
							<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
