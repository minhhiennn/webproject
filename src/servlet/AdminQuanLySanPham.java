package servlet;

import java.io.IOException;
import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Product;
import database.CommentDao;
import database.ProductDao;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class AdminQuanLySanPham
 */
@WebServlet("/AdminQuanLySanPham")
public class AdminQuanLySanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminQuanLySanPham() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		ArrayList<Product> list = null;
		if (action.equalsIgnoreCase("showAll")) {
			try {
				list = new ProductDao().getListProduct();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("/admin/SanPham.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("delete")) {
			String productIDS = request.getParameter("productID");
			try {
				ProductDao productDao = new ProductDao();
				productDao.deleteImgByProductID(Integer.parseInt(productIDS));
				new CommentDao().deleteCommentByProductID(Integer.parseInt(productIDS));
				productDao.deleteProductByProductID(Integer.parseInt(productIDS));
				list = productDao.getListProduct();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("/admin/SanPham.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("deleteAll")) {
			try {
				ProductDao productDao = new ProductDao();
				productDao.deleteAllImg();
				new CommentDao().deleteAll();
				productDao.deleteAllProduct();
				list = productDao.getListProduct();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("/admin/SanPham.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("edit")) {
			String productIDS = request.getParameter("productID");
			Product product = null;
			try {
				ProductDao productDao = new ProductDao();
				product = productDao.getProductByID(Integer.parseInt(productIDS));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("product", product);
			request.getRequestDispatcher("/admin/SuaSanPham.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("saveEdit")) {
			String productID = request.getParameter("productID");
			String productName = request.getParameter("productName");
			String productPrice = request.getParameter("productPrice");
			String tonkho = request.getParameter("tonkho");
			String description = request.getParameter("description");
			if (Integer.parseInt(productPrice) > 0) {
				if (Integer.parseInt(tonkho) > 0) {
					try {
						new ProductDao().updateProductByProductID(Integer.parseInt(productID), productName,
								Integer.parseInt(productPrice), Integer.parseInt(tonkho), description);
						list = new ProductDao().getListProduct();
					} catch (NumberFormatException e) {
						e.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					request.setAttribute("list", list);
					request.getRequestDispatcher("/admin/SanPham.jsp").forward(request, response);
				} else {
					Product product = null;
					try {
						ProductDao productDao = new ProductDao();
						product = productDao.getProductByID(Integer.parseInt(productID));
					} catch (SQLException e) {
						e.printStackTrace();
					}
					request.setAttribute("product", product);
					request.setAttribute("err", "errTonKho");
					request.getRequestDispatcher("/admin/SuaSanPham.jsp").forward(request, response);
				}

			} else {
				Product product = null;
				try {
					ProductDao productDao = new ProductDao();
					product = productDao.getProductByID(Integer.parseInt(productID));
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.setAttribute("product", product);
				request.setAttribute("err", "errPrice");
				request.getRequestDispatcher("/admin/SuaSanPham.jsp").forward(request, response);
			}

		} else if (action.equalsIgnoreCase("exitEdit")) {
			try {
				list = new ProductDao().getListProduct();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("/admin/SanPham.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("view")) {
			String productIDS = request.getParameter("productID");
			Product product = null;
			try {
				ProductDao productDao = new ProductDao();
				product = productDao.getProductByID(Integer.parseInt(productIDS));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("product", product);
			request.getRequestDispatcher("/admin/ChiTietSanPham.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("exitView")) {
			try {
				list = new ProductDao().getListProduct();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("/admin/SanPham.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("exitAdd")) {
			try {
				list = new ProductDao().getListProduct();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("/admin/SanPham.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("continue")) {
			String productName = request.getParameter("productName");
			String productType = request.getParameter("productType");
			String thuocnhom = request.getParameter("thuocnhom");
			String productPrice = request.getParameter("productPrice");
			String tonkho = request.getParameter("tonkho");
			String description = request.getParameter("description");
			try {
				new ProductDao().addNewProduct(productName, Integer.parseInt(productPrice), productType, thuocnhom,
						description, Integer.parseInt(tonkho));
			} catch (NumberFormatException e1) {
				e1.printStackTrace();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			request.getRequestDispatcher("/admin/ThemAnhSanPham.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("saveAdd")) {
			int count = 0;
			try {
				ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
				ArrayList<FileItem> multifiles = (ArrayList<FileItem>) sf.parseRequest(request);
				for (FileItem item : multifiles) {
					count++;
					String URLImg = "F://LTW//WebProject//WebContent//user//img//imgAdd//" + item.getName();
					item.write(new File(URLImg));
					String URL ="http://localhost:8080/WebProject/user/img/imgAdd/"+item.getName();
					new ProductDao().insertImg(count, URL);
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				list = new ProductDao().getListProduct();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("/admin/SanPham.jsp").forward(request, response);
		}
	}
}
