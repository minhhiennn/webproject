<%@page import="beans.LienHe"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Trả lời hỏi đáp</title>

</head>
<jsp:include page="header.jsp"></jsp:include>
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-4 text-gray-800"></h1>
					<div class="col-lg-6 mb-4">

						<div class="card shadow mb-4" style="width: 205%">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary" style="float: left;">Trả lời hỏi
									đáp</h6>
									<div style="float: right;">
									<a href="http://localhost:8080/WebProject/AdminQuanLiHoiDap?run=chuakiemtra"><button
										style="border: none; background-color: #36b9cc; border-radius: 6px;height: 40px;width: 80px;background-color: red">Trở lại</button></a>
										</div>
							</div>
							<form action="http://localhost:8080/WebProject/AdminQuanLiHoiDap?run=gui" method="post">
							<div class="card-body">
							
							<%
						ArrayList<LienHe>list=(ArrayList<LienHe>) request.getAttribute("listlienhe");
							for(int i=0;i<list.size();i++){
							
							%>
							<div style="padding-left: 6px">
									<span style="padding-right: 49px;">ID Khách Hàng:</span> <input name="id"
										 type="text" value=<%=list.get(i).getId() %>
										style="width: 600px; padding: 3px">
								</div>
								
								<hr>
								<div>
									<span style="padding-right: 120px;">Email:</span> <input 
										 type="text" value=<%=list.get(i).getEmail() %>
										style="width: 600px; padding: 3px" name="email">
								</div>
								<hr>
								<div>
									<span style="padding-right: 96px;">Ngày gởi:</span> <input
										type="text" value=<%=list.get(i).getNgayGui() %>
										style="width: 600px; padding: 3px">
								</div>
								<hr>
								<div style="display: flex;">
									<div style="">
										<span style="padding-right: 100px;">Nội dung:</span>
									</div>
									<textarea rows="3" cols="66"><%=list.get(i).getNoiDung()%></textarea>
								</div>
								<hr>
								<div style="display: flex;">
									<div style="">
										<span style="padding-right: 98px;">Phản hồi :</span>
									</div>
									<textarea rows="3" cols="66" name="phanhoi1"
										placeholder="Nhập nội dung phản hồi"></textarea>
								</div>
								<%} %>
								<div style="padding-left: 430px;margin-top: 35px">
									<button type="submit"
										name="phanhoi" style="border: none; background-color: #36b9cc; border-radius: 6px; margin-right: 10px;height: 40px;width: 80px;background-color: green">Gửi</button>
									
								</div>
							</div>
	</form>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>