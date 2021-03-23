<%@page import="database.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Giỏ hàng</title>
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
				<li><a href="index.html">Trang Chủ</a></li>
				<li><a href="#">Trang</a></li>
				<li>Order Detail</li>
			</ul>
		</div>
	</div>
	<!-- Chart AREA -->
	<%
		DonHang donHang = (DonHang) session.getAttribute("order");
	%>
	<div class="chart-area">
		<div class="container">
			<%
				if (donHang.getList().size() != 0) {
			%>
			<div class="row">
				<div class="col-md-12">
					<div class="chart-item table-responsive fix">
						<table class="col-md-12">
							<thead>
								<tr>
									<th>STT</th>
									<th>Họ và tên</th>
									<th>Địa chỉ</th>
									<th>Số điện thoại</th>
									<th>Tổng</th>
									<th class="th-delate">Xóa</th>
								</tr>
							</thead>
							<tbody>
								<%
									ArrayList<OrderDetail> list = donHang.getList();
										for (int i = 0; i < list.size(); i++) {
								%>
								<tr>
									<td class="th-details">
										<h2>
											<a href="#"><%=(i+1)%></a>
										</h2>

									</td>
									<td class="th-details">
										<h2>
											<a href="#"><%=list.get(i).getHoten()%></a>
										</h2>

									</td>
									<td class="th-details">
										<h2>
											<a href="#"><%=list.get(i).getDiachi()%></a>
										</h2>

									</td>
								
									<td class="th-details">
										<h2>
											<a href="#"><%=list.get(i).getSodienthoai()%></a>
										</h2>

									</td>
									
									<td class="th-details">
										<h2>
											<a href="#"><%=list.get(i).getTotal()%></a>
										</h2>

									</td>
									<td class="th-delate"><a
										href="http://localhost:8080/WebProject/CheckOutServlet?orderDetailID=<%=list.get(i).getID()%>&action=delete"><i
											class="fa fa-trash"></i></a></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>

				</div>
			</div>

			<%
				} else if (donHang.getList().size() == 0) {
			%>
			<div style="text-align: center">
				<div style="width: 100%; height: 100px;">
					<img alt="giohangtrong"
						src="http://localhost:8080/WebProject/user/img/giohangtrong.png"
						width="120" height="120">
				</div>
				<div style="margin-top: 1.125rem">Đơn hàng của bạn còn trống</div>
			</div>
			<%
				}
			%>
			<!-- ------------------------------------------------- -->
		</div>
	</div>
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
