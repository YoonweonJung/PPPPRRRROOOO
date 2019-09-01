package reboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dispatcher.reboardSuper;
import sql.ReboardSQL;
import utill.POOLUtil;
import vo.ReboardVO;

// 이 클래스는 상세내용 출력요청 컨트롤러
public class BoardDetail implements reboardSuper {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("BoardDetail컨트롤러 진입");
		
		//할일
		//1.파라미터받기
		String  strOriNo  = request.getParameter("oriNo");   
		int     oriNo     = Integer.parseInt(strOriNo);   //해당게시물번호
		String  nowPage= request.getParameter("nowPage"); //보고싶은페이지(릴레이용)
		
		//2.비즈니스로직	
		boolean isHit = false;	//조회수증가를 할지말지를 판단하기위한 변수
		HttpSession session = request.getSession(); //세션
		ArrayList list = (ArrayList)session.getAttribute("SessionHIT"); //글번호를 누적기록할 변수필요

		//단 한번도 상세글을 조회한 적이 없다
		if(list==null || list.size()==0) { 
			isHit = true;			//조회수를 증가시켜야 한다
			list  = new ArrayList();//세션에 기록할 목록을 생성
			list.add(oriNo);		//조회한 글번호를 누적
			session.setAttribute("SessionHIT",list);
		}
		else if( list.contains(oriNo) ){//목록에 조회글번호 포함되어있니?
			//최소 한번은 상세글을 조회한 적이 있다
			//목록에 지금 클릭한 글번호가 포함되어있으니 조회수증가를 하지말아야한다
			isHit = false;
		}
		else { 
			//조회한글번호가 포함되어있지않으니   조회수증가를 하자
			isHit = true;
			list.add(oriNo);		//조회한 글번호를 누적
			session.setAttribute("SessionHIT",list);
		}
		
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		ResultSet rs = null;
		
		//2-1) 조회수증가
		String sql=ReboardSQL.getSQL(ReboardSQL.UPDATE_HIT);
		//String sql=ReboardSQL.getSQL(4);
		PreparedStatement stmt = db.getSTMT(con, sql);
		try {
			stmt.setInt(1, oriNo);
			
			//조회수를 증가해도 되는 경우에만 증가시키자
			if(isHit==true) { 
				stmt.executeUpdate();
			}			
		} catch (Exception e) {
			System.out.println("조회수증가쿼리 실행에러="+e);
		}	
		
		//2-2) 원글상세내용 출력
		sql=ReboardSQL.getSQL(ReboardSQL.SELECT_REBOARDVIEW);
		//sql=ReboardSQL.getSQL(5);
		stmt = db.getSTMT(con, sql);
		ReboardVO vo = new ReboardVO(); //원글상세내용을 기억하기위한 변수
		
		try {
			stmt.setInt(1, oriNo);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				//결과셋을 모델로 만들어서 뷰에게 전달해야한다
				//여러종류로 구성된  한 개의 데이터이므로 vo클래스이용
				vo.setNo(rs.getInt("no"));
				vo.setHit(rs.getInt("hit"));
				vo.setWriter(rs.getString("writer"));
				vo.setWday(rs.getDate("wday"));
				vo.setTitle(rs.getString("title"));
				vo.setBody(rs.getString("body"));
			}
		} catch (Exception e) {
			System.out.println("원글상세내용조회 실행에러="+e);
		}
		finally {
			db.close(rs);
			db.close(stmt);
		}
		
		//2-3) 원글에 딸린 댓글목록 조회.. db작업해서 모델만들어 뷰에 출력
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		List<ReboardVO> list1 = new ArrayList();
		sql=ReboardSQL.getSQL(ReboardSQL.SELECT_REPLY);
		//sql = ReboardSQL.getSQL(6)
		stmt = db.getSTMT(con, sql);
		try {
			stmt.setInt(1, oriNo);
			rs = stmt.executeQuery();
			while( rs.next()) {
				//모델 4번째 방식, 여러 종류의 데이터=>vo가 여러개=>arraylist에 누적
				ReboardVO vo1 = new ReboardVO();
				vo1.setNo(rs.getInt("no"));
				vo1.setOriNo(rs.getInt("oriNo"));
				vo1.setWriter(rs.getString("writer"));
				vo1.setWday(rs.getDate("wday"));
				vo1.setTitle(rs.getString("title"));
				vo1.setBody(rs.getString("body"));
				list1.add(vo1);
			}
		} catch (Exception e) {
			System.out.println("원글상세내용조회 실행에러="+e);
		}
		finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		
		
		//3.모델
		request.setAttribute("DETAIL",vo);     //원글상세내용
		request.setAttribute("REPLY",list1);     //댓글내용
		//필요한 파라미터는 릴레이시켜야한다. 왜냐하면 알려주지않은 데이터는 사용할 수 없기 때문이다
		request.setAttribute("nowPage",nowPage);//보고싶은페이지(릴레이용)
		
		//4.뷰
		return "../view/reboard/boardDetail.jsp";
	}
	
	
	
	
	
	

}
