package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Cart;
import beans.CartItem;
import beans.DonHang;
import beans.User;
import database.CartDao;
import database.OrderDao;
import database.ProductDao;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckOutServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("currentSessionUser");
		if (action.equalsIgnoreCase("checkout")) {
			String quocgia = request.getParameter("country");
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String phone = request.getParameter("phone");
			ArrayList<CartItem> list = cart.getList();
			try {
				updateSoLuongTonKho(list);
				new OrderDao().insertOrderDetailByOrderID(cart.getID(), quocgia, name, address, city, phone,
						cart.getTotal());
				new CartDao().deleteCartItemByCartID(cart.getID());
				DonHang donHang = new OrderDao().getDonHangByUserID(cart.getID());
				session.setAttribute("order", donHang);
				request.getRequestDispatcher("/user/orderDetail.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("direct")) {
			try {
				if (session.getAttribute("order") == null) {
					DonHang donHang = new OrderDao().getDonHangByUserID(user.getID());
					session.setAttribute("order", donHang);
					request.getRequestDispatcher("/user/orderDetail.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("/user/orderDetail.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("delete")) {
			int orderDetailID = Integer.parseInt(request.getParameter("orderDetailID"));
			try {
				new OrderDao().deleteOrderDetailByOrderDetailID(orderDetailID, user.getID());
				DonHang donHang = new OrderDao().getDonHangByUserID(user.getID());
				session.setAttribute("order", donHang);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/user/orderDetail.jsp").forward(request, response);
		}
	}

	private void updateSoLuongTonKho(ArrayList<CartItem> list) throws SQLException {
		for (int i = 0; i < list.size(); i++) {
			int soLuongTonKhoCu = new ProductDao().getTonKhoByProductID(list.get(i).getProduct().getID());
			int soluong = list.get(i).getSoLuong();
			int soLuongTonKhoCapNhat = soLuongTonKhoCu - soluong;
			new ProductDao().updateSoLuongTonKho(list.get(i).getProduct().getID(), soLuongTonKhoCapNhat);
		}
	}
}
