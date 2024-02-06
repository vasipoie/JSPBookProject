package kr.or.ddit.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitParamFilter implements Filter {

	//init에서만 쓰는게 아니라 doFilter, destroy에서도 쓸 수 있게 전역으로 설정
	private FilterConfig filterConfig = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02 초기화...!");
		
		System.out.println("web.xml에 설정하나 param을 담고 있는 filterConfig를 전역 변수에 먼저 셋팅 해준다");
		
		//아이디
		System.out.println(filterConfig.getInitParameter("param1"));
		//비밀번호
		System.out.println(filterConfig.getInitParameter("param2"));
		
		//전역에 집어넣어야하니까 this.로 명시
		this.filterConfig = filterConfig;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter02 실행...!");
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		String msg = "";	//전송할 메세지 초기화
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if(id.equals(param1) && pw.equals(param2)) {
			msg = "로그인 성공했습니다!";
			request.setAttribute("msg", msg);
		}else {
			msg = "로그인 실패했습니다!";
			msg += "<a href='filter02.jsp>Filter02 이동</a>";
			writer.println(msg);
			return;	//다음으로 이동할 수 없게끔 막아주려고 return
		}
		
		chain.doFilter(request, response);	//다음이 필터면 필터로, 리소스면 리소스로 넘겨줌
	}

	@Override
	public void destroy() {
		System.out.println("Filter02 해제...!");
	}
}
