package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;


import dog.model.vo.Dog;
import notice.model.vo.Notice;
import notice.model.vo.NoticePageData;
import notice.model.vo.NoticePageDataImge;
import notice.service.noticeService;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet(name = "NoticeList", urlPatterns = { "/noticeList" })
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");

			
			int reqPage = Integer.parseInt(request.getParameter("reqPage"));
			String memberId = request.getParameter("memberId");
			System.out.println(reqPage);
			NoticePageDataImge pd = new noticeService().selectList(reqPage);

			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/imgeNotice/imgeNoticeList.jsp");
			
			request.setAttribute("list", pd.getList());
			request.setAttribute("pageNavi", pd.getPageNavi());
			request.setAttribute("memberId", memberId);
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
