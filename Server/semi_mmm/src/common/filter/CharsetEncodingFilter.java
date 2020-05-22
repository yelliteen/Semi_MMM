package common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet Filter implementation class CharsetEncodingFilter
 */
@WebFilter("/CharsetEncodingFilter")
public class CharsetEncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CharsetEncodingFilter() {

    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// place your code here
		//서블릿 도착 전에 처리할 사전작업
		request.setCharacterEncoding("utf-8");
		
		HttpServletRequest req = (HttpServletRequest)request;
		System.out.println("요청 url : " + req.getRequestURI());
		
		HttpSession session = req.getSession(false);
		if (session != null && ((Member)session.getAttribute("member")) != null && ((Member)session.getAttribute("member")).getMemberId() != null) {
			Member m = new MemberService().selectOneMember(((Member)session.getAttribute("member")).getMemberId());
			if (m.getMemberLevel() == 3 || m.getMemberLevel() == 4) {
				session.invalidate();
				RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				req.setAttribute("msg", "정지된 회원입니다.");
				req.setAttribute("loc", "/");
				rd.forward(req, (HttpServletResponse)response);
			}
		}

		// pass the request along the filter chain
		chain.doFilter(request, response);
		//서블릿에서 클라이언트로 응답 나가기 전 사후작업
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
