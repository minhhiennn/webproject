package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.OrderDetail;
import database.OrderDao;

/**
 * Servlet implementation class AdminQuanLyDonHang
 */
@WebServlet("/AdminQuanLyDonHang")
public class AdminQuanLyDonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminQuanLyDonHang() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		ArrayList<OrderDetail> list = null;
		String OrderDetailID = null;
		String OrderID = null;
		if (action.equalsIgnoreCase("showList")) {
			try {
				list = new OrderDao().getListOrderDetail();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/admin/quanlydonhang.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("delete")) {
			OrderDetailID = request.getParameter("OrderDetailID");
			OrderID = request.getParameter("OrderID");
			try {
				new OrderDao().deleteOrderDetailByOrderDetailID(Integer.parseInt(OrderDetailID),
						Integer.parseInt(OrderID));
				list = new OrderDao().getListOrderDetail();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/admin/quanlydonhang.jsp").forward(request, response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("detail")) {
			OrderDetailID = request.getParameter("OrderDetailID");
			OrderID = request.getParameter("OrderID");
			try {
				OrderDetail orderDetail = new OrderDao().getOrderDetail(Integer.parseInt(OrderDetailID),
						Integer.parseInt(OrderID));
				request.setAttribute("orderDetail", orderDetail);
				request.getRequestDispatcher("/admin/chitietdonhang.jsp").forward(request, response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
