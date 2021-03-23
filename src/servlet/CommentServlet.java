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
import beans.Product;
import database.CommentDao;
import database.ProductDao;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentServlet() {
		super();
		// TODO Auto-generated constructor stub
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
		String productIDS = request.getParameter("productID");
		int productID = Integer.parseInt(productIDS);
		String name = request.getParameter("ten");
		String binhluan = request.getParameter("binhluan");
		int index = Integer.parseInt(request.getParameter("index"));
		int size = 5;
		try {
			Product product = new ProductDao().getProductByID(productID);
			new CommentDao().insertIntoBinhLuan(productID, name, binhluan);
			int count = new CommentDao().countCommentByproductID(productID);
			int endPage = caculate(count);
			ArrayList<Comment> list = new CommentDao().getListCommentByProductID(productID,index,size);
			request.setAttribute("product", product);
			request.setAttribute("listComment", list);
			request.setAttribute("endPage", endPage);
			request.setAttribute("index", index);
			request.getRequestDispatcher("/user/single-product.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// TODO: caculate end page
	protected int caculate(int count) {
		int pagesize = 5;
		int endPage;
		endPage = count / pagesize;
		if (count % pagesize != 0) {
			endPage++;
		}
		return endPage;
	}
}
