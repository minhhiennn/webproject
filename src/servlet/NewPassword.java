package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.UserDAO;

@WebServlet(urlPatterns = { "/NewPassword" })
public class NewPassword extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String email = req.getParameter("email");
		String newPassword = req.getParameter("new-psw");
		String repeatPassword = req.getParameter("psw");
		if (newPassword.equals(repeatPassword)) {
			try {
				int i = UserDAO.updatePasswordForUser(email, newPassword);
				if (i > 0) {
					resp.sendRedirect("http://localhost:8080/WebProject/user/login.jsp");
				} else {
					req.setAttribute("err", "email is not available in database");
					req.getRequestDispatcher("/user/Thaydoimatkhau.jsp").forward(req, resp);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			req.setAttribute("err", "That password doesn't match. Try again");
			req.getRequestDispatcher("/user/Thaydoimatkhau.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
