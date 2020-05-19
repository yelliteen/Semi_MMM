package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import notice.model.vo.NoticeComment;

/**
 * Servlet implementation class AdminNoticeCommentServlet
 */
@WebServlet(name = "AdminNoticeComment", urlPatterns = { "/adminNoticeComment" })
public class AdminNoticeCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeCommentNo = Integer.parseInt(request.getParameter("noticeCommentNo"));
		NoticeComment comment = new AdminService().noticeComment(noticeCommentNo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/admin/commentPopup.jsp");
		request.setAttribute("comment", comment);
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
