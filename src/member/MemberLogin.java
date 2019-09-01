package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//요청주소가 /login/loginFrm.do로 끝나면 실행되는 클래스
//로그인폼을 보여주는 클래스
@WebServlet("/login/loginFrm.do") //언오테이션, 엄청많은일을함 
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    //생성자
    public MemberLogin() {        
    	super();
    	System.out.println("생성자 MemberLogin()함수호출");
    }

	@Override
	public void destroy() {
		System.out.println("destroy()함수호출");
		super.destroy();
	}

	//초기화.. 최초요청시 단 한번만 호출되는 함수
	@Override
	public void init() throws ServletException {
		System.out.println("init()함수호출");
		super.init();
	}


	//클라이언트의 요청을 실행함수
    //GET방식으로 요청하면 실행되는 함수
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()함수호출");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		//jsp문서에는 한글처리가 가능하지만 서블릿은 한글처리x
		//따라서 한글처리를 해야한다
		response.setContentType("text/html; charset=UTF-8");
		
		
		//JSP문서에서는 HTML태그를 이용하여 폼을 만들면 되지만
		//서블릿에서는 HTML태그를 강제로 브라우저 화면에 출력해야 한다
		//HttpServletResponse클래스의 getWriter()메소드를 이용하면
		//PrintWriter 객체를 얻을 수 있다
		//JSP문서의 out내장객체는 PrintWriter클래스가 new가 된 것이다
		PrintWriter  out = response.getWriter();
		
		//스트림을 이용하여   로그인폼을 만들자
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>로그인</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("	<p><a href=\"../index.jsp\">메인</a></p>");
		out.println("	<h1>MemberLogin.java</h1>");
		out.println("		<form name='gaipFrm' id='gaipFrm' method='POST' action='../login/loginProc.do'>");
		out.println("			<table border=\"1\" width=\"400\">");
		out.println("				<tbody>");
		out.println("					<tr>");
		out.println("						<th>아이디</th>");
		out.println("						<td>");
		out.println("							<input type=\"text\" name=\"id\" id=\"id\" />");
		out.println("						</td>");
		out.println("					</tr>");
		out.println("					<tr>");
		out.println("						<th>비 번</th>");
		out.println("						<td>");
		out.println("							<input type=\"password\" name=\"pw\" id=\"pw\" />");
		out.println("						</td>");
		out.println("					</tr>");
		out.println("					<tr>");
		out.println("						<td colspan='2' align='center'>");
		out.println("							<input type=\"submit\" id=\"submitBtn0\" value=\"로그인\" />");
		out.println("							<input type=\"reset\"  id=\"resetBtn\"  value=\"취소\" />");
		out.println("						</td>");
		out.println("					</tr>");
		out.println("				</tbody>");
		out.println("			</table>");
		out.println("		</form>");
		out.println("</body>");
		out.println("</html>");
	}

	//POST방식으로 요청하면 실행되는 함수
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()함수호출");
		doGet(request, response);
	}

}





