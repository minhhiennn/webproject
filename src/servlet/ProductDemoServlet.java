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
 * Servlet implementation class ProductDemoServlet
 */
@WebServlet("/ProductDemoServlet")
public class ProductDemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductDemoServlet() {
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
		String productType = request.getParameter("productType");
		String thuocnhom = request.getParameter("nhom");
		try {
			ProductDao productDao = new ProductDao();
			if(productType.equalsIgnoreCase("aokhoacnam")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, thuocnhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ProductDao().getArrayListProductByTypeProductAndNhom(productType, thuocnhom, index, pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", "Áo khoác");
				request.setAttribute("nhom", thuocnhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/men.jsp").forward(request, response);	
			}else if(productType.equalsIgnoreCase("aosominam")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, thuocnhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ProductDao().getArrayListProductByTypeProductAndNhom(productType, thuocnhom, index, pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", "Áo sơ mi");
				request.setAttribute("nhom", thuocnhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/men.jsp").forward(request, response);	
			}else if(productType.equalsIgnoreCase("giaynam")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, thuocnhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ProductDao().getArrayListProductByTypeProductAndNhom(productType, thuocnhom, index, pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", "Giày bata");
				request.setAttribute("nhom", thuocnhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/men.jsp").forward(request, response);	
			}else if(productType.equalsIgnoreCase("quanjean")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, thuocnhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ProductDao().getArrayListProductByTypeProductAndNhom(productType, thuocnhom, index, pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", "Quần jean");
				request.setAttribute("nhom", thuocnhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/men.jsp").forward(request, response);
			}else if(productType.equalsIgnoreCase("aokhoacnu")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, thuocnhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ProductDao().getArrayListProductByTypeProductAndNhom(productType, thuocnhom, index, pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", "Áo khoác");
				request.setAttribute("nhom", thuocnhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/women.jsp").forward(request, response);
			}else if(productType.equalsIgnoreCase("giaynu")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, thuocnhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ProductDao().getArrayListProductByTypeProductAndNhom(productType, thuocnhom, index, pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", "Giày nữ");
				request.setAttribute("nhom", thuocnhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/women.jsp").forward(request, response);
			}else if(productType.equalsIgnoreCase("quanjeansnu")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, thuocnhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ProductDao().getArrayListProductByTypeProductAndNhom(productType, thuocnhom, index, pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", "Quần jean nữ");
				request.setAttribute("nhom", thuocnhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/women.jsp").forward(request, response);
			}else if(productType.equalsIgnoreCase("tuinu")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, thuocnhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ProductDao().getArrayListProductByTypeProductAndNhom(productType, thuocnhom, index, pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", "Túi nữ");
				request.setAttribute("nhom", thuocnhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/women.jsp").forward(request, response);
			}else if(productType.equalsIgnoreCase("begai5tuoi")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, thuocnhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ProductDao().getArrayListProductByTypeProductAndNhom(productType, thuocnhom, index, pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", "Bé gái 5 tuổi");
				request.setAttribute("nhom", thuocnhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/kids.jsp").forward(request, response);
			}else if(productType.equalsIgnoreCase("begai5thangtuoi")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, thuocnhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ProductDao().getArrayListProductByTypeProductAndNhom(productType, thuocnhom, index, pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", "Bé gái 5 tháng tuổi");
				request.setAttribute("nhom", thuocnhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/kids.jsp").forward(request, response);
			}else if(productType.equalsIgnoreCase("dotreemnam")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, thuocnhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ProductDao().getArrayListProductByTypeProductAndNhom(productType, thuocnhom, index, pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", "Đồ trẻ em nam");
				request.setAttribute("nhom", thuocnhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/kids.jsp").forward(request, response);
			}else if(productType.equalsIgnoreCase("dotreemnam5thang")) {
				int count = productDao.getCountProductByProductTypeAndNhom(productType, thuocnhom);
				String indexString = request.getParameter("index");
				int index = Integer.parseInt(indexString);
				int pageSize = 9;
				int endPage = caculate(count);
				ArrayList<Product> list = new ProductDao().getArrayListProductByTypeProductAndNhom(productType, thuocnhom, index, pageSize);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				request.setAttribute("index", index);
				request.setAttribute("title", "Đồ trẻ em nam 5 tháng");
				request.setAttribute("nhom", thuocnhom);
				request.setAttribute("typeProduct", productType);
				request.getRequestDispatcher("/user/kids.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
