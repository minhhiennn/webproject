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
import database.ProductDao;

/**
 * Servlet implementation class KiemTraGioHang
 */
@WebServlet("/KiemTraGioHang")
public class KiemTraGioHang extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KiemTraGioHang() {
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
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		try {
			if (checkGioHang(cart.getList()) == true) {
				response.sendRedirect("http://localhost:8080/WebProject/user/checkout.jsp");
			} else {
				request.setAttribute("err", "err");
				request.getRequestDispatcher("/user/cart.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private boolean checkGioHang(ArrayList<CartItem> list) throws SQLException {
		for (int i = 0; i < list.size(); i++) {
			int tonKho = new ProductDao().getTonKhoByProductID(list.get(i).getProduct().getID());
			int soluong = list.get(i).getSoLuong();
			if (soluong > tonKho) {
				return false;
			}
		}
		return true;
	}
}
