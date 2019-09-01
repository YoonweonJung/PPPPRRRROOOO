package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sql.boardSQL;
import utill.POOLUtil;
import vo.MsgVO;

// 이 클래스는 db조작관련 기능을 제공하는 클래스
public class MsgDAO {

	//변수
	private POOLUtil db;
	private Connection con;
	
	//생성자
	//ReboardDAO dao=new ReboardDAO();해도
	//반드시 해야하는 db연결기능까지 제공하겠다

	
	public int deleteMsgboard(int Mb_no, String pw) {
		String sql  =boardSQL.getSQL(boardSQL.DELETE_MSGVIEW);
		//String sql=ReboardSQL.getSQL(10);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		int change = 0;//update성공실패여부를 기억하기 위한 변수선언
		try {
			stmt.setInt(1, Mb_no);
			stmt.setString(2, pw);
			
			//update가 성공되면 update된 레코드수가 반환
			//실패되면 0이 반환
			//우리는 성공과 실패여부를 유저에게 알려줘야하므로 레코드수가 필요하다
			change = stmt.executeUpdate();
		} catch (Exception e) {	
			System.out.println("원글삭제쿼리 실행에러="+e);
		} finally {
			db.close(stmt);
		}
		
		return change;
	}
	
	//인기게시물 조회
	public List<MsgVO> selectFamousview() {
		db = new POOLUtil();
		con = db.getCon();
		List<MsgVO> list = null;
		ResultSet rs = null;
		String sql=boardSQL.getSQL(boardSQL.SELECT_MSG);
		//String sql=ReboardSQL.getSQL(5);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		try {
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				if(list == null) list = new ArrayList<MsgVO>();
				MsgVO vo = new MsgVO(); //원글상세내용을 기억하기위한 변수
				//결과셋을 모델로 만들어서 뷰에게 전달해야한다
				//여러종류로 구성된  한 개의 데이터이므로 vo클래스이용
				vo.setM_id(rs.getString("m_id"));
				vo.setMb_no(rs.getInt("mb_no"));
				vo.setMb_title(rs.getString("mb_title"));
				vo.setMb_comm(rs.getString("mb_comm"));
				vo.setMb_comf(rs.getInt("mb_comf"));
				vo.setMb_date(rs.getDate("mb_date"));
				vo.setMb_stat(rs.getInt("mb_stat"));
				
				list.add(vo);
				
			}
		} catch (Exception e) {
			System.out.println("인기매물 가져오기 실행에러="+e);
		}
		finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		
		return list;
	}
	public void close() {
		db.close(con);
	}
}













