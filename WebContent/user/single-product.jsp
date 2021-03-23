<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.ProductDao"%>
<%@page import="beans.Product"%>
<%@page import="beans.Img"%>
<%@page import="beans.Comment"%>
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
<title>Single Product</title>
</head>
<body class="">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- HEADER AREA -->
	<jsp:include page="/user/header.jsp"></jsp:include>
	<!-- Breadcurb AREA -->
	<div class="breadcurb-area">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#">Trang Chủ</a></li>
				<li>Single Product</li>
			</ul>
		</div>
	</div>
	<%
		Product product = (Product) request.getAttribute("product");
		ArrayList<Img> list = new ProductDao().getImgByProductID(product.getID());
	%>
	<!-- Product Item AREA -->
	<div class="product-item-area">
		<div class="container">
			<div class="row">
				<!-- MENU  -->
				<%
					if (product.getThuocnhom().equalsIgnoreCase("men")) {
				%>
				<jsp:include page="menu/Menmenu.jsp"></jsp:include>
				<%
					} else if (product.getThuocnhom().equalsIgnoreCase("women")) {
				%>
				<jsp:include page="menu/Womenmenu.jsp"></jsp:include>
				<%
					} else if (product.getThuocnhom().equalsIgnoreCase("kids")) {
				%>
				<jsp:include page="menu/Kidmenu.jsp"></jsp:include>
				<%
					}
				%>
				<div class="col-md-9 col-sm-8">
					<div class="row">
						<div class="col-md-5 col-sm-5">
							<div class="product-item-tab">
								<!-- Tab panes -->
								<div class="single-tab-content">
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane active" id="img-one">
											<img src=<%=list.get(0).getFileImg()%> alt="tab-img">
										</div>
										<div role="tabpanel" class="tab-pane" id="img-two">
											<img src=<%=list.get(1).getFileImg()%> alt="tab-img">
										</div>
										<div role="tabpanel" class="tab-pane" id="img-three">
											<img src=<%=list.get(2).getFileImg()%> alt="tab-img">
										</div>
									</div>
								</div>
								<!-- Nav tabs -->
								<div class="single-tab-img">
									<ul class="nav nav-tabs" role="tablist">
										<li role="presentation" class="active"><a href="#img-one"
											role="tab" data-toggle="tab"><img
												src=<%=list.get(0).getFileImg()%> alt="tab-img"
												style="width: 100px; height: 100px"></a></li>
										<li role="presentation"><a href="#img-two" role="tab"
											data-toggle="tab"><img src=<%=list.get(1).getFileImg()%>
												alt="tab-img" style="width: 100px; height: 100px"></a></li>
										<li role="presentation" class="tab-last-li"><a
											href="#img-three" role="tab" data-toggle="tab"><img
												src=<%=list.get(2).getFileImg()%>
												alt="
												tab-img"
												style="width: 100px; height: 100px"></a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-7 col-sm-7">
							<div class="product-tab-content">
								<div class="product-tab-header">
									<h1><%=product.getName()%></h1>
									<div class="best-product-rating">
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star"></i></a>
										<p>(3 người đánh giá)</p>
									</div>
									<h3><%=product.getPrice() + "VND"%></h3>
								</div>
								<div class="product-item-code">
									<p>Mã sản phẩm : #897896</p>
									<p>Tồn kho : Còn hàng</p>
								</div>
								<div class="product-item-details">
									<p>Bộ áo khoác màu hồng giúp bạn tươi tắn đẹp đẽ hơn vào
										mỗi sáng sớm.</p>
								</div>
								<div class="size-chart">
									<p>
										Size Chart: <i class="fa fa-plus"></i>
									</p>
									<!--
										<select name="" id="">
											<option value="">Size Chart: <i class="fa fa-plus"></i></option>
											<option value="">Lg</option>
											<option value="">Xs</option>
											<option value="">Xs</option>
										</select>
										-->
								</div>
								<div class="available-option">
									<h2>Chức năng có sẵn:</h2>
									<div class="color-option fix">
										<p>Chọn màu:</p>
										<a href="#" class="color-1"></a> <a href="#" class="color-2"></a>
										<a href="#" class="color-3"></a> <a href="#" class="color-4"></a>
										<a href="#" class="color-5"></a> <a href="#" class="color-6"></a>
									</div>
									<div class="size-option fix">
										<p>Chọn Size:</p>
										<select>
											<option value="Choose an option">Bấm vào chọn</option>
											<option value="Lg">Lg</option>
											<option value="Xs">M</option>
											<option value="Xs">Xs</option>
										</select>
									</div>
									<div class="wishlist-icon">
										<div class="single-wishlist">
											<a href="#"><i class="fa fa-heart"></i></a>
											<p>Thích</p>
										</div>
										<div class="single-wishlist">
											<a href="#"><i class="fa fa-signal"></i></a>
											<p>So sánh</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="description-tab">
								<!-- Nav tabs -->
								<ul class="nav nav-tabs" role="tablist">
									<li role="presentation" class="active"><a
										href="#description" role="tab" data-toggle="tab">Miêu tả
											sản phẩm</a></li>
									<li role="presentation"><a href="#information" role="tab"
										data-toggle="tab">Thông tin thêm</a></li>
									<li role="presentation"><a href="#reviews" role="tab"
										data-toggle="tab">Đánh giá</a></li>
								</ul>
								<!-- Tab panes -->
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="description">
										<p><%=product.getDescription()%></p>

									</div>
									<div role="tabpanel" class="tab-pane" id="information">
										<p>Lorem ipsum dolor sit amet, consectetuer adipiscing
											elit. Aenean commodo ligula eget dolor. Aenean massa. Cum
											sociis natoque penatibus et magnis dis parturient montes,
											nascetur ridiculus mus. Donec quam felis, ultricies nec,
											pellentesque eu, pretium quis, sem. Nulla consequat massa
											quis enim. Integer tincidunt. Cras dapibus. Vivamus elementum
											semper nisi. Aenean vulputate eleifend tellus.</p>

										<p>Donec pede justo, fringilla vel, aliquet nec, vulputate
											eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis
											vitae, justo. Nullam dictum felis eu pede mollis pretium.</p>
									</div>
									<div role="tabpanel" class="tab-pane" id="reviews">
										<p>Lorem ipsum dolor sit amet, consectetuer adipiscing
											elit. Aenean commodo ligula eget dolor. Aenean massa. Cum
											sociis natoque penatibus et magnis dis parturient montes,
											nascetur ridiculus mus.</p>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="single-product-slider similar-product">
								<div class="product-items">

									<h2 class="product-header">Sản phẩm tương tự</h2>
									<div class="row">
										<div id="singleproduct-slider" class="owl-carousel">
											<%
												ArrayList<Product> listProduct = new ProductDao().getListProductByType(product.getTypeproduct());
												for (int i = 0; i < 6; i++) {
													ArrayList<Img> listImg = new ProductDao().getImgByProductID(listProduct.get(i).getID());
											%>
											<div class="col-md-4">
												<div class="single-product">
													<div class="single-product-img">
														<a
															href="http://localhost:8080/WebProject/SingleProductServlet?productID=<%=listProduct.get(i).getID()%>&index=1">
															<img class="primary-img"
															src=<%=listImg.get(0).getFileImg()%> alt="product"
															style="width: 264px; height: 274px;"> <img
															class="secondary-img"
															src=<%=listImg.get(1).getFileImg()%>
															style="width: 264px; height: 274px" alt="product">
														</a>
														<div class="single-product-action">
															<a
																href="http://localhost:8080/WebProject/SingleProductServlet?productID=<%=listProduct.get(i).getID()%>&index=1"><i
																class="fa fa-external-link"></i></a><a
																href="http://localhost:8080/WebProject/AddToCartAndDeleteController?productID=<%=listProduct.get(i).getID()%>&action=AddToCart"><i
																class="fa fa-shopping-cart"></i></a>
														</div>
													</div>
													<div class="single-product-content">
														<div class="product-content-left">
															<h2>
																<a href="#">EXCLUSIVE STYLE</a>
															</h2>
															<p><%=listProduct.get(i).getName()%></p>
														</div>
														<div class="product-content-right">
															<h3><%=listProduct.get(i).getPrice()%></h3>
														</div>
													</div>
												</div>
											</div>
											<%
												}
											%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
						ArrayList<Comment> listComment = (ArrayList<Comment>) request.getAttribute("listComment");
					%>
					<%
						if (listComment.size() == 0) {
					%>
					<div class="blog-comments-replay">
						<h1>ĐÁNH GIÁ SẢN PHẨM</h1>
						<hr>
						<div class="blog-comments">
							<div>
								<h3>Hiện chưa có bình luận nào</h3>
							</div>
						</div>
						<%
							} else {
						%>
						<div class="blog-comments-replay">
							<h1>ĐÁNH GIÁ SẢN PHẨM</h1>
							<hr>
							<%
								for (int i = 0; i < listComment.size(); i++) {
							%>
							<div class="blog-comments">
								<div class="comments-img">
									<img
										src="http://localhost:8080/WebProject/user/img/avatar_comment.png"
										alt="img" style="width: 80px; height: 80px;">
								</div>
								<div class="comments-content fix">
									<h2>
										<a href="#"><%=listComment.get(i).getTennguoigui()%></a>
									</h2>
									<span><i class="fa fa-clock-o"></i><%=new SimpleDateFormat("dd/MM/yyyy").format(listComment.get(i).getNgaygui())%></span>
									<p><%=listComment.get(i).getBinhluan()%></p>
									<a class="replay" href="#"><i class="fa fa-reply"></i> Trả
										lời</a>
								</div>
							</div>
							<%
								}
							%>
							<%
								}
							%>
							<div class="single-blog-pagination shop-pagination"
								style="text-align: right">
								<ul class="pagination">
									<li><a href="#">&lt;</a></li>
									<%
										int endPage = (Integer) request.getAttribute("endPage");
										for (int i = 0; i < endPage; i++) {
											String string = String.valueOf(i + 1);
									%>
									<li><a id=<%=string%>
										href="http://localhost:8080/WebProject/SingleProductServlet?productID=<%=product.getID()%>&index=<%=(i + 1)%>"><%=(i + 1)%></a></li>
									<%
										}
									%>
									<li><a href="#">&gt;</a></li>
								</ul>
							</div>
						</div>
						<hr>
						<div class="message-post" style="padding-top: 5px;">
							<h2>Bình luận</h2>
							<form class="form-horizontal"
								action="http://localhost:8080/WebProject/CommentServlet?productID=<%=product.getID()%>&index=1"
								method="post">
								<div class="form-group col-md-6 col-sm-6 col-xs-12 text-name">
									<label class="control-label">Tên</label> <input type="text"
										name="ten" class="form-control">
								</div>

								<div class="form-group col-md-12 col-sm-12 col-xs-12">
									<label class="control-label">Bình luận của bạn</label>
									<textarea rows="5" class="form-control" name="binhluan"></textarea>
								</div>
								<div class="form-group col-md-12 col-sm-12 col-xs-12">
									<button type="submit" class="btn btn-default">Gửi</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			document.getElementById('${index}').style.color = "#FFB455";
		</script>
		<!-- Footer AREA -->
		<jsp:include page="/user/footer.jsp"></jsp:include>
</body>
</html>
