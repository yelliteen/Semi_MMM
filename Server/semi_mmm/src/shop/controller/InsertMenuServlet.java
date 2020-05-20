package shop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.model.service.ShopService;
import shop.model.vo.Product;

/**
 * Servlet implementation class InsertMenuServlet
 */
@WebServlet(name = "InsertMenu", urlPatterns = { "/insertMenu" })
public class InsertMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMenuServlet() {
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
		Product p = new Product();
		p.setBnMemberId(request.getParameter("bnMemberId"));
		p.setProductFilename(request.getParameter("productFilename"));
		p.setProductFilepath(request.getParameter("productFilepath"));
		p.setProductTitle(request.getParameter("productTitle"));	//자동으로 넘어가게만든 seq.nextval은 값저장x
		
		//3. 비지니스 로직
		int result = new ShopService().insertMenu(p);	
		//4. 결과처리
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "메뉴 추가 성공");
		}else {
			request.setAttribute("msg", "메뉴 추가 실패");
		}
		request.setAttribute("loc", "/myShopFrm?memberId="+p.getBnMemberId());
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
