package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.vo.noticeViewData;
import notice.service.noticeService;

/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet(name = "NoticeView", urlPatterns = { "/noticeView" })
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
				request.setCharacterEncoding("utf-8");
				//2. 변수에 값 저장
				int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
				//3. 비지니스로직
				noticeViewData nvd = new noticeService().selectOneNotice(noticeNo);
				//4. 결과처리
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/imgeNotice/imgeNoticeView.jsp");
				request.setAttribute("n", nvd.getN());
				request.setAttribute("list", nvd.getList());
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
