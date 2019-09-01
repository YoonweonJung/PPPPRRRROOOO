package reboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dispatcher.reboardSuper;
import sql.ReboardSQL;
import utill.POOLUtil;

// 이 클래스는 (원)글쓰기 처리를 담당컨트롤러
public class WriteProc implements reboardSuper {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("WriteProc컨트롤러 진입");
		//할일
		//1.파라미터받기
		//	작성자는 로그인이 되어있는지 확인하면 세션에 담긴 정보를 가져와서 사용한다
		HttpSession session = request.getSession(); 
		
		//프로젝트진행시 로그인이 미완성시에는 임시로 로그인했다치고..
		/*세션에  회원정보를 기억시키자
		session.setAttribute("UID",  "hongid" );
		session.setAttribute("UNAME","홍길동" );
		session.setAttribute("UNICK","의적" ); */
		
		String uid=(String)session.getAttribute("UID"); //작성명(세션정보를 이용)
		if( uid==null || uid.length()==0 ) { 
			//로그인되지않았으니 (글쓰기처리대신에) 로그인폼을  보여주자 
			return "../member/login.jsp";
		}
		
	    String title=request.getParameter("title"); //제목
		String body=request.getParameter("body"); //내용
		String pw=request.getParameter("pw"); //비번
		
		//2.비즈니스로직 ->reboard테이블에 insert
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		String sql = ReboardSQL.getSQL(ReboardSQL.INSERT_REBOARD);
		//String sql = ReboardSQL.getSQL(2);
		System.out.println("원글입력sql="+sql);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		try {
			//?를 채우자
			stmt.setString(1,uid);
			stmt.setString(2,title);
			stmt.setString(3,body);
			stmt.setString(4,pw);
	
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("원글입력쿼리 실행에러 = "+e);
		}
		finally {
			db.close(stmt);
			db.close(con);
		}
		  	  
		//3.모델
		//4.뷰
		return "../view/reboard/writeProc.jsp";
	}

}






