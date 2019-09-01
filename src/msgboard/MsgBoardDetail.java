package msgboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopdispatcher.ShopreboardSuper;
import sql.boardSQL;
import utill.POOLUtil;
import utill.PageUtil;
import vo.MsgVO;
import vo.ReboardVO;

// 이 클래스는 상세내용 출력요청 컨트롤러
public class MsgBoardDetail implements ShopreboardSuper {

	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("MsgBoardDetail컨트롤러 진입--");
		
		//할일
		//1.파라미터받기
		String  strmb_no  = request.getParameter("mb_no");
		int     mb_no     = Integer.parseInt(strmb_no);   //해당게시물번호
		String  nowPage = request.getParameter("nowPage"); //보고싶은페이지(릴레이용)
		
		//2.비즈니스로직	
		boolean isHit = false;	//조회수증가를 할지말지를 판단하기위한 변수
		HttpSession session = request.getSession(); //세션
		ArrayList<Integer> list = (ArrayList<Integer>)session.getAttribute("SessionHIT"); //글번호를 누적기록할 변수필요

		//단 한번도 상세글을 조회한 적이 없다
		if(list==null || list.size()==0) { 
			isHit = true;			//조회수를 증가시켜야 한다
			list  = new ArrayList<Integer>();//세션에 기록할 목록을 생성
			list.add(mb_no);		//조회한 글번호를 누적
			session.setAttribute("SessionHIT",list);
		}
		else if( list.contains(mb_no) ){//목록에 조회글번호 포함되어있니?
			//최소 한번은 상세글을 조회한 적이 있다
			//목록에 지금 클릭한 글번호가 포함되어있으니 조회수증가를 하지말아야한다
			isHit = false;
		}
		else { 
			//조회한글번호가 포함되어있지않으니   조회수증가를 하자
			isHit = true;
			list.add(mb_no);		//조회한 글번호를 누적
			session.setAttribute("SessionHIT",list);
		}
		
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		ResultSet rs = null;
		
		//2-1) 조회수증가
		String sql=boardSQL.getSQL(boardSQL.SELECT_MSGCNT);
		//String sql=ReboardSQL.getSQL(4);
		PreparedStatement stmt = db.getSTMT(con, sql);
				
		//2-2) 원글상세내용 출력
		sql=boardSQL.getSQL(boardSQL.SELECT_MSGVIEW);
		//sql=ReboardSQL.getSQL(5);
		stmt = db.getSTMT(con, sql);
		MsgVO vo = new MsgVO(); //원글상세내용을 기억하기위한 변수
		
		try {
			stmt.setInt(1, mb_no );
			rs = stmt.executeQuery();
			while(rs.next()) {
				//결과셋을 모델로 만들어서 뷰에게 전달해야한다
				//여러종류로 구성된  한 개의 데이터이므로 vo클래스이용
				MsgVO vo1 = new MsgVO();
				vo.setMb_no(rs.getInt("mb_no"));
				vo.setMb_comf(rs.getInt("mb_comf"));
				vo.setM_id(rs.getString("m_id"));
				vo.setM_nick(rs.getString("m_nick"));
				vo.setMb_idchk(rs.getString("mb_idchk"));
				vo.setMb_date(rs.getDate("mb_date"));
				vo.setMb_title(rs.getString("mb_title"));
				vo.setMb_comm(rs.getString("mb_comm"));
			}
		} catch (Exception e) {
			System.out.println("원글상세내용조회 실행에러="+e);
		}
		finally {
			db.close(rs);
			db.close(stmt);
		}
		// 보내기
		
		
		
		//3.모델
		request.setAttribute("DETAIL",vo);     //원글상세내용
		
		//필요한 파라미터는 릴레이시켜야한다. 왜냐하면 알려주지않은 데이터는 사용할 수 없기 때문이다
		request.setAttribute("nowPage",nowPage);//보고싶은페이지(릴레이용)
		
		//4.뷰
		return "../view/reboard/msgboardDetail.jsp";
	}
	
	// member table  = m_id == 
	// select mesage board
	// 대조
	
	
	
	

}
