package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;
import database.UserDAO;

@WebServlet("/UserAdminView")
public class UserAdminView extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		String action = req.getParameter("action");
		UserDAO user = new UserDAO();
		if (action == null) {
			req.getRequestDispatcher("/admin/quanlyuser.jsp").forward(req, resp);
		}
		switch (action) {
		case "List":
			ArrayList<User> list = user.getListUser();
			req.setAttribute("Listcustomer", list);
			req.getRequestDispatcher("/admin/quanlyuser.jsp").forward(req, resp);
			break;
		case "AddOrEdit":
//			id = req.getParameter("ID");
//			if (id != null) {
//				nguoidung = user.getUserByID(Integer.parseInt(id));
//
//				if (nguoidung == null) {
//					nguoidung = new User(100, "hien", "1234", "user", true);
//				}
//
//			}
//			req.setAttribute("customer", nguoidung);
			req.getRequestDispatcher("/admin/themmoiuser.jsp").forward(req, resp);
			break;
		case "Insert":
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String password_repeat = req.getParameter("password_repeat");
			String quyen = req.getParameter("quyen");
			if (username.contains("@") && !username.startsWith("@") && username.length() > 6) {
				if (!password_repeat.equalsIgnoreCase(password)) {
					req.setAttribute("err", "password does not match");
					req.getRequestDispatcher("/admin/themmoiuser.jsp").forward(req, resp);
				} else {
					try {
						UserDAO.insert(username, password, quyen);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					resp.sendRedirect("http://localhost:8080/WebProject/UserAdminView?action=List");
				}
			}else {
				req.setAttribute("err", "invalid email");
				req.getRequestDispatcher("/admin/themmoiuser.jsp").forward(req, resp);
			}
			break;
		case "Delete":
			String idi = req.getParameter("id");
			int uidi = Integer.parseInt(idi);
			System.out.println(uidi);
			try {
				if (UserDAO.delete(uidi))
					resp.sendRedirect("http://localhost:8080/WebProject/UserAdminView?action=List");
			} catch (SQLException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}
			break;
		case "DeleteAll":
			try {
				if (UserDAO.deleteALL()) {
					resp.sendRedirect("http://localhost:8080/WebProject/UserAdminView?action=List");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "Redirect":
			resp.sendRedirect("http://localhost:8080/WebProject/UserAdminView?action=List");
			break;
		case "Detail":
			String ID = req.getParameter("id");
			User user2 = new UserDAO().getUserByID(Integer.parseInt(ID));
			req.setAttribute("user", user2);
			req.getRequestDispatcher("/admin/ChiTietUser.jsp").forward(req, resp);
			break;
		case "saveEdit":
			String ID2 = req.getParameter("userID");
			String username2 = req.getParameter("username");
			String password2 = req.getParameter("password");
			String quyen2 = req.getParameter("quyen");
			if (username2.contains("@") && !username2.startsWith("@") && username2.length() > 6) {
				new UserDAO().updateUserByID(Integer.parseInt(ID2), username2, password2, quyen2);
				resp.sendRedirect("http://localhost:8080/WebProject/UserAdminView?action=List");
			} else {
				User user3 = new UserDAO().getUserByID(Integer.parseInt(ID2));
				req.setAttribute("user", user3);
				req.setAttribute("err", "invalid email");
				req.getRequestDispatcher("/admin/EditUser.jsp").forward(req, resp);
			}
			break;
		case "edit":
			String ID3 = req.getParameter("id");
			User user3 = new UserDAO().getUserByID(Integer.parseInt(ID3));
			req.setAttribute("user", user3);
			req.getRequestDispatcher("/admin/EditUser.jsp").forward(req, resp);
			break;
		}

	}
}
