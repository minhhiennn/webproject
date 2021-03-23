<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.User"%>
<!DOCTYPE html>
<html>
<head>
<title>Account</title>
</head>
<body>
	<%
		User currentUser = (User) (session.getAttribute("currentSessionUser"));
	%>
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
					<%
						if (currentUser == null) {
					%>
					<div class="username"
						style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; font-weight: 600; margin-bottom: 5px; color: #333">minhhien</div>
					<%
						} else {
					%>
					<%!public String userName(User currentUser) {
		String[] output = currentUser.getUsername().split("@");
		String userName = output[0];
		return userName;
	}%>
					<div class="username"
						style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; font-weight: 600; margin-bottom: 5px; color: #333"><%=userName(currentUser)%></div>
					<%
						}
					%>
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
							</a> <a style="display: block; margin-bottom: 15px;"
								href="NganHang.html"> <span style="font-size: 14px">Ngân
									Hàng</span>
							</a> <a style="display: block; margin-bottom: 15px;"
								href="DiaChi.html"> <span style="font-size: 14px">Địa
									chỉ</span>
							</a> <a style="display: block;; margin-bottom: 15px;"
								href="themmatkhau.html"> <span style="font-size: 14px">Thêm
									mật khẩu</span>
							</a>
						</div>
					</div>
				</div>
				<a class="list_menu_pos_2" href="http://localhost:8080/WebProject/CheckOutServlet?action=direct"
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
								style="font-size: 1.125rem; font-weight: 500; line-height: 1.5rem; color: #333; text-transform: capitalize; display: block;">Hồ
								Sơ Của Tôi</div>
							<div class=""
								style="font-size: .875rem; line-height: 1.0625rem; color: #555; margin-top: 3px; display: block;">Quản
								lý thông tin hồ sơ để bảo mật tài khoản</div>
						</div>
					</div>
					<div class="my-account-profile"
						style="display: flex; align-items: flex-start; padding-top: 30px;">
						<div class="my-account-profile_left"
							style="flex: 1; padding-right: 50px; display: block;">
							<div class="profile_content_1"
								style="margin-bottom: 30px; display: block; font-size: 14px; line-height: 16.8px; margin-bottom: 30px;">
								<div class=""
									style="display: flex; justify-content: flex-end; align-items: center;">
									<div class=""
										style="width: 20%; text-align: right; color: rgba(85, 85, 85, .8); text-transform: capitalize; overflow: hidden; display: block;">
										<label
											style="cursor: default; text-align: right; color: rgba(85, 85, 85, .8); text-transform: capitalize;">Tên
											đăng nhập</label>
									</div>
									<div class=""
										style="width: 80%; box-sizing: border-box; padding-left: 1.25rem; display: block;">
										<div class="" style="display: flex; align-items: center;">
											<%
												if (currentUser == null) {
											%>
											<div class=""
												style="font-size: 14px; color: #333; display: block; margin-top: -5px">minhhien</div>
											<%
												} else {
											%>

											<div class=""
												style="font-size: 14px; color: #333; display: block; margin-top: -5px"><%=userName(currentUser)%></div>
											<%
												}
											%>
										</div>
									</div>
								</div>
							</div>
							<div class="profile_content_2"
								style="margin-bottom: 30px; display: block; font-size: 14px; line-height: 16.8px; margin-bottom: 30px;">
								<div class=""
									style="align-items: center; color: rgba(0, 0, 0, .8); display: flex; font-size: 14px; justify-content: flex-end; line-height: 16.8px;">
									<div class=""
										style="display: block; color: rgba(85, 85, 85, .8); font-size: 14px; line-height: 16.8px; overflow: hidden; text-align: right; text-transform: capitalize;">
										<label>Tên</label>
									</div>
									<div class=""
										style="box-sizing: border-box; display: block; font-size: 14px; padding-left: 20px; line-height: 16.8px; width: 80%;">
										<div>
											<div
												style="display: flex; align-items: center; background-color: #fff; position: relative; border-radius: 2px; border: 1px solid rgba(0, 0, 0, .14); box-sizing: border-box; box-shadow: inset 0 2px 0 0 rgba(0, 0, 0, .02); color: #222; height: 40px; padding: 10px;">
												<input tyle="text" placeholde="" value=""
													style="flex: 1; font-size: 14px; background: transparent; outline: none; box-shadow: none; border: none;">
											</div>
										</div>
									</div>
									<div class=""></div>
								</div>
							</div>
							<div class="profile_content_3"
								style="margin-bottom: 30px; display: block">
								<div
									style="align-items: center; color: rgba(0, 0, 0, .8); display: flex; font-size: 14px; justify-content: flex-end; line-height: 16.8px;">
									<div
										style="text-align: right; text-transform: capitalize; overflow: hidden; display: block; color: rgba(85, 85, 85, .8)">
										<label>Email</label>
									</div>
									<div
										style="width: 80%; -moz-box-sizing: border-box; box-sizing: border-box; padding-left: 1.25rem; display: block;">
										<div
											style="display: flex; align-items: center; line-height: 16.8px; margin-top: -5px;">
											<%
												if (currentUser == null) {
											%>
											<div style="color: #333">minhhien2000k@gmail.com</div>
											<%
												} else {
											%>
											<div style="color: #333"><%=userName(currentUser)%>@gmail.com
											</div>
											<%
												}
											%>
											<button
												style="text-transform: capitalize; font-weight: 400; text-decoration: underline; border: none; outline: none; background: none; color: #05a; font-size: 13px;">Thay
												Đổi</button>
										</div>
									</div>
								</div>
							</div>
							<div class="profile_content_4"
								style="margin-bottom: 30px; display: block">
								<div
									style="align-items: center; color: rgba(0, 0, 0, .8); display: flex; font-size: 14px; justify-content: flex-end; line-height: 16.8px;">
									<div
										style="text-align: right; text-transform: capitalize; overflow: hidden; display: block; color: rgba(85, 85, 85, .8)">
										<label>Số điện thoại</label>
									</div>
									<div
										style="width: 80%; -moz-box-sizing: border-box; box-sizing: border-box; padding-left: 1.25rem; display: block; margin-top: -4px">
										<div style="display: flex; align-items: center;">
											<div></div>
											<button
												style="text-transform: capitalize; font-weight: 400; text-decoration: underline; border: none; outline: none; background: none; color: #05a; font-size: 13px;">Thêm</button>
										</div>
									</div>
								</div>
							</div>
							<div class="profile_content_5"
								style="margin-bottom: 30px; display: block">
								<div
									style="align-items: center; color: rgba(0, 0, 0, .8); display: flex; font-size: 14px; justify-content: flex-end; line-height: 16.8px;">
									<div
										style="text-align: right; text-transform: capitalize; overflow: hidden; display: block; color: rgba(85, 85, 85, .8)">
										<label>Tên shop</label>
									</div>
									<div
										style="width: 80%; -moz-box-sizing: border-box; box-sizing: border-box; padding-left: 1.25rem; display: block; margin-top: -4px">
										<div>
											<div
												style="display: flex; -webkit-box-align: center; align-items: center; background-color: #fff; position: relative; border-radius: 2px; border: 1px solid rgba(0, 0, 0, .14); box-sizing: border-box; box-shadow: inset 0 2px 0 0 rgba(0, 0, 0, .02); color: #222; height: 40px; padding: 10px; transition: border-color .1s ease;">
												<input type="text"
													style="flex: 1; font-size: 14px; background: transparent; outline: none; box-shadow: none; border: none;">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="profile_content_6"
								style="margin-bottom: 30px; display: block">
								<div
									style="display: flex; -webkit-box-pack: end; justify-content: flex-end; -webkit-box-align: center; align-items: center;">
									<div
										style="text-align: right; text-transform: capitalize; overflow: hidden; display: block; color: rgba(85, 85, 85, .8)"></div>
									<label>Giới tính</label>
									<div
										style="width: 80%; box-sizing: border-box; padding-left: 1.25rem; display: block;">
										<div style="display: block">
											<div style="display: flex;">
												<div
													style="padding: 0; margin-right: .75rem; font-weight: 400; font-size: 14px; color: rgba(0, 0, 0, .87); display: flex; cursor: default;">
													<form action="">
														<input type="radio" name="gioitinh"
															style="margin-right: 5px"><label>Nam</label> <input
															type="radio" name="gioitinh" style="margin-right: 5px"><label>Nữ</label>
														<input type="radio" name="gioitinh"
															style="margin-right: 5px"><label>Other</label>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="profile_content_7"
								style="margin-bottom: 30px; display: block;">
								<div
									style="display: flex; -webkit-box-pack: end; justify-content: flex-end; -webkit-box-align: center; align-items: center;">
									<div
										style="width: 20%; text-align: right; color: rgba(85, 85, 85, .8); text-transform: capitalize; overflow: hidden; display: block;">
										<label
											style="text-align: right; color: rgba(85, 85, 85, .8); text-transform: capitalize; cursor: default;">Ngày
											sinh</label>
									</div>
									<div
										style="width: 80%; box-sizing: border-box; padding-left: 1.25rem; display: block;">
										<div
											style="display: flex; width: 100%; -webkit-box-pack: justify;">
											<select name="day"
												style="width: 16%; height: 2.5rem; padding: 0px .9375rem; align-items: center; margin-right: 15px">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
											</select> <select name="month"
												style="width: 18%; height: 2.5rem; padding: 0px .9375rem; align-items: center; margin-right: 15px">
												<option value="Thang1">Tháng 1</option>
												<option value="Thang2">Tháng 2</option>
												<option value="Thang3">Tháng 3</option>
											</select> <select name="year"
												style="width: 16%; height: 2.5rem; padding: 0px .9375rem; align-items: center;">
												<option value="2000">2000</option>
												<option value="2001">2001</option>
												<option value="2002">2002</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<form action="" method="get" name="formDangXuat">
								<div class="profile_content_8"
									style="margin-bottom: 60px; padding-left: calc(20% + 20px); display: block;">

									<button type="button"
										style="color: #fff; background: #ee4d2d; height: 40px; padding: 0 20px; min-width: 70px; max-width: 220px; display: inline-flex; flex-direction: column; font-size: 14px; box-sizing: border-box; box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .09); border-radius: 2px; border: 0; justify-content: center; text-transform: capitalize; outline: 0; cursor: pointer;">Lưu
									</button>
									<a href="logout.jsp">
										<button type="button" name="buttonDangXuat"
											style="color: #fff; background: #ee4d2d; height: 40px; padding: 0 20px; min-width: 70px; max-width: 220px; display: inline-flex; flex-direction: column; font-size: 14px; box-sizing: border-box; box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .09); border-radius: 2px; border: 0; justify-content: center; text-transform: capitalize; outline: 0; cursor: pointer; margin-left: 30px;">Đăng
											xuất</button>
									</a>
								</div>
							</form>
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