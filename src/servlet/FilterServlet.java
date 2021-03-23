package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Product;
import database.ProductDao;

/**
 * Servlet implementation class Test
 */
@WebServlet("/FilterServlet")
public class FilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FilterServlet() {
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
		// TODO Auto-generated method stub
		String amount = request.getParameter("amount");
		String nhom = request.getParameter("nhom");
		String productType = request.getParameter("productType");
		String title = request.getParameter("title");
		String[] string = amount.split(" - ");
		int minValue = Integer.parseInt(string[0]);
		int maxValue = Integer.parseInt(string[1]);
		try {
			ProductDao productDao = new ProductDao();
			if (nhom.equalsIgnoreCase("men")) {
				int count = productDao.getCountProductHavePriceBetween(minValue, maxValue, "men",productType);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = productDao.getArrayListProductByTypeForFilter(minValue, maxValue, nhom, index,productType,
						pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("amount", amount);
				request.setAttribute("index", index);
				request.setAttribute("title", title);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/filterMen.jsp").forward(request, response);
			} else if (nhom.equalsIgnoreCase("women")) {
				int count = productDao.getCountProductHavePriceBetween(minValue, maxValue, "women",productType);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = productDao.getArrayListProductByTypeForFilter(minValue, maxValue, nhom, index,productType,
						pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("amount", amount);
				request.setAttribute("index", index);
				request.setAttribute("title", title);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/filterWomen.jsp").forward(request, response);
			} else if (nhom.equalsIgnoreCase("kids")) {
				int count = productDao.getCountProductHavePriceBetween(minValue, maxValue, "kids",productType);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = productDao.getArrayListProductByTypeForFilter(minValue, maxValue, nhom, index,
						productType,pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("amount", amount);
				request.setAttribute("index", index);
				request.setAttribute("title", title);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/filterKid.jsp").forward(request, response);
			} else if (nhom.equalsIgnoreCase("all")) {
				int count = productDao.getCountProductHavePriceBetween(minValue, maxValue);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = productDao.getArrayListProductByTypeForFilter(minValue, maxValue, index,
						pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("amount", amount);
				request.setAttribute("index", index);
				request.setAttribute("title", title);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/filterShop.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	// TODO: caculate end page
	private int caculate(int count) {
		int pagesize = 9;
		int endPage;
		endPage = count / pagesize;
		if (count % pagesize != 0) {
			endPage++;
		}
		return endPage;
	}

}
