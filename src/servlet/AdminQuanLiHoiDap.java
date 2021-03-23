package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.LienHe;
import database.ContactUsDao;
import database.javaMailllienhe;

/**
 * Servlet implementation class AdminQuanLiHoiDap
 */
@WebServlet("/AdminQuanLiHoiDap")
public class AdminQuanLiHoiDap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminQuanLiHoiDap() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String run = request.getParameter("run");
		List<LienHe>list=null;
		String index=null;
		try {

			switch (run) {
			case "chuakiemtra":
				try {
					list=new ContactUsDao().getContact();
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				request.setAttribute("listlienhe", list);
				request.getRequestDispatcher("/admin/quanlyhoidap.jsp").forward(request, response);
				break;
			case "traloi":
				index = request.getParameter("index");
				int index1 = Integer.parseInt(index);
				try {
					 list = new ContactUsDao().getContacID(index1);
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				request.setAttribute("listlienhe", list);
				request.getRequestDispatcher("/admin/Traloihoidap.jsp").forward(request, response);
				break;
			case "gui":
				index = request.getParameter("id");
				int idkhachhang = Integer.parseInt(index);
				String phanhoi = request.getParameter("phanhoi1");
				String email = request.getParameter("email");
				try {
					 list = new ContactUsDao().getContacID(idkhachhang);
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				request.setAttribute("listlienhe", list);
				
				if (phanhoi.length() != 0) {
					javaMailllienhe.sendMail(email, phanhoi);

					new ContactUsDao().updateContacID("đã trả lời", idkhachhang);

					response.sendRedirect("http://localhost:8080/WebProject/AdminQuanLiHoiDap?run=chuakiemtra");

				} else {
					new ContactUsDao().updateContacID("chưa kiểm tra", idkhachhang);

				request.getRequestDispatcher("/admin/Traloihoidap.jsp").forward(request, response);
				}
				break;
			case "xoa":
				index = request.getParameter("index");
				int idd = Integer.parseInt(index);
				
			
				
				try {
					new ContactUsDao().deleteContacID(idd, "đã trả lời");
					list = new ContactUsDao().getContact();
				} catch (Exception e) {
					// TODO: handle exception
				}
				request.setAttribute("listlienhe", list);
				request.getRequestDispatcher("/admin/quanlyhoidap.jsp").forward(request, response);
				break;
			case "xoafull":
				
				try {
					new ContactUsDao().deleteContec();
					list=new ContactUsDao().getContact();
				} catch (Exception e) {
					// TODO: handle exception
				}
			
				request.setAttribute("listlienhe", list);
				request.getRequestDispatcher("/admin/quanlyhoidap.jsp").forward(request, response);
				
				break;
			default:
				System.out.println("loi ngoai le");
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
	}

}
