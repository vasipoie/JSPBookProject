package kr.or.ddit.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/*
 	필터(Filter)
 	
 	필터는 클라이언트와 서버 사이에서 request와 response 객체를 먼저 받아 사전/사후 작업 등 공통적으로
 	필요한 부분을 처리하는 것을 말한다.
 	필터는 클라이언트의 요청이 웹 서버의 서블릿, JSP, HTML 페이지 같은 정적 리소스에 도달하기 전과,
 	반대로 정적 리소스에서 클라이언트로 응답하기 전에 피요한 전처리를 가능하게 한다.
 	필터는 HTTP 요청과 응답을 변경할 수 있는 코드로 재사용이 가능하고 여러개의 필터로 이루어진 필터 체인을
 	제공하기도 한다.
 	
 	필터를 구성하기 위해서는 제일 먼저 Filter 인터페이스가 필요한데 필터 기능을 구현하는데 핵심적인 역할을 한다.
 */
public class AuthenFilter implements Filter {

	//init() 메소드는 JSP 컨테이너가 필터를 초기화할 때 호출하는 메소드
	//init() 메소드는 JSP 컨테이너 내에서 초기화 작업을 수행할 필터 인스턴스를 생성한 후 한번만 호출됨
	//매개변수 FilterConfig 객체는 JSP 컨테이너가 초기화 중 필터에 정보를 전달하는데 사용하는
	//필터 구성 객체
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter01 초기화...!");
	}

	//doFilter()메소드는 JSP 컨테이너가 필터를 리소스에 적용할 때마다 호출되는 메소드
	//필터가 어떤 기능을 수행할 필요가 있을 때마다 호출됩니다.
	//doFilter()메소드의 매개변수는 총 3가지로 ServletRequest 객체는 체인을 따라 전달하는 요청이고,
	//ServletResponse 객체는 체인을 따라 전달할 응답입니다.
	//FilterChain 객체는 체인에서 다음 필터를 호출하는데 사용되고
	//만약 호출 필터가 체인의 마지막 필터이면 끝에서 리소스를 호출한다.
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter01 실행...!");
		
		//[적용 필터의 시나리오]
		//name이라는 키를 갖고 있는 파라미터를 서버로 전송하는데,
		//이때 넘겨받은 데이터가 null이거나 공백일 때 "보낸 데이터가 null입니다"라는 메세지를
		//출력하고, 다시 요청 페이지로 리턴한다.
		//요청자가 요청할 때 넘어갈 타겟 정보로 넘어가지 않고 필터가 중간에서 거름망 역할로
		//타겟으로 넘거가기 전 데이터를 필터링하여 서버쪽으로 넘어갈지,
		//서버로 넘어가기 전 데이터에 문제가 발생해 다시 요청 페이지로 넘겨줄지를 결정할 수 있다.
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		
		//이름을 입력받고 서버로 넘어오는 과정에서 해당 필터가 요청을 잡는다.
		//이때, name키에 들어있는 값이 null 또는 공백인 경우 필터가 브라우저로 메세지를 출력하여
		//돌려보낸다. "너 입력 안했어! 다시 보내!" 라고 하며 돌려보낸다.
		if(name==null || name.equals("")) {
			//타겟에 해당하는 쪽으로 넘기는게 아니라
			//다시 요청 페이지로 되돌림
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			String msg = "<p>입력된 name값은 null입니다! 다시 입력해주세요!</p>";
			msg += "<a href='filter01.jsp'>Filter01 이동</a>";
			
			PrintWriter pw = response.getWriter();
			pw.println(msg);
			return; //요청 URL로 넘어가지 않고 해당 필터에서 응답 페이지가 결과로 나간다.
		}
		
		//연속적으로 필터가 있으면 다음 필터로 제어를 넘기도록 FilterChain 객체 타입의
		//doFilter() 메소드를 작성한다.
		chain.doFilter(request, response);
	}

	//destroy()메소드는 필터 인스턴스를 종료하기 전에 호출되는 메소드
	//JSP 컨테이너가 필터 인스턴스를 삭제하기 전에 청소 작업을 수행하는데 사용되며,
	//이는 필터로 열린 리소스를 모두 담을 수 있는 방법이다.
	//destroy()메소드는 필터의 수명 동안 한번만 호출된다.
	@Override
	public void destroy() {
		System.out.println("Filter01 해제...!");
	}

}
