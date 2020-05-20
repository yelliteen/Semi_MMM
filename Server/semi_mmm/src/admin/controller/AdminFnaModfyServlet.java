package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.service.AdminService;
import fna.model.vo.Fna;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminFnaModfyServlet
 */
@WebServlet(name = "AdminFnaModify", urlPatterns = { "/adminFnaModify" })
public class AdminFnaModfyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFnaModfyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("member") == null || !((Member)session.getAttribute("member")).getMemberId().equals("admin")) {
			System.out.println("뒤로가기");
			RequestDispatcher rd = ((HttpServletRequest)request).getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			((HttpServletRequest)request).setAttribute("msg", "관리자 계정만 접근이 가능합니다.");
			((HttpServletRequest)request).setAttribute("loc", "/");
			rd.forward(request, response);
		}
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		Fna fna = new Fna(qnaNo, question, answer); 
		int result = new AdminService().adminFnaModify(fna);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/popupmsg.jsp");
		
		if (result > 0) {
			request.setAttribute("msg", "F&A를 수정하였습니다.");
		} else {
			request.setAttribute("msg", "F&A 수정에 실패하였습니다.");
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