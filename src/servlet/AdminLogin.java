package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import database.UserDAO;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLogin() {
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
		if (action.equalsIgnoreCase("loginfromuser")) {
			String userIDS = request.getParameter("userID");
			int userID = Integer.parseInt(userIDS);
			User admin = new UserDAO().getUserByID(userID);
			HttpSession session = request.getSession(true);
			session.setAttribute("admin", admin);
			request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("loginfromadmin")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			User admin = new User();
			admin.setUsername(email);
			admin.setPassword(password);
			try {
				admin = UserDAO.loginFromAdmin(admin);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(admin.isValid()) {
				HttpSession session = request.getSession(true);
				session.setAttribute("admin", admin);
				request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
			}else {
				request.setAttribute("err", "wrong username or password");
				RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
				rd.include(request, response);
			}
		}
	}
}
