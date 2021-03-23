package servlet;

import java.awt.List;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Product;
import database.ProductDao;

/**
 * Servlet implementation class SapXepServlet
 */
@WebServlet("/SapXepServlet")
public class SapXepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SapXepServlet() {
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
		String productType = request.getParameter("productType");
		String nhom = request.getParameter("nhom");
		String sortcode = request.getParameter("sortcode");
		String title = request.getParameter("title");
		try {
			ProductDao productDao = new ProductDao();
			if (nhom.equalsIgnoreCase("men")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, nhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ArrayList<Product>();
				switch (sortcode) {
				case "AtoZ":
					list = productDao.getArrayListProductByTypeProductAndNhomByName(productType, nhom, index, pageSize);
					break;
				case "ZtoA":
					list = productDao.getArrayListProductByTypeProductAndNhomByNameDESC(productType, nhom, index,
							pageSize);
					break;
				case "lowtohigh":
					list = productDao.getArrayListProductByTypeProductAndNhomByPrice(productType, nhom, index,
							pageSize);
					break;
				case "hightolow":
					list = productDao.getArrayListProductByTypeProductAndNhomByPriceDESC(productType, nhom, index,
							pageSize);
					break;
				default:
					break;
				}
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", title);
				request.setAttribute("sortcode", sortcode);
				request.setAttribute("nhom", nhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/sortMen.jsp").forward(request, response);
			}else if(nhom.equalsIgnoreCase("women")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, nhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ArrayList<Product>();
				switch (sortcode) {
				case "AtoZ":
					list = productDao.getArrayListProductByTypeProductAndNhomByName(productType, nhom, index, pageSize);
					break;
				case "ZtoA":
					list = productDao.getArrayListProductByTypeProductAndNhomByNameDESC(productType, nhom, index,
							pageSize);
					break;
				case "lowtohigh":
					list = productDao.getArrayListProductByTypeProductAndNhomByPrice(productType, nhom, index,
							pageSize);
					break;
				case "hightolow":
					list = productDao.getArrayListProductByTypeProductAndNhomByPriceDESC(productType, nhom, index,
							pageSize);
					break;
				default:
					break;
				}
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", title);
				request.setAttribute("sortcode", sortcode);
				request.setAttribute("nhom", nhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/sortWomen.jsp").forward(request, response);
			}else if(nhom.equalsIgnoreCase("kids")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, nhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ArrayList<Product>();
				switch (sortcode) {
				case "AtoZ":
					list = productDao.getArrayListProductByTypeProductAndNhomByName(productType, nhom, index, pageSize);
					break;
				case "ZtoA":
					list = productDao.getArrayListProductByTypeProductAndNhomByNameDESC(productType, nhom, index,
							pageSize);
					break;
				case "lowtohigh":
					list = productDao.getArrayListProductByTypeProductAndNhomByPrice(productType, nhom, index,
							pageSize);
					break;
				case "hightolow":
					list = productDao.getArrayListProductByTypeProductAndNhomByPriceDESC(productType, nhom, index,
							pageSize);
					break;
				default:
					break;
				}
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", title);
				request.setAttribute("sortcode", sortcode);
				request.setAttribute("nhom", nhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/sortKids.jsp").forward(request, response);
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
