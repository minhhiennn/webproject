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
import beans.Product;
import beans.User;
import database.CartDao;
import database.ProductDao;

@WebServlet(urlPatterns = { "/AddToCartAndDeleteController" })
public class AddToCartAndDeleteController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("currentSessionUser");
		String action = req.getParameter("action");
		String productIDString = req.getParameter("productID");
		int productID = Integer.parseInt(productIDString);
		if (currentUser == null) {
			resp.sendRedirect("http://localhost:8080/WebProject/user/login.jsp");
		} else {
			int userID = currentUser.getID();
			try {
				if (session.getAttribute("cart") == null) {
					Cart cart = new CartDao().getCartByUserID(userID);
					session.setAttribute("cart", cart);
					if (action.equalsIgnoreCase("AddToCart")) {
						if (new CartDao().findProductInCartItem(productID, cart.getID()) == 1) {
							ArrayList<CartItem> list = cart.getList();
							for (int i = 0; i < list.size(); i++) {
								if (list.get(i).getProduct().getID() == productID) {
									int soLuong = list.get(i).getSoLuong() + 1;
									list.get(i).setSoLuong(soLuong);
									list.get(i).setPrice(list.get(i).getPrice() + list.get(i).getProduct().getPrice());
									new CartDao().updateQuantityAboutProductInCartItem(list.get(i).getID(), soLuong,
											cart.getID());
								}
							}
							int total = new CartDao().caculateTotalInCart(cart.getID());
							cart.setTotal(total);
							req.getRequestDispatcher("/user/cart.jsp").forward(req, resp);
						} else {
							ArrayList<CartItem> list = cart.getList();
							int count = new CartDao().countCartItemByCartID(cart.getID());
							int viTriMoi = count + 1;
							new CartDao().insertProductIntoCartitem(viTriMoi, productID, 1, cart.getID());
							Product p = new ProductDao().getProductByID(productID);
							list.add(new CartItem(viTriMoi, p, 1, p.getPrice()));
							int total = new CartDao().caculateTotalInCart(cart.getID());
							cart.setTotal(total);
							req.getRequestDispatcher("/user/cart.jsp").forward(req, resp);
						}
					} else if (action.equalsIgnoreCase("delete")) {
						ArrayList<CartItem> list = cart.getList();
						for (int i = 0; i < list.size(); i++) {
							if (list.get(i).getProduct().getID() == productID) {
								list.remove(list.get(i));
							}
						}
						new CartDao().deleteProductFromCartItem(productID, cart.getID());
						int total = new CartDao().caculateTotalInCart(cart.getID());
						cart.setTotal(total);
						req.getRequestDispatcher("/user/cart.jsp").forward(req, resp);
					}
				} else {
					Cart cart = (Cart) session.getAttribute("cart");
					if (action.equalsIgnoreCase("AddToCart")) {
						if (new CartDao().findProductInCartItem(productID, cart.getID()) == 1) {
							ArrayList<CartItem> list = cart.getList();
							for (int i = 0; i < list.size(); i++) {
								if (list.get(i).getProduct().getID() == productID) {
									int soLuong = list.get(i).getSoLuong() + 1;
									list.get(i).setSoLuong(soLuong);
									list.get(i).setPrice(list.get(i).getPrice() + list.get(i).getProduct().getPrice());
									new CartDao().updateQuantityAboutProductInCartItem(list.get(i).getID(), soLuong,
											cart.getID());
								}
							}
							int total = new CartDao().caculateTotalInCart(cart.getID());
							cart.setTotal(total);
							req.getRequestDispatcher("/user/cart.jsp").forward(req, resp);
						} else {
							ArrayList<CartItem> list = cart.getList();
							int count = new CartDao().countCartItemByCartID(cart.getID());
							int viTriMoi = count + 1;
							new CartDao().insertProductIntoCartitem(viTriMoi, productID, 1, cart.getID());
							Product p = new ProductDao().getProductByID(productID);
							list.add(new CartItem(viTriMoi, p, 1, p.getPrice()));
							int total = new CartDao().caculateTotalInCart(cart.getID());
							cart.setTotal(total);
							req.getRequestDispatcher("/user/cart.jsp").forward(req, resp);
						}
					} else if (action.equalsIgnoreCase("delete")) {
						ArrayList<CartItem> list = cart.getList();
						for (int i = 0; i < list.size(); i++) {
							if (list.get(i).getProduct().getID() == productID) {
								list.remove(list.get(i));
							}
						}
						new CartDao().deleteProductFromCartItem(productID, cart.getID());
						int total = new CartDao().caculateTotalInCart(cart.getID());
						cart.setTotal(total);
						req.getRequestDispatcher("/user/cart.jsp").forward(req, resp);
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
