package servlet;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Time;
import database.JavaMailUlti;

@WebServlet(urlPatterns = { "/ForgotPasswordServlet" })
public class ForgotPasswordServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Time time;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String indexString = req.getParameter("index");
		int index = Integer.parseInt(indexString);
		if (index == 1) {
			if (time == null || time.isStatus() == false) {
				time = new Time();
			}
			try {
				req.setAttribute("forgotPassword", "forgotPassword");
				JavaMailUlti.sendMail(email);
				req.getRequestDispatcher("/user/forgotpassword.jsp").forward(req, resp);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (index == 2) {
			boolean status = time.isStatus();
			if (status == true) {
				resp.sendRedirect("http://localhost:8080/WebProject/user/Thaydoimatkhau.jsp");
			} else {
				resp.sendRedirect("http://localhost:8080/WebProject/user/404.jsp");
			}
		}
	}
}
