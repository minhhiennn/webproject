package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Comment;
import database.CommentDao;

/**
 * Servlet implementation class AdminQuanLyBinhLuan
 */
@WebServlet("/AdminQuanLyBinhLuan")
public class AdminQuanLyBinhLuan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminQuanLyBinhLuan() {
		super();
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
		String action = request.getParameter("action");
		String productIDS = null;
		String commentIDS = null;
		List<Comment> list = null;
		switch (action) {
		case "showList":
			try {
				list = new CommentDao().getAllListComment();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("/admin/quanlybinhluan.jsp").forward(request, response);
			break;
		case "deletecomment":
			productIDS = request.getParameter("productID");
			commentIDS = request.getParameter("commentID");
			try {
				new CommentDao().deleteCommentByIDAndProductID(Integer.parseInt(commentIDS),
						Integer.parseInt(productIDS));
				list = new CommentDao().getAllListComment();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/admin/quanlybinhluan.jsp").forward(request, response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "deleteAll":
			try {
				new CommentDao().deleteAll();
				list = new CommentDao().getAllListComment();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("/admin/quanlybinhluan.jsp").forward(request, response);
			break;
		default:
			break;
		}
	}

}
