<%@page import="database.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	page import="beans.User"%>
<%@ page import="beans.Cart"%>
<%@ page import="beans.CartItem"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/b10aab807b.js"></script>
<!-- Favicon
		============================================ -->
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost:8080/WebProject/user/img/favicon.jpg">

<!-- Fonts
		============================================ -->
<link
	href='https://fonts.googleapis.com/css?family=Raleway:400,700,600,500,300,800,900'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,400italic,500,300,300italic,500italic,700'
	rel='stylesheet' type='text/css'>

<!-- CSS  -->

<!-- Bootstrap CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/bootstrap.min.css">

<!-- font-awesome.min CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/font-awesome.min.css">

<!-- Mean Menu CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/meanmenu.min.css">

<!-- owl.carousel CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/owl.carousel.css">

<!-- owl.theme CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/owl.theme.css">

<!-- owl.transitions CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/owl.transitions.css">

<!-- Price Filter CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/jquery-ui.min.css">

<!-- nivo-slider css
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/nivo-slider.css">

<!-- animate CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/animate.css">

<!-- jquery-ui-slider CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/jquery-ui-slider.css">

<!-- normalize CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/normalize.css">

<!-- main CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/main.css">

<!-- style CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/style.css">

<!-- responsive CSS
		============================================ -->
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/responsive.css">

<script
	src="http://localhost:8080/WebProject/user/js/vendor/modernizr-2.8.3.min.js"></script>
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/login.css">
<link rel="stylesheet"
	href="http://localhost:8080/WebProject/user/css/register.css">
</head>
<%
	User currentUser = (User) (session.getAttribute("currentSessionUser"));
%>


<body class="home-one">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- HEADER AREA -->
	<div class="header-area">
		<div class="header-top-bar">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="header-top-left">
							<div class="header-top-menu">
								<ul class="list-inline">
									<li><img
										src="http://localhost:8080/WebProject/user/img/vietnam-lag.png"
										alt="flag"></li>
									<li class="dropdown"><a href="#" data-toggle="dropdown">Tiếng
											việt</a>
										<ul class="dropdown-menu">
											<li><a href="#">tiếng Anh</a></li>

										</ul></li>
									<li class="dropdown"><a href="#" data-toggle="dropdown">VND</a>

									</li>
								</ul>
							</div>
							<p>Xin chào quý khách!</p>
						</div>
					</div>

					<%
						if (currentUser == null) {
					%>
					<div class="col-md-8 col-sm-8 col-xs-12">
						<div class="header-top-right">
							<ul class="list-inline">
								<li><a
									href="http://localhost:8080/WebProject/user/login.jsp"><i
										class="fa fa-lock"></i>Đăng nhập</a></li>
								<li><a
									href="http://localhost:8080/WebProject/user/register.jsp"><i
										class="fa fa-pencil-square-o"></i>Đăng kí</a></li>
							</ul>
						</div>
					</div>
					<%
						} else if (currentUser != null && currentUser.getQuyen().equalsIgnoreCase("user")) {
					%>
					<%!public String userName(User currentUser) {
		String[] output = currentUser.getUsername().split("@");
		String userName = output[0];
		return userName;
	}%>
					<div class="col-md-8 col-sm-8 col-xs-12">
						<div class="header-top-right">
							<ul class="list-inline">
								<li><a
									href="http://localhost:8080/WebProject/user/Account.jsp"><i
										class="fa fa-user"></i><%=userName(currentUser)%> </a></li>
								<li><a
									href="http://localhost:8080/WebProject/WishListController"><i
										class="fa fa-heart"></i>sản phẩm yêu thích</a></li>
								<li><a
									href="http://localhost:8080/WebProject/user/checkout.jsp"><i
										class="fa fa-check-square-o"></i>Thanh Toán</a></li>
							</ul>
						</div>
					</div>

					<%
						} else if (currentUser != null && currentUser.getQuyen().equalsIgnoreCase("admin")) {
					%>

					<div class="col-md-8 col-sm-8 col-xs-12">
						<div class="header-top-right">
							<ul class="list-inline">
								<li><a
									href="http://localhost:8080/WebProject/user/Account.jsp"><i
										class="fa fa-user"></i><%=userName(currentUser)%> </a></li>
								<li><a
									href="http://localhost:8080/WebProject/WishListController"><i
										class="fa fa-heart"></i>sản phẩm yêu thích</a></li>
								<li><a
									href="http://localhost:8080/WebProject/user/checkout.jsp"><i
										class="fa fa-check-square-o"></i>Thanh Toán</a></li>
								<li><a
									href="http://localhost:8080/WebProject/AdminLogin?userID=<%=currentUser.getID()%>&action=loginfromuser"><i
										class="fas fa-user-cog"></i>Admin</a></li>
							</ul>
						</div>
					</div>

					<%
						}
					%>
				</div>
			</div>
		</div>
		<div class="header-bottom">
			<div class="container">
				<div class="row">
					<div class="col-md-2 col-sm-2 col-xs-12">
						<div class="header-logo">
							<a href="index.jsp"><img
								src="http://localhost:8080/WebProject/user/img/logo.png"
								alt="logo"></a>
						</div>
					</div>
					<div class="col-md-10 col-sm-10 col-xs-12">
						<div class="search-chart-list">
							<div class="catagori-menu">
								<ul class="list-inline">
									<li><i class="fa fa-search"></i></li>
									<li><select form="selectform" name="select">
											<option value="All Categories">Tất cả Sản Phẩm</option>
											<option value="Categorie One">Đồ Nam</option>
											<option value="Categorie Two">Đồ Nữ</option>
											<option value="Categorie Three">Đồ Trẻ Em</option>
									</select></li>
								</ul>
							</div>
							<div class="header-search">
								<form
									action="http://localhost:8080/WebProject/ProductServlet?index=1"
									method="post" id="selectform">
									<input type="text" placeholder="Tìm Kiếm" name="search" />
									<button type="submit">
										<i class="fa fa-search"></i>
									</button>
								</form>
							</div>
							<div class="header-chart">
								<ul class="list-inline">
									<li><a
										href="http://localhost:8080/WebProject/CartController"><i
											class="fa fa-cart-arrow-down"></i></a></li>
									<li class="chart-li"><a
										href="http://localhost:8080/WebProject/CartController">giỏ
											hàng</a> <!-- <ul>
											<li>
												<div class="header-chart-dropdown">
													<div class="header-chart-dropdown-list">
														<div class="dropdown-chart-left floatleft">
															<a href="#"><img src="img/product/best-product-1.png"
																alt="list"></a>
														</div>
														<div class="dropdown-chart-right">
															<h2>
																<a href="#">Feugiat justo lacinia</a>
															</h2>
															<h3>Qty: 1</h3>
															<h4>£80.00</h4>
														</div>
													</div>
													<div class="header-chart-dropdown-list">
														<div class="dropdown-chart-left floatleft">
															<a href="#"><img src="img/product/best-product-2.png"
																alt="list"></a>
														</div>
														<div class="dropdown-chart-right">
															<h2>
																<a href="#">Aenean eu tristique</a>
															</h2>
															<h3>Qty: 1</h3>
															<h4>£70.00</h4>
														</div>
													</div>
													<div class="chart-checkout">
														<p>
															subtotal<span>£150.00</span>
														</p>
														<button type="button" class="btn btn-default">Chckout</button>
													</div>
												</div>
											</li>
										</ul>--></li>
									<%
										if (currentUser != null) {
											ArrayList<CartItem> list;
											if (session.getAttribute("cart") == null) {
												Cart cart = new CartDao().getCartByUserID(currentUser.getID());
												list = cart.getList();
											} else {
												Cart cart = (Cart) session.getAttribute("cart");
												list = cart.getList();
											}
									%>
									<li><a
										href="http://localhost:8080/WebProject/CartController"><%=list.size() + " sản phẩm"%>
									</a></li>
									<%
										} else {
									%>
									<li><a
										href="http://localhost:8080/WebProject/CartController"> </a></li>
									<%
										}
									%>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- MAIN MENU AREA -->
	<div class="main-menu-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="main-menu hidden-xs">
						<nav>
							<ul>
								<li><a
									href="http://localhost:8080/WebProject/user/index.jsp">Trang
										Chủ</a></li>
								<li><a
									href="http://localhost:8080/WebProject/user/shop.jsp">Cửa
										Hàng</a></li>
								<li><a
									href="http://localhost:8080/WebProject/ProductDemoServlet?productType=aokhoacnam&nhom=men&index=1">Đồ
										Nam</a></li>
								<li><a
									href="http://localhost:8080/WebProject/ProductDemoServlet?productType=aokhoacnu&nhom=women&index=1">Đồ
										Nữ</a></li>
								<li><a
									href="http://localhost:8080/WebProject/ProductDemoServlet?productType=begai5tuoi&nhom=kids&index=1">Đồ
										trẻ em </a></li>
								<li><a
									href="http://localhost:8080/WebProject/user/gift.jsp">Quà
										Tặng </a></li>
								<li><a
									href="http://localhost:8080/WebProject/user/blog-left-sidebar.jsp">Blog</a>
									<ul class="sub-menu">
										<!-- <li><a href="blog-right-sidebar.html">Blog Right
												Sidebar</a></li>
										<li><a href="blog-single.html">Blog Details</a></li> -->
									</ul></li>
								<li><a href="#">Trang</a>
									<ul class="sub-menu">
										<li><a
											href="http://localhost:8080/WebProject/user/shop.jsp">Cửa
												Hàng</a></li>
										<li><a
											href="http://localhost:8080/WebProject/user/men.jsp">Đồ
												Nam</a></li>
										<li><a
											href="http://localhost:8080/WebProject/user/women.jsp">Đồ
												Nữ</a></li>
										<li><a
											href="http://localhost:8080/WebProject/user/kids.jsp">Đồ
												Trẻ Em</a></li>
										<li><a
											href="http://localhost:8080/WebProject/user/gift.jsp">Quà
												Tặng </a></li>
										<li><a
											href="http://localhost:8080/WebProject/user/about-us.jsp">About-us</a></li>
										<li><a
											href="http://localhost:8080/WebProject/user/404.jsp">Error
												404</a></li>
									</ul></li>
								<li><a href="contact.jsp">Liên Hệ</a></li>
							</ul>
						</nav>
					</div>
					<!-- Mobile MENU AREA -->
					<div class="mobile-menu hidden-sm hidden-md hidden-lg">
						<nav>
							<ul>
								<li><a
									href="http://localhost:8080/WebProject/user/index.jsp">Home</a></li>
								<li><a
									href="http://localhost:8080/WebProject/user/shop.jsp">Shop</a>
									<ul>
										<li><a href="#">Shop Layouts</a>
											<ul>
												<li><a href="#">Full Width</a></li>
												<li><a href="#">Sidebar Left</a></li>
												<li><a href="#">Sidebar Right</a></li>
												<li><a href="#">List View</a></li>
											</ul></li>
										<li><a href="#">Shop Pages</a>
											<ul>
												<li><a href="#">Category</a></li>
												<li><a href="#">My Account</a></li>
												<li><a href="#">Wishlist</a></li>
												<li><a href="#">Shopping Cart</a></li>
											</ul></li>
										<li><a href="#">Product Types</a>
											<ul>
												<li><a href="#">Simple Product</a></li>
												<li><a href="#">Variable Product</a></li>
												<li><a href="#">Grouped Product</a></li>
												<li><a href="#">Downloadable</a></li>
											</ul></li>
									</ul></li>
								<li><a href="men.jsp">Men</a></li>
								<li><a href="women.jsp">Women</a></li>
								<li><a href="kids.jsp">Kids</a></li>
								<li><a href="gift.jsp">gift</a></li>
								<li><a href="blog-left-sidebar.jsp">Blog</a>
									<ul>
										<!-- <li><a href="blog-right-sidebar.html">Blog Right
												Sidebar</a></li>
										<li><a href="blog-single.html">Blog Details</a></li> -->
									</ul></li>
								<li><a href="#">Pages</a>
									<ul>
										<li><a href="shop.jsp">Shop</a></li>
										<li><a href="men.jsp">Men</a></li>
										<li><a href="women.jsp">Women</a></li>
										<li><a href="kids.jsp">Kids</a></li>
										<li><a href="gift.jsp">Gift</a></li>
										<li><a href="about-us.jsp">About Us</a></li>
										<li><a href="single-product.jsp">Single Product</a></li>
										<li><a href="cart.jsp">Cart</a></li>
										<li><a href="checkout.jsp">Checkout</a></li>
										<li><a href="look-book.jsp">Look Book</a></li>
										<li><a href="404.jsp">Error 404</a></li>
									</ul></li>
								<li><a href="contact.jsp">contact</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>