package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dog.model.service.DogService;
import dog.model.vo.Dog;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "Login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int level = Integer.parseInt(request.getParameter("level"));
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		Member m = new MemberService().selectOneMember(memberId, memberPw);
		if (m != null) {
			if (level == 1 && m.getMemberLevel() == level) {
				HttpSession session = request.getSession();
				session.setAttribute("member", m);
			} else if (level == 2 && m.getMemberLevel() == level) {
				HttpSession session = request.getSession();
				session.setAttribute("shop", m);
			} else {
				response.setContentType("applicaion/json");
				response.setCharacterEncoding("utf-8");
				response.getWriter().print(1);
			}
		} else {
			response.setContentType("applicaion/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(1);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
