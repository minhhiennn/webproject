package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Cart;
import beans.User;
import database.CartDao;

@WebServlet(urlPatterns = { "/CartController" })
public class CartController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("currentSessionUser");
		if (user == null) {
			resp.sendRedirect("http://localhost:8080/WebProject/user/login.jsp");
		} else {
			int userID = user.getID();
			try {
				Cart cart = new CartDao().getCartByUserID(userID);
				session.setAttribute("cart", cart);
				req.getRequestDispatcher("/user/cart.jsp").forward(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}