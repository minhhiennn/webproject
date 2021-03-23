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

@WebServlet(urlPatterns = { "/ProductServlet" })
public class ProductServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
//		resp.setContentType("text/html;charset=UTF-8");
//		req.setCharacterEncoding("UTF-8");
//		String searchProduct = req.getParameter("search");
//		String selectform = req.getParameter("select");
//		try {
//			ArrayList<Product> listProduct = new ProductDao().getProductListContainStringName(searchProduct);
//			if (listProduct != null && selectform.equals("All Categories")) {
//				req.setAttribute("listitem", listProduct);
//				RequestDispatcher rd = req.getRequestDispatcher("/user/search.jsp");
//				rd.include(req,resp);
//			} else {
//				resp.sendRedirect("http://localhost:8080/WebProject/user/index.jsp");
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		try {
//			ProductDao productDao = new ProductDao();
//			int count = productDao.getCountProductContainStringName(searchProduct);
//			String indexString = req.getParameter("index");
//			int index = Integer.parseInt(indexString);
//			int pageSize = 9;
//			int endPage = caculate(count);
//			// ArrayList<Product> list = productDao.getArrayListForPageSearch(searchProduct,
//			// index, pageSize);
//			if (index == 1) {
//				req.setAttribute("endPage", endPage);
//				req.getRequestDispatcher("/user/search.jsp").forward(req, resp);
//
//			}
//		} catch (SQLException e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String searchProduct = req.getParameter("search");
		String selectform = req.getParameter("select");
		try {
			ProductDao productDao = new ProductDao();
			if (selectform.equals("All Categories")) {
				int count = productDao.getCountProductContainStringName(searchProduct);
				String indexString = req.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = productDao.getArrayListForPageSearch(searchProduct, index, pageSize);
				req.setAttribute("endPage", endPage);
				req.setAttribute("list", list);
				req.setAttribute("search", searchProduct);
				req.setAttribute("select", selectform);
				req.setAttribute("index", index);
				req.getRequestDispatcher("/user/searchShop.jsp").forward(req, resp);
			} else if (selectform.equals("Categorie One")) {
                int count = productDao.getCountProductContainStringNameAndNhom(searchProduct, "men");
                String indexString = req.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = productDao.getArrayListByTypeProductForPageSearch(searchProduct, "men", index, pageSize);
				req.setAttribute("endPage", endPage);
				req.setAttribute("list", list);
				req.setAttribute("search", searchProduct);
				req.setAttribute("select", selectform);
				req.setAttribute("index", index);
				req.getRequestDispatcher("/user/searchMen.jsp").forward(req, resp);
			}else if(selectform.equals("Categorie Two")) {
				int count = productDao.getCountProductContainStringNameAndNhom(searchProduct, "women");
                String indexString = req.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = productDao.getArrayListByTypeProductForPageSearch(searchProduct, "women", index, pageSize);
				req.setAttribute("endPage", endPage);
				req.setAttribute("list", list);
				req.setAttribute("search", searchProduct);
				req.setAttribute("select", selectform);
				req.setAttribute("index", index);
				req.getRequestDispatcher("/user/searchWomen.jsp").forward(req, resp);
			} else if(selectform.equals("Categorie Three")) {
				int count = productDao.getCountProductContainStringNameAndNhom(searchProduct, "kids");
                String indexString = req.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = productDao.getArrayListByTypeProductForPageSearch(searchProduct, "kids", index, pageSize);
				req.setAttribute("endPage", endPage);
				req.setAttribute("list", list);
				req.setAttribute("search", searchProduct);
				req.setAttribute("select", selectform);
				req.setAttribute("index", index);
				req.getRequestDispatcher("/user/searchKid.jsp").forward(req, resp);
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
