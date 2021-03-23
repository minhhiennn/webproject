<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm mật khẩu</title>
</head>
<body>
	<!-- HEADER AREA -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- BODY -->
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
							<a style="display: block; margin-bottom: 15px"> <span
								style="font-size: 14px">Hồ sơ</span>
							</a> <a style="display: block; margin-bottom: 15px;" href="NganHang.html"> <span
								style="font-size: 14px">Ngân Hàng</span>
							</a> <a style="display: block; margin-bottom: 15px;" href="DiaChi.html"> <span
								style="font-size: 14px">Địa chỉ</span>
							</a> <a style="display: block;; margin-bottom: 15px;"> <span
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
			style="position: relative; flex-grow: 1; width: 980px; box-sizing: border-box; margin-left: 1.6875rem; min-width: 0; background-color: #fff; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .13); border-radius: 0.125rem">
			<div class="content_inside"
				style="display: flex; flex-direction: column; position: relative; min-height: 100%">
				<div class="my-account-section"
					style="display: flex; flex-direction: column; padding: 0 30px 20px; background: #fff; overflow: visible;">
					<div class="my-account-section-header"
						style="align-items: center; border-bottom: 1px solid #efefef; padding: 22px 0; height: 80px; box-sizing: border-box; display: flex;">
						<div class="" style="flex: 1; display: block;">
							<div class=""
								style="font-size: 1.125rem; font-weight: 500; line-height: 1.5rem; color: #333; text-transform: capitalize; display: block;">Thêm Mật Khẩu</div>
							<div class=""
								style="font-size: .875rem; line-height: 1.0625rem; color: #555; margin-top: 3px; display: block;">Để bảo mật tài khoản, vui lòng không chia sẻ mật khẩu cho người khác</div>
						</div>
					</div>
					<div class="my-account-profile"
						style="display: flex; align-items: flex-start; padding-top: 30px;">
						<div class="my-account-profile_left"
							style="flex: 1; padding-right: 50px; display: block;">
							<div class="profile_content_1"
								style="margin-bottom: 30px; display: block; font-size: 14px; line-height: 16.8px; margin-bottom: 30px;">
								
							</div>
							<div class="profile_content_2"
								style="margin-bottom: 30px; display: block; font-size: 14px; line-height: 16.8px; margin-bottom: 30px;">
								<div class=""
									style="align-items: center; color: rgba(0, 0, 0, .8); display: flex; font-size: 14px; justify-content: flex-end; line-height: 16.8px;width: 50%;">
									<div class=""
										style="display: block; color: rgba(85, 85, 85, .8); font-size: 14px; line-height: 16.8px; overflow: hidden; text-align: right; text-transform: capitalize;">
										<label>Mật Khẩu Mới</label>
									</div>
									<div class=""
										style="box-sizing: border-box; display: block; font-size: 14px; padding-left: 20px; line-height: 16.8px; width: 70%;">
										<div>
											<div
												style="display: flex; align-items: center; background-color: #fff; position: relative; border-radius: 2px; border: 1px solid rgba(0, 0, 0, .14); box-sizing: border-box; box-shadow: inset 0 2px 0 0 rgba(0, 0, 0, .02); color: #222; height: 40px; padding: 10px;">
												<input type="password" placeholde="" value="" 
													style="flex: 1; font-size: 14px; background: transparent; outline: none; box-shadow: none; border: none;">
											</div>
										</div>
									</div>
									
								</div>
							</div>
						
							
							<div class="profile_content_5"
								style="margin-bottom: 30px; display: block">
								<div
									style="align-items: center; color: rgba(0, 0, 0, .8); display: flex; font-size: 14px; justify-content: flex-end; line-height: 16.8px;width: 50%;">
									<div
										style="text-align: right; text-transform: capitalize; overflow: hidden; display: block; color: rgba(85, 85, 85, .8)">
										<label>Xác Nhận Mật Khẩu</label>
									</div>
									<div
										style="width: 70%; -moz-box-sizing: border-box; box-sizing: border-box; padding-left: 1.25rem; display: block; margin-top: -4px">
										<div>
											<div
												style="display: flex; -webkit-box-align: center; align-items: center; background-color: #fff; position: relative; border-radius: 2px; border: 1px solid rgba(0, 0, 0, .14); box-sizing: border-box; box-shadow: inset 0 2px 0 0 rgba(0, 0, 0, .02); color: #222; height: 40px; padding: 10px; transition: border-color .1s ease;">
												<input type="password"
													style="flex: 1; font-size: 14px; background: transparent; outline: none; box-shadow: none; border: none;">
											</div>
										</div>
									</div>
								</div>
                            </div>
                            <!--ma xac minh-->
							<div class="profile_content_5"
								style="margin-bottom: 30px; display: block">
								<div
									style="align-items: center; color: rgba(0, 0, 0, .8); display: flex; font-size: 14px; justify-content: flex-end; line-height: 16.8px;width: 50%;">
									<div
										style="text-align: right; text-transform: capitalize; overflow: hidden; display: block; color: rgba(85, 85, 85, .8)">
										<label>Mã Xác   Minh</label>
									</div>
									<div
										style="width: 70%; -moz-box-sizing: border-box; box-sizing: border-box; padding-left: 1.25rem; display: block; margin-top: -4px">
										<div>
											<div
												style="display: flex; -webkit-box-align: center; align-items: center; background-color: #fff; position: relative; border-radius: 2px; border: 1px solid rgba(0, 0, 0, .14); box-sizing: border-box; box-shadow: inset 0 2px 0 0 rgba(0, 0, 0, .02); color: #222; height: 40px; padding: 10px; transition: border-color .1s ease;width: 190px;float: left;">
												<input type="password"
													style="flex: 1; font-size: 14px; background: transparent; outline: none; box-shadow: none; border: none;">
                                            </div>
                                            <div
												style="display: flex; -webkit-box-align: center; align-items: center; background-color: #fff; position: relative; border-radius: 2px; border: 1px solid rgba(0, 0, 0, .14); box-sizing: border-box; box-shadow: inset 0 2px 0 0 rgba(0, 0, 0, .02); color: #222; height: 40px; padding: 10px; transition: border-color .1s ease;width: 109px;background-color:#fbfbfb">
												<input type="password" placeholder="Gửi Mã Xác Minh" 
													style="flex: 1; font-size: 12px; background: transparent; outline: none; box-shadow: none; border: none;">
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="profile_content_8"
								style="margin-bottom: 60px; padding-left: calc(20% + 20px); display: block;padding-left: 156px;">
								<button type="button" aria-disabled="false"
									style="color: #fff; background: #ee4d2d; height: 40px; padding: 0 20px; min-width: 70px; max-width: 220px; display: inline-flex; flex-direction: column; font-size: 14px; box-sizing: border-box; box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .09); border-radius: 2px; border: 0; justify-content: center; text-transform: capitalize; outline: 0; cursor: pointer;">Xác Nhận</button>
							</div>
						</div>
						<div class="my-account-profile_right"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END OF THE BODY -->
	<!-- Footer AREA -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>