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
 * Servlet implementation class SingleProductServlet
 */
@WebServlet("/SingleProductServlet")
public class SingleProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SingleProductServlet() {
		super();
		// TODO Auto-generated constructor stub
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String productIDS = request.getParameter("productID");
		int productID = Integer.parseInt(productIDS);
		int index = Integer.parseInt(request.getParameter("index"));
		int size = 5;
		try {
			Product product = new ProductDao().getProductByID(productID);
			int count = new CommentDao().countCommentByproductID(productID);
			int endPage = caculate(count);
			ArrayList<Comment> listComment = new CommentDao().getListCommentByProductID(productID, index, size);
			request.setAttribute("product", product);
			request.setAttribute("listComment", listComment);
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
