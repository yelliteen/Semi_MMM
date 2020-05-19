package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import fna.model.vo.Fna;

/**
 * Servlet implementation class AdminFnaInsertServlet
 */
@WebServlet(name = "AdminFnaInsert", urlPatterns = { "/adminFnaInsert" })
public class AdminFnaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFnaInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		Fna fna = new Fna(0, question, answer); 
		int result = new AdminService().adminFnaInsert(fna);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/popupmsg.jsp");
		
		if (result > 0) {
			request.setAttribute("msg", "F&A를 등록하였습니다.");
		} else {
			request.setAttribute("msg", "F&A 등록에 실패하였습니다.");
		}
		
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
