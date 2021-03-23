package servlet;

import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import database.CartDao;
import database.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		try {
			User user = new User();
			user.setUsername(request.getParameter("uname"));
			user.setPassword(request.getParameter("psw"));
			user = UserDAO.login(user);
			if (user.isValid()) {
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", user);
				response.sendRedirect("http://localhost:8080/WebProject/user/index.jsp"); // logged-in page
			} else {
				request.setAttribute("err", "wrong username or password");
				RequestDispatcher rd = request.getRequestDispatcher("/user/login.jsp");
				rd.include(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Lỗi kết nối CSDL");
			request.setAttribute("err", "fail connect CSDL");
			response.sendRedirect("http://localhost:8080/WebProject/user/login.jsp");
		}
	}
}
