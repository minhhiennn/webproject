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
import database.CartDao;

/**
 * Servlet implementation class OnSubmitTest
 */
@WebServlet("/OnSubmitTest")
public class OnSubmitTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OnSubmitTest() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		ArrayList<CartItem> list = cart.getList();
		try {
			for (int i = 0; i < list.size(); i++) {
				String indexS = String.valueOf(list.get(i).getProduct().getID());
				int index = Integer.parseInt(request.getParameter(indexS));
				new CartDao().updateQuantityAboutProductInCartItem(list.get(i).getID(), index, cart.getID());
				list.get(i).setSoLuong(index);
				list.get(i).setPrice(index * list.get(i).getProduct().getPrice());
				int total = new CartDao().caculateTotalInCart(cart.getID());
				cart.setTotal(total);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("user/cart.jsp").forward(request, response);
	}

}
