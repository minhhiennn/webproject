package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.LienHe;
import database.ContactUsDao;
import database.javaMailllienhe;

/**
 * Servlet implementation class ThongKeHoiDap
 */
@WebServlet("/ThongKeHoiDap")
public class AdminThongKeHoiDap extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminThongKeHoiDap() {
		super();
		// TODO Auto-generated constructor stub
	}

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
		ArrayList<LienHe> list = new ArrayList<LienHe>();
		if (action.equalsIgnoreCase("thongke")) {
			String dateStart = request.getParameter("dateStart");
			String dateEnd = request.getParameter("dateEnd");
			try {
				list = new ContactUsDao().getContacbyAdminbydate(dateStart, dateEnd);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("listlienhe", list);
			request.setAttribute("dateStart", dateStart);
			request.setAttribute("dateEnd", dateEnd);
			request.getRequestDispatcher("/admin/Thongkehoidap.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("traloi")) {
			String index = request.getParameter("index");
			String dateStart = request.getParameter("dateStart");
			String dateEnd = request.getParameter("dateEnd");
			int index1 = Integer.parseInt(index);
			try {
				list = new ContactUsDao().getContacID(index1);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("listlienhe", list);
			request.setAttribute("dateStart", dateStart);
			request.setAttribute("dateEnd", dateEnd);
			request.getRequestDispatcher("/admin/Traloihoidapthongke.jsp").forward(request, response);
		}

		else if (action.equalsIgnoreCase("gui")) {
			String index = request.getParameter("idd");
			int idkhachhang = Integer.parseInt(index);
			String phanhoi = request.getParameter("phanhoi11");
			String email = request.getParameter("email");
			String dateStart = request.getParameter("dateStart");
			String dateEnd = request.getParameter("dateEnd");
			try {
				list = new ContactUsDao().getContacID(idkhachhang);
				request.setAttribute("listlienhe", list);

				if (phanhoi.length() != 0) {
					javaMailllienhe.sendMail(email, phanhoi);
					new ContactUsDao().updateContacID("đã trả lời", idkhachhang);
					request.setAttribute("dateStart", dateStart);
					request.setAttribute("dateEnd", dateEnd);
					response.sendRedirect("http://localhost:8080/WebProject/ThongKeHoiDap?action=thongke&dateStart="+dateStart+"&dateEnd="+dateEnd);
				} else {
					new ContactUsDao().updateContacID("chưa kiểm tra", idkhachhang);
					request.getRequestDispatcher("/admin/Traloihoidapthongke.jsp").forward(request, response);
				}
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
//		String index = request.getParameter("index");
//		int idkhachhang = Integer.parseInt(index);
//		String phanhoi = request.getParameter("phanhoi1");
//		String email = request.getParameter("email");
//		try {
//			 list = new ContactUsDao().getContacID(idkhachhang);
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		
//		request.setAttribute("listlienhe", list);
//		
//		
//			try {
//				if (phanhoi.length() != 0) {
//				javaMailllienhe.sendMail(email, phanhoi);
//				new ContactUsDao().updateContacID("đã trả lời", idkhachhang);
//				response.sendRedirect("http://localhost:8080/WebProject/admin/Thongkehoidap.jsp");
//				}
//				else {new ContactUsDao().updateContacID("chưa kiểm tra", idkhachhang);}
//				
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				
//			} catch (MessagingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//		request.getRequestDispatcher("/admin/Thongkehoidap.jsp").forward(request, response);
//		}
		else if (action.equalsIgnoreCase("xoa")) {
			String index = request.getParameter("index");
			int idd = Integer.parseInt(index);

			try {
				new ContactUsDao().deleteContacID(idd, "đã trả lời");
				list = new ContactUsDao().getContact();
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("listlienhe", list);
			request.getRequestDispatcher("/admin/Thongkehoidap.jsp").forward(request, response);
		}

	}
}
