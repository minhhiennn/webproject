package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;
import database.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		String email = request.getParameter("email");
		String psw = request.getParameter("psw");
		String pswrepeat = request.getParameter("psw-repeat");
		if (email.contains("@") && !email.startsWith("@") && email.length() > 6) {
			try {
				User user = new User();
				if (psw.equals(pswrepeat)) {
					user.setUsername(request.getParameter("email"));
					user.setPassword(request.getParameter("psw"));
					user = UserDAO.register(user);
					if (user.isValid() == false) {
						response.sendRedirect("http://localhost:8080/WebProject/user/login.jsp");
					} else {
						request.setAttribute("err", "this username has already used");
						request.getRequestDispatcher("/user/register.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("err", "That password doesn't match. Try again");
					request.getRequestDispatcher("/user/register.jsp").forward(request, response);
				}
			}
			catch (Throwable theException) {
				response.sendRedirect("http://localhost:8080/WebProject/user/404.jsp"); // error page
				System.out.println(theException);
			}
		} else {
			request.setAttribute("err", "invalid email");
			request.getRequestDispatcher("/user/register.jsp").forward(request, response);
		}
	}
}
