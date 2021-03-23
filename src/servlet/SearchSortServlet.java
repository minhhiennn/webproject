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
 * Servlet implementation class SearchSortServlet
 */
@WebServlet("/SearchSortServlet")
public class SearchSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchSortServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String searchProduct = request.getParameter("search");
		String selectform = request.getParameter("select");
		String sortcode = request.getParameter("sortcode");
		try {
			ProductDao productDao = new ProductDao();
			if (selectform.equals("All Categories")) {
				int count = productDao.getCountProductContainStringName(searchProduct);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ArrayList<Product>();
				switch (sortcode) {
				case "AtoZ":
					list = productDao.getArrayListForPageSearchAndSortByName(searchProduct, index, pageSize);
					break;
				case "ZtoA":
					list = productDao.getArrayListForPageSearchAndSortByNameDESC(searchProduct, index, pageSize);
					break;
				case "lowtohigh":
					list = productDao.getArrayListForPageSearchAndSortByPrice(searchProduct, index, pageSize);
					break;
				case "hightolow":
					list = productDao.getArrayListForPageSearchAndSortByPriceDESC(searchProduct, index, pageSize);
				default:
					break;
				}
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("search", searchProduct);
				request.setAttribute("select", selectform);
				request.setAttribute("sortcode", sortcode);
				request.setAttribute("index", index);
				request.getRequestDispatcher("/user/searchsortShop.jsp").forward(request, response);
			} else if (selectform.equals("Categorie One")) {
				int count = productDao.getCountProductContainStringNameAndNhom(searchProduct, "men");
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ArrayList<Product>();
				switch (sortcode) {
				case "AtoZ":
					list = productDao.getArrayListByTypeProductForPageSearchAndSortByName(searchProduct, "men", index,
							pageSize);
					break;
				case "ZtoA":
					list = productDao.getArrayListByTypeProductForPageSearchAndSortByNameDESC(searchProduct, "men",
							index, pageSize);
					break;
				case "lowtohigh":
					list = productDao.getArrayListByTypeProductForPageSearchAndSortByPrice(searchProduct, "men", index,
							pageSize);
					break;
				case "hightolow":
					list = productDao.getArrayListByTypeProductForPageSearchAndSortByPriceDESC(searchProduct, "men",
							index, pageSize);
					break;
				default:
					break;
				}
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("search", searchProduct);
				request.setAttribute("select", selectform);
				request.setAttribute("sortcode", sortcode);
				request.setAttribute("index", index);
				request.getRequestDispatcher("/user/searchsortMen.jsp").forward(request, response);
			} else if (selectform.equals("Categorie Two")) {
				int count = productDao.getCountProductContainStringNameAndNhom(searchProduct, "women");
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ArrayList<Product>();
				switch (sortcode) {
				case "AtoZ":
					list = productDao.getArrayListByTypeProductForPageSearchAndSortByName(searchProduct, "women", index,
							pageSize);
					break;
				case "ZtoA":
					list = productDao.getArrayListByTypeProductForPageSearchAndSortByNameDESC(searchProduct, "women",
							index, pageSize);
					break;
				case "lowtohigh":
					list = productDao.getArrayListByTypeProductForPageSearchAndSortByPrice(searchProduct, "women", index,
							pageSize);
					break;
				case "hightolow":
					list = productDao.getArrayListByTypeProductForPageSearchAndSortByPriceDESC(searchProduct, "women",
							index, pageSize);
					break;
				default:
					break;
				}
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("search", searchProduct);
				request.setAttribute("select", selectform);
				request.setAttribute("sortcode", sortcode);
				request.setAttribute("index", index);
				request.getRequestDispatcher("/user/searchsortWomen.jsp").forward(request, response);
			} else if (selectform.equals("Categorie Three")) {
				int count = productDao.getCountProductContainStringNameAndNhom(searchProduct, "kids");
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ArrayList<Product>();
				switch (sortcode) {
				case "AtoZ":
					list = productDao.getArrayListByTypeProductForPageSearchAndSortByName(searchProduct, "kids", index,
							pageSize);
					break;
				case "ZtoA":
					list = productDao.getArrayListByTypeProductForPageSearchAndSortByNameDESC(searchProduct, "kids",
							index, pageSize);
					break;
				case "lowtohigh":
					list = productDao.getArrayListByTypeProductForPageSearchAndSortByPrice(searchProduct, "kids", index,
							pageSize);
					break;
				case "hightolow":
					list = productDao.getArrayListByTypeProductForPageSearchAndSortByPriceDESC(searchProduct, "kids",
							index, pageSize);
					break;
				default:
					break;
				}
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("search", searchProduct);
				request.setAttribute("select", selectform);
				request.setAttribute("sortcode", sortcode);
				request.setAttribute("index", index);
				request.getRequestDispatcher("/user/searchsortKids.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	// TODO: caculate end page
	protected int caculate(int count) {
		int pagesize = 9;
		int endPage;
		endPage = count / pagesize;
		if (count % pagesize != 0) {
			endPage++;
		}
		return endPage;
	}

}
