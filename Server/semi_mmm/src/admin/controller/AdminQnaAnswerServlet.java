package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import qna.model.vo.QnaAnswer;

/**
 * Servlet implementation class AdminQnaAnswerServlet
 */
@WebServlet(name = "AdminQnaAnswer", urlPatterns = { "/adminQnaAnswer" })
public class AdminQnaAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnaAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int answerNo = Integer.parseInt(request.getParameter("answerNo"));
		QnaAnswer answer = new AdminService().qnaAnswer(answerNo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/admin/answerPopup.jsp");
		request.setAttribute("answer", answer);
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
