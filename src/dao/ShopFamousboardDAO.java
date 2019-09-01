package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sql.ShopSQL;
import utill.POOLUtil;
import vo.ShopFamousboardVO;

// 이 클래스는 db조작관련 기능을 제공하는 클래스
public class ShopFamousboardDAO {

	//변수
	private POOLUtil db;
	private Connection con;
	
	//생성자
	//ReboardDAO dao=new ReboardDAO();해도
	//반드시 해야하는 db연결기능까지 제공하겠다

	//인기게시물 조회
	public List<ShopFamousboardVO> selectFamousview() {
		db = new POOLUtil();
		con = db.getCon();
		List<ShopFamousboardVO> list = null;
		ResultSet rs = null;
		String sql=ShopSQL.getSQL(ShopSQL.SELECT_FAMOUSPRODUCT);
		//String sql=ReboardSQL.getSQL(5);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		try {
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				if(list == null) list = new ArrayList();
				ShopFamousboardVO vo = new ShopFamousboardVO(); //원글상세내용을 기억하기위한 변수
				//결과셋을 모델로 만들어서 뷰에게 전달해야한다
				//여러종류로 구성된  한 개의 데이터이므로 vo클래스이용
				vo.setPb_no(rs.getInt("pb_no"));
				vo.setPb_img(rs.getString("pb_img"));
				vo.setPb_title(rs.getString("pb_title"));
				vo.setM_jsi(rs.getString("m_jsi"));
				vo.setM_jgu(rs.getString("m_jgu"));
				vo.setM_jdong(rs.getString("m_jdong"));
				vo.setPb_price(rs.getString("pb_price"));
				vo.setPb_zzimcnt(rs.getInt("pb_zzimcnt"));
				vo.setPb_replycnt(rs.getInt("pb_replycnt"));
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
	
}













