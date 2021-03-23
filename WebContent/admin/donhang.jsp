<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>


    <title>SB Admin 2 - Tables</title>

</head>
<jsp:include page="header.jsp"></jsp:include>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Quản Lí Đơn Hàng</h1>
                    <p class="mb-4"> <a target="_blank"
                            href="https://datatables.net"></a>.</p>
                       
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        	<div
							style="display: flex; justify-content: flex-end; text-align: right; padding: 10px 19px">
							<button
								style="border: none; border-radius: 6px; padding: 8px; margin-right: 15px; background-color: #4e73df;">
								<i class="fas fa-plus" style="margin-right: 3px"></i> <span>Thêm</span>
							</button>
							<button
								style="border: none; border-radius: 6px; padding: 8px; margin-right: 15px; background-color: #e74a3b;">
								<i class="fas fa-trash" style="margin-right: 5px"></i> <span>Xóa
									tất cả</span>
							</button>
							<button
								style="border: none; border-radius: 6px; padding: 8px; background-color: #1cc88a;">
								<i class="fas fa-file-upload" style="margin-right: 5px"></i> <span>Import
									to Excel</span>
							</button>
						</div>
						<div style="display: flex; padding: 5px 19px">
							<button style="padding: 8px 15px;border: 1px solid black;border-right: 1px solid #fff;background-color: #fff;">Copy</button>
							<button style="padding: 8px 15px;border: 1px solid black;border-right: 1px solid #fff;background-color: #fff;">CSV</button>
							<button style="padding: 8px 15px;border: 1px solid black;border-right: 1px solid #fff;background-color: #fff;">Excel</button>
							<button style="padding: 8px 15px;border: 1px solid black;background-color: #fff;">Print</button>
						</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Mã Đơn Hàng</th>
                                            <th>Tên Đơn Hàng</th>
                                            <th>Nhà sản xuất</th>
                                            <th>Số Lượng </th>
                                            <th>Đơn Giá</th>
                                            <th>Thuế(%)</th>
                                            <th>Chiết Khấu</th>
                                            <th>Thành Tiền</th>
                                            <th>Xóa</th>
											<th>Sửa</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <tr>
                                            <td>h122333</td>
                                            <td>Đơn hàng3</td>
                                            <td>eshop</td>
                                            <td>2</td>
                                            <td>50</td>
                                            <th>0</th>
                                            <th>0</th>
                                            <td>100.000vnd</td>
                                            	<td>
												<button type="button">
													<i class="fas fa-trash-alt"></i>
												</button>
											</td>

											<th>
												<button type="button">
													<i class="fas fa-tools"></i>
												</button>
											</th>
                                            

                                        </tr>
                                        <tr>
                                            <td>h12233</td>
                                            <td>Đơn hàng4</td>
                                            <td>eshop</td>
                                            <td>2</td>
                                            <td>50</td>
                                            <th>0</th>
                                            <th>0</th>
                                            <td>100.000vnd</td>
                                            	<td>
												<button type="button">
													<i class="fas fa-trash-alt"></i>
												</button>
											</td>

											<th>
												<button type="button">
													<i class="fas fa-tools"></i>
												</button>
											</th>
                                            

                                        </tr>
                                        <tr>
                                            <td>h122873</td>
                                            <td>Đơn hàng5</td>
                                            <td>eshop</td>
                                            <td>2</td>
                                            <td>50</td>
                                            <th>0</th>
                                            <th>0</th>
                                            <td>100.000vnd</td>
                                            	<td>
												<button type="button">
													<i class="fas fa-trash-alt"></i>
												</button>
											</td>

											<th>
												<button type="button">
													<i class="fas fa-tools"></i>
												</button>
											</th>
                                            

                                        </tr>
                                        <tr>
                                            <td>h1223444</td>
                                            <td>Đơn hàng6</td>
                                            <td>eshop</td>
                                            <td>2</td>
                                            <td>50</td>
                                            <th>0</th>
                                            <th>0</th>
                                            <td>100.000vnd</td>
                                            	<td>
												<button type="button">
													<i class="fas fa-trash-alt"></i>
												</button>
											</td>

											<th>
												<button type="button">
													<i class="fas fa-tools"></i>
												</button>
											</th>

                                        </tr>
                                        <tr>
                                            <td>h1266633</td>
                                            <td>Đơn hàng9</td>
                                            <td>eshop</td>
                                            <td>2</td>
                                            <td>50</td>
                                            <th>0</th>
                                            <th>0</th>
                                            <td>100.000vnd</td>
                                            	<td>
												<button type="button">
													<i class="fas fa-trash-alt"></i>
												</button>
											</td>

											<th>
												<button type="button">
													<i class="fas fa-tools"></i>
												</button>
											</th>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
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