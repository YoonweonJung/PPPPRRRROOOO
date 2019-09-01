package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sql.ReboardSQL;
import sql.ShopSQL;
import utill.POOLUtil;
import vo.ReboardVO;
import vo.ShopFamousboardVO;

// 이 클래스는 db조작관련 기능을 제공하는 클래스
public class ShopboardDAO {

	//변수
	private POOLUtil db;
	private Connection con;
	
	//생성자
	//ReboardDAO dao=new ReboardDAO();해도
	//반드시 해야하는 db연결기능까지 제공하겠다
	public ShopboardDAO(){
		db = new POOLUtil();
		con = db.getCon();
	}
	
	//함수
	//필요한 기능을 함수로 만들어 제공하면 된다
	//댓글수정
	public void updateReply(String title, String body, String pw, int rno) {
		String sql  =ReboardSQL.getSQL(ReboardSQL.UPDATE_REPLY);
		//String sql=ReboardSQL.getSQL(9);
		PreparedStatement stmt = db.getSTMT(con, sql);
		try {
			stmt.setString(1,title);
			stmt.setString(2,body);
			stmt.setString(3,pw);
			stmt.setInt(4,rno);
			stmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("댓글수정쿼리문 실행에러="+e);
		}
		finally {
			db.close(stmt);	
		}
		
		
	}
	
	
	
	//댓글입력
	public void insertReply(int oriNo,String writer,String title,String body,String pw) {
		String sql  =ReboardSQL.getSQL(ReboardSQL.INSERT_REPLY);
		//String sql=ReboardSQL.getSQL(8);
		PreparedStatement stmt = db.getSTMT(con, sql);
		try {
			stmt.setInt(1, oriNo);
			stmt.setString(2, writer);
			stmt.setString(3, title);
			stmt.setString(4, body);
			stmt.setString(5, pw);
		
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("댓글입력쿼리문 실행에러="+e);
		}
		finally {
			db.close(stmt);	
		}
		
	}
	
	
	//댓글수정
	public void updateReply(int oriNo,String title, String body, String pw) {
		String sql=ReboardSQL.getSQL(ReboardSQL.UPDATE_REPLY);
		//String sql=ReboardSQL.getSQL(9);
		PreparedStatement stmt = db.getSTMT(con, sql);
		try {
			stmt.setString(1,title);
			stmt.setString(2,body);
			stmt.setString(3,pw);
			stmt.setInt(4, oriNo);
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("댓글수정쿼리문 실행에러="+e);
		}
		finally {
			db.close(stmt);	
		}
	}
	
	//원글수정
	public void updateReboard(int oriNo,String title, String body, String pw) {
		String sql=ReboardSQL.getSQL(ReboardSQL.UPDATE_REBOARD);
		System.out.println("원글수정sql="+sql);
		//String sql=ReboardSQL.getSQL(7);
		PreparedStatement stmt = db.getSTMT(con, sql);
		try {
			stmt.setString(1,title);
			stmt.setString(2,body);
			stmt.setString(3,pw);
			stmt.setInt(4, oriNo);
			int c=stmt.executeUpdate();
			System.out.println(c);
		} catch (Exception e) {
			System.out.println("원글수정쿼리문 실행에러="+e);
		}
		finally {
			db.close(stmt);	
		}
	}
	
	
	//원글상세보기 조회
	public  ReboardVO selectReboardView(int oriNo) {
		ResultSet rs = null;
		String sql=ReboardSQL.getSQL(ReboardSQL.SELECT_REBOARDVIEW);
		//String sql=ReboardSQL.getSQL(5);
		PreparedStatement stmt = db.getSTMT(con, sql);
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
		
		return vo;
	}
	
	//인기게시물 조회
	public List selectFamousview() {
		List list = null;
		ResultSet rs = null;
		String sql=ShopSQL.getSQL(ShopSQL.SELECT_FAMOUSPRODUCT);
		//String sql=ReboardSQL.getSQL(5);
		PreparedStatement stmt = db.getSTMT(con, sql);
		ShopFamousboardVO vo = new ShopFamousboardVO(); //원글상세내용을 기억하기위한 변수
		
		try {
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				if(list == null) list = new ArrayList();
				//결과셋을 모델로 만들어서 뷰에게 전달해야한다
				//여러종류로 구성된  한 개의 데이터이므로 vo클래스이용
				vo.setB_img(rs.getString("b_img"));
				vo.setB_name(rs.getString("b_name"));
				vo.setU_id(rs.getString("u_id"));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("원글상세내용조회 실행에러="+e);
		}
		finally {
			db.close(rs);
			db.close(stmt);
		}
		
		return list;
	}
	
	//사용했던 connection닫기용 함수
	public void close() {
		db.close(con);
	}
	
}













