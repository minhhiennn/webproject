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

import beans.Product;
import beans.User;
import beans.WishList;
import beans.WishListItem;
import database.ProductDao;
import database.WishListDao;

/**
 * Servlet implementation class AddToWishListController
 */
@WebServlet("/AddToWishListController")
public class AddToWishListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToWishListController() {
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
		User user = (User) session.getAttribute("currentSessionUser");
		String productIDS = request.getParameter("productID");
		int productID = Integer.parseInt(productIDS);
		if (user == null) {
			response.sendRedirect("http://localhost:8080/WebProject/user/login.jsp");
		} else {
			try {
				if (session.getAttribute("wishlist") == null) {
					WishList wishList = new WishListDao().getWishListByUserId(user.getID());
					session.setAttribute("wishlist", wishList);
					if (new WishListDao().findProductInWishListItem(productID, wishList.getID()) == 1) {
						// Do Nothing
						request.getRequestDispatcher("user/look-book.jsp").forward(request, response);
					} else {
						ArrayList<WishListItem> list = wishList.getList();
						int size = list.size();
						int viTriMoi = size + 1;
						new WishListDao().insertProductIntoWishListItem(viTriMoi, productID, wishList.getID());
						Product product = new ProductDao().getProductByID(productID);
						list.add(new WishListItem(viTriMoi, product));
						request.getRequestDispatcher("user/look-book.jsp").forward(request, response);
					}
				} else {
					WishList wishList = (WishList) session.getAttribute("wishlist");
					if (new WishListDao().findProductInWishListItem(productID, wishList.getID()) == 1) {
						// Do Nothing
						request.getRequestDispatcher("user/look-book.jsp").forward(request, response);
					} else {
						ArrayList<WishListItem> list = wishList.getList();
						int size = list.size();
						int viTriMoi = size + 1;
						new WishListDao().insertProductIntoWishListItem(viTriMoi, productID, wishList.getID());
						Product product = new ProductDao().getProductByID(productID);
						list.add(new WishListItem(viTriMoi, product));
						request.getRequestDispatcher("user/look-book.jsp").forward(request, response);
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
