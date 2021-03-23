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
				<h2>Thời Trang Nam</h2>
				<ul>
					<li><a
						href="http://localhost:8080/WebProject/ProductDemoServlet?productType=aokhoacnam&nhom=men&index=1"
						id="aokhoacnam"><i class="fa fa-angle-right"></i>Áo khoác</a></li>
					<li><a
						href="http://localhost:8080/WebProject/ProductDemoServlet?productType=aosominam&nhom=men&index=1"
						id="aosominam"><i class="fa fa-angle-right"></i>Áo sơ mi</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i>Áo vest</a></li>
					<li><a
						href="http://localhost:8080/WebProject/ProductDemoServlet?productType=quanjean&nhom=men&index=1"
						id="quanjean"><i class="fa fa-angle-right"></i>Áo/quầnJeans</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i>Đồ lót</a></li>
					<li><a
						href="http://localhost:8080/WebProject/ProductDemoServlet?productType=giaynam&nhom=men&index=1"
						id="giaynam"><i class="fa fa-angle-right"></i>Giày</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i>Balo/Túi</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i>Thắt Lưng</a></li>
				</ul>
			</div>
		</div>
		<div class="price-filter">
			<%
				String productType = (String) request.getAttribute("typeProduct");
				String title = (String) request.getAttribute("title");
			%>
			<form
				action="http://localhost:8080/WebProject/FilterServlet?nhom=men&index=1&productType=<%=productType%>&title=<%=title%>"
				method="post">
				<h2>Lọc theo giá</h2>
				<div id="slider-range"></div>
				<button class="btn btn-default">Lọc</button>
				<p>
					<label for="amount">Price:</label> <input type="text" id="amount"
						name="amount" readonly
						style="border: 0; color: #f6931f; font-weight: bold;">
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
	<script type="text/javascript">
		document.getElementById('${typeProduct}').style.color = "#FFB455";
	</script>
</body>
</html>