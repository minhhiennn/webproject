<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-3 col-sm-4">
		<div class="product-item-categori">
			<div class="product-type">
				<h2>Tất cả danh mục</h2>
				<ul>
					<li><a href="http://localhost:8080/WebProject/ProductDemoServlet?productType=aokhoacnam&nhom=men&index=1"><i class="fa fa-angle-right"></i>Thời
							Trang Nam</a></li>
					<li><a href="http://localhost:8080/WebProject/ProductDemoServlet?productType=aokhoacnu&nhom=women&index=1"><i
							class="fa fa-angle-right"></i>Thời Trang Nữ</a></li>
					<li><a href="http://localhost:8080/WebProject/ProductDemoServlet?productType=begai5tuoi&nhom=kids&index=1"><i class="fa fa-angle-right"></i>Thời
							Trang Trẻ Em</a></li>
				</ul>
			</div>
		</div>
		<div class="price-filter">
			<form
				action="http://localhost:8080/WebProject/FilterServlet?nhom=all&index=1" method="post">
				<h2>Lọc theo giá</h2>
				<div id="slider-range"></div>
				<button class="btn btn-default">Lọc</button>
				<p>
					<label for="amount">Price:</label> <input type="text" id="amount" name="amount"
						readonly style="border: 0; color: #f6931f; font-weight: bold;">
				</p>
			</form>
		</div>
		<div class="filter-size-area">
			<h2>Lọc theo kích thước</h2>
			<div class="filter-size">
				<div class="filter-size-left">
					<p><a href="#">M (6)</a></p> <p><a href="#">X (7)</a></p> <p><a
						href="#">XS (10)</a></p>
				</div>
				<div class="filter-size-right">
					<p><a href="#">M (6)</a></p> <p><a href="#">X (7)</a></p> <p><a
						href="#">XS (10)</a></p>
				</div>
			</div>
		</div>
		<div class="add-shop">
			<div class="add-kids single-add">
				<!-- <a href="#"><img src="img/kid.jpg" alt="add"></a> -->
			</div>
			<div class="add-dress single-add">
				<!-- <a href="#"><img src="img/banner/kids-ad-2.jpg" alt="add"></a> -->
			</div>
		</div>
	</div>
	<!-- JS -->

	<!-- jquery-1.11.3.min js
		============================================ -->
	<script
		src="http://localhost:8080/WebProject/user/js/vendor/jquery-1.11.3.min.js"></script>

	<!-- bootstrap js
		============================================ -->
	<script src="http://localhost:8080/WebProject/user/js/bootstrap.min.js"></script>

	<!-- nivo slider js
		============================================ -->
	<script
		src="http://localhost:8080/WebProject/user/js/jquery.nivo.slider.pack.js"></script>

	<!-- Mean Menu js
		============================================ -->
	<script
		src="http://localhost:8080/WebProject/user/js/jquery.meanmenu.min.js"></script>

	<!-- owl.carousel.min js
		============================================ -->
	<script
		src="http://localhost:8080/WebProject/user/js/owl.carousel.min.js"></script>

	<!-- jquery price slider js
		============================================ -->
	<script
		src="http://localhost:8080/WebProject/user/js/jquery-price-slider.js"></script>

	<!-- wow.js
		============================================ -->
	<script src="http://localhost:8080/WebProject/user/js/wow.js"></script>
	<script>
		new WOW().init();
	</script>

	<!-- plugins js
		============================================ -->
	<script src="http://localhost:8080/WebProject/user/js/plugins.js"></script>

	<!-- main js
		============================================ -->
	<script src="http://localhost:8080/WebProject/user/js/main.js"></script>

</body>
</html>