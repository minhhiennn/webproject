package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Comment;
import database.CommentDao;

/**
 * Servlet implementation class AdminThongKeBinhLuan
 */
@WebServlet("/AdminThongKeBinhLuan")
public class AdminThongKeBinhLuan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminThongKeBinhLuan() {
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
		String action = request.getParameter("action");
		ArrayList<Comment> list = null;
		if (action.equalsIgnoreCase("thongke")) {
			String dateStart = request.getParameter("dateStart");
			String dateEnd = request.getParameter("dateEnd");
			try {
				list = new CommentDao().getListCommentByDate(dateStart, dateEnd);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.setAttribute("dateStart", dateStart);
			request.setAttribute("dateEnd", dateEnd);
			request.getRequestDispatcher("/admin/Thongkebinhluan.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("delete")) {
			String productIDS = request.getParameter("productID");
			String commentIDS = request.getParameter("commentID");
			String dateStart = request.getParameter("dateStart");
			String dateEnd = request.getParameter("dateEnd");
			try {
				new CommentDao().deleteCommentByIDAndProductID(Integer.parseInt(commentIDS),
						Integer.parseInt(productIDS));
				list = new CommentDao().getListCommentByDate(dateStart, dateEnd);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.setAttribute("dateStart", dateStart);
			request.setAttribute("dateEnd", dateEnd);
			request.getRequestDispatcher("/admin/Thongkebinhluan.jsp").forward(request, response);
		}
	}

}
