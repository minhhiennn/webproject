<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Diachi</title>
</head>
<body>
	<!-- HEADER AREA -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- BODY AREA -->
	<div class="container_body"
		style="padding: 1.25rem 0 3.125rem; width: 1200px; margin-right: auto; margin-left: auto; display: flex;">
		<div class="menu_left">
			<div
				style="display: flex; padding: 15px 0; border-bottom: 1px solid #efefef">
				<div class="user-page-brief">
					<a class="shop-avatar" style="cursor: pointer;"> <img
						alt="Lỗi hình ảnh"
						style="border-radius: 50%; width: 50px; height: 50px"
						src="img/user-image.jpg" class="shop-avatar_img">
					</a>
				</div>
				<div style="margin-left: 15px">
					<div class="username"
						style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; font-weight: 600; margin-bottom: 5px; color: #333">minhhien</div>
					<div style="cursor: pointer;">
						<a> <i class="fas fa-pen"></i> <span style="margin-right: 4px">Sửa
								hồ sơ</span>
						</a>
					</div>
				</div>
			</div>
			<div class="userpage-menu"
				style="margin: 27px 0 0; font-size: 0.875rem; display: block">
				<div class="list_menu_pos_1"
					style="position: relative; display: block; list-style: none; cursor: pointer;">
					<div class="list_menu_pos_1_1"
						style="display: block; list-style: none; cursor: pointer">
						<a
							style="text-decoration: none; color: rgba(0, 0, 0, .8); display: flex; align-items: center; text-transform: capitalize; margin-bottom: 18px;">
							<i class="fas fa-user"
							style="border-radius: 50%; text-align: center; margin-right: 12px; width: 20px; height: 20px; line-height: 20px; background-color: rgb(255, 193, 7); color: #fff"></i>
							<span style="font-weight: 500; cursor: pointer;">Tài khoản
								của tôi</span>
						</a>
					</div>
					<div class="list_menu_pos_1_2345"
						style="height: auto; opacity: 1; display: block">
						<div style="display: block; padding: 0 0 3px 34px">
							<a style="display: block; margin-bottom: 15px"
								href="Account.html"> <span style="font-size: 14px">Hồ
									sơ</span>
							</a> <a style="display: block; margin-bottom: 15px;"
								href="NganHang.html"> <span style="font-size: 14px" >Ngân
									Hàng</span>
							</a> <a style="display: block; margin-bottom: 15px;" href="DiaChi.html"> <span
								style="font-size: 14px">Địa chỉ</span>
							</a> <a style="display: block;; margin-bottom: 15px;" href="themmatkhau.html"> <span
								style="font-size: 14px">Thêm mật khẩu</span>
							</a>
						</div>
					</div>
				</div>
				<a class="list_menu_pos_2"
					style="display: flex; align-items: center; margin-bottom: 18px; text-decoration: none; text-transform: capitalize;">
					<i class="far fa-list-alt"
					style="border-radius: 50%; text-align: center; margin-right: 15px; width: 20px; height: 20px; line-height: 20px; background-color: rgb(68, 181, 255); color: #fff"></i>
					<span style="cursor: pointer; font-weight: 500; display: block;">Đơn
						Mua</span>
				</a> <a class="list_menu_pos_3"
					style="display: flex; align-items: center; margin-bottom: 18px; text-decoration: none; text-transform: capitalize;"><i
					class="far fa-bell"
					style="border-radius: 50%; text-align: center; margin-right: 15px; width: 20px; height: 20px; line-height: 20px; background-color: rgb(238, 77, 45); color: #fff"></i>
					<span style="cursor: pointer; font-weight: 500; display: block;">Thông
						báo</span> </a> <a class="list_menu_pos_4"
					style="display: flex; align-items: center; margin-bottom: 18px; text-decoration: none; text-transform: capitalize;"><i
					class="fas fa-wallet"
					style="border-radius: 50%; text-align: center; margin-right: 15px; width: 20px; height: 20px; line-height: 20px; background-color: rgb(255, 119, 97); color: #fff"></i>
					<span style="cursor: pointer; font-weight: 500; display: block;">Ví
						Voucher</span></a> <a class="list_menu_pos_5"
					style="display: flex; align-items: center; margin-bottom: 18px; text-decoration: none; text-transform: capitalize;">
					<i class="fas fa-dollar-sign"
					style="border-radius: 50%; text-align: center; margin-right: 15px; width: 20px; height: 20px; line-height: 20px; background-color: rgb(255, 174, 4); color: #fff"></i><span
					style="cursor: pointer; font-weight: 500; display: block;">Shop
						Xu</span>
				</a>
			</div>
		</div>
		<div class="content_all"
			style="position: relative; -webkit-box-flex: 1; flex-grow: 1; width: 980px; box-sizing: border-box; margin-left: 1.6875rem; min-width: 0; background: #fff; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .13); border-radius: .125rem; display: block;">
			<div class="content_all_right"
				style="display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; position: relative; min-height: 100%;">
				<div style="display: block;">
					<div style="display: block;"></div>
					<div style="display: block;"></div>
					<div
						style="display: flex; flex-direction: column; padding: 0 30px 20px; background: #fff; overflow: visible;">
						<div class="my-account-section_header"
							style="-webkit-box-align: center; align-items: center; border-bottom: 1px solid #efefef; padding: 22px 0; height: 80px; box-sizing: border-box; display: flex;">
							<div class="my-account-section_header-left"
								style="flex: 1; display: block;">
								<div
									style="font-size: 1.125rem; font-weight: 500; line-height: 1.5rem; color: #333; text-transform: capitalize; display: block;">
									Địa chỉ của tôi</div>
							</div>
							<div class="my-account-section_header-button"
								style="margin-left: 10px; display: block;">
								<button
									style="height: 40px; padding: 0 20px; font-size: 14px; text-transform: capitalize; font-weight: 400; background: #ee4d2d;">
									<div
										style="display: flex; -webkit-box-align: center; align-items: center; justify-content: space-between; width: 100%; font-size: 14px; text-transform: capitalize; font-weight: 400;">
										<div
											style="display: flex; -webkit-box-align: center; margin-right: 10px; margin-right: 10px;">
											<svg
												style="overflow: hidden; display: inline-block; width: 1em; height: 1em; fill: currentColor; position: relative;">
                                                 <polygon
													points="10 4.5 5.5 4.5 5.5 0 4.5 0 4.5 4.5 0 4.5 0 5.5 4.5 5.5 4.5 10 5.5 10 5.5 5.5 10 5.5"></polygon>										
										</svg>
										</div>
										<div
											style="display: block; font-size: 14px; text-transform: capitalize; font-weight: 400; color: #fff;">Thêm
											Địa chỉ mới</div>
									</div>
								</button>
							</div>
						</div>
						<div style="display: block;">
							<div
								style="color: #555; font-size: 1.125rem; padding: 90px 0; text-align: center; width: 100%;display: block;">Bạn
								chưa có địa chỉ</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END OF THE BODY AREA -->
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>