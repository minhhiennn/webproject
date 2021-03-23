<%@page import="database.ProductDao"%>
<%@page import="beans.Img"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.Product"%>
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
<title>Shop List</title>
</head>
<body class="">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- HEADER AREA -->
	<%
		ArrayList<Product> list;
		list = (ArrayList<Product>) request.getAttribute("list");
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Breadcurb AREA -->
	<div class="breadcurb-area">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#">Trang chủ</a></li>
				<li>Filter</li>
				<li>Phụ Nữ</li>
			</ul>
		</div>
	</div>
	<!-- Product Item AREA -->
	<%
		String title = (String) request.getAttribute("title");
	%>
	<div class="product-item-area">
		<div class="container">
			<div class="row">
				<jsp:include page="menu/Womenmenu.jsp"></jsp:include>
				<div class="col-md-9 col-sm-8">
					<div class="product-item-list">
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<div class="product-item-heading">
									<div class="item-heading-title">
										<h2><%=title%></h2>
									</div>
									<div class="result-short-view">
										<div class="result-short">
											<p>Hiển thị 9 sản phẩm 1 page</p>
											<%
												String productType = (String) request.getAttribute("typeProduct");
												String amount = (String) request.getAttribute("amount");
											%>
											<div class="result-short-selection">
												<select onchange="location = this.value;">
													<option value="">Mặc định phân loại</option>
													<option
														value="http://localhost:8080/WebProject/FilterSortServlet?productType=<%=productType%>&sortcode=AtoZ&nhom=women&title=<%=title%>&amount=<%=amount%>&index=1">Sắp
														xếp theo tên từ A đến Z</option>
													<option
														value="http://localhost:8080/WebProject/FilterSortServlet?productType=<%=productType%>&sortcode=ZtoA&nhom=women&title=<%=title%>&amount=<%=amount%>&index=1">Sắp
														xếp theo tên từ Z đến A</option>
													<option
														value="http://localhost:8080/WebProject/FilterSortServlet?productType=<%=productType%>&sortcode=lowtohigh&nhom=women&title=<%=title%>&amount=<%=amount%>&index=1">Sắp
														xếp theo giá thấp đến cao</option>
													<option
														value="http://localhost:8080/WebProject/FilterSortServlet?productType=<%=productType%>&sortcode=hightolow&nhom=women&title=<%=title%>&amount=<%=amount%>&index=1">Sắp
														xếp theo giá cao đến thấp</option>
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
								for (int i = 0; i < list.size(); i++) {
									ArrayList<Img> listImg = new ProductDao().getImgByProductID(list.get(i).getID());
							%>
							<div class="col-md-4 col-sm-6">
								<div class="single-item-area">
									<div class="single-item">
										<div class="product-item-img">
											<a
												href="http://localhost:8080/WebProject/SingleProductServlet?productID=<%=list.get(i).getID()%>&index=1">
												<img class="primary-img"
												src=<%=listImg.get(0).getFileImg()%> alt="item"
												style="width: 264px; height: 296px;"> <img
												class="secondary-img" src=<%=listImg.get(1).getFileImg()%>
												alt="item" style="width: 264px; height: 296px;">
											</a>
											<div class="product-item-action">
												<a
													href="http://localhost:8080/WebProject/SingleProductServlet?productID=<%=list.get(i).getID()%>&index=1"><i
													class="fa fa-external-link"></i></a> <a
													href="http://localhost:8080/WebProject/AddToCartAndDeleteController?productID=<%=list.get(i).getID()%>&action=AddToCart"><i
													class="fa fa-shopping-cart"></i></a>
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
											<h3><%=list.get(i).getPrice() + " VND"%></h3>
										</div>
									</div>
									<div class="item-action-button fix">
										<a
											href="http://localhost:8080/WebProject/AddToCartAndDeleteController?productID=<%=list.get(i).getID()%>&action=AddToCart">Thêm
											vào giỏ</a>
										<div class="item-action-icon">
											<a
												href="http://localhost:8080/WebProject/AddToWishListController?productID=<%=list.get(i).getID()%>"><i
												class="fa fa-heart"></i></a> <a href="#"><i
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
							<%
								int endPage = (Integer) request.getAttribute("endPage");
								for (int i = 0; i < endPage; i++) {
									String string = String.valueOf(i + 1);
							%>
							<li><a id=<%=string%>
								href="http://localhost:8080/WebProject/FilterServlet?index=<%=i + 1%>&amount=<%=amount%>&nhom=women&productType=<%=productType%>"><%=(i + 1)%></a></li>
							<%
								}
							%>

							<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		document.getElementById('${index}').style.color = "#FFB455";
	</script>
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
