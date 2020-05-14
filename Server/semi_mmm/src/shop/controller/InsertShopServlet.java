package shop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.vo.Shop;
import shop.model.service.ShopService;
import shop.model.vo.Product;

/**
 * Servlet implementation class InsertShopServlet
 */
@WebServlet(name = "InsertShop", urlPatterns = { "/insertShop" })
public class InsertShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertShopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
	         RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
	         request.setAttribute("msg", "[enctype]확인");
	         request.setAttribute("loc", "/");
	         rd.forward(request, response);
	         return;
	      }
	      //파일 저장 경로 설정
	      String root = request.getSession().getServletContext().getRealPath("/");
	      String saveDirectory = root+"upload/photo";
	      //파일 최대 크기 설정
	      int maxSize = 10*1024*1024;
	      //request -> MultipartRequest 파일업로드 진행
	      MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
	      String bnMemberId = mRequest.getParameter("bnMemberId");
	      String productFilename = mRequest.getOriginalFileName("productFilename");
	      String productFilepath = mRequest.getFilesystemName("productFilename");
	      Product p = new Product();
	      p.setProductFilename(productFilename);
	      p.setProductFilepath(productFilepath);
	      p.setBnMemberId(bnMemberId);
	      //비지니스로직처리
	      int result = new ShopService().insertShop(p);
	      RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
	      request.setAttribute("loc", "/shopMain");
	      if(result>0) {
	         request.setAttribute("msg", "등록성공");
	      }else {
	         request.setAttribute("msg", "등록실패");
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
