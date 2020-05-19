package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;

/**
 * Servlet implementation class AdminQnaDeleteServelt
 */
@WebServlet(name = "AdminQnaRecovery", urlPatterns = { "/adminQnaRecovery" })
public class AdminQnaRecoveryServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnaRecoveryServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qnaNoticeNo = Integer.parseInt(request.getParameter("qnaNoticeNo"));
		int result = new AdminService().qnaNoticeRecovery(qnaNoticeNo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		request.setAttribute("loc", "/adminQnaNoticeRead?qnaNoticeNo=" + qnaNoticeNo);
		
		if (result > 0) {
			request.setAttribute("msg", "게시글을 복구하였습니다.");
		} else {
			request.setAttribute("msg", "게시글 복구에 실패하였습니다.");
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
