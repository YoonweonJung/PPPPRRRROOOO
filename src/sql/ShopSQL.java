package sql;

//이 클래스는 댓글게시판과 관련된 질의문을 제공하는 클래스
public class ShopSQL {

		//쿼리문수가 많으므로 각 쿼리문에 고유한 코드값을 부여하여
		//필요한 쿼리문을 구분하도록 하겠다
		public static final int SELECT_BOARDLIST = 1; //게시글 목록보기
		public static final int INSERT_BOARD = 2;  	//게시글 입력
		public static final int SELECT_BOARDCNT = 3;	//게시물수 조회
		public static final int UPDATE_HIT = 4;			//조회수 증가
		public static final int SELECT_BOARDVIEW = 5;	//원글상세보기
		public static final int SELECT_REPLY = 6; 		//댓글상세보기
		public static final int UPDATE_BOARDMODIFY = 7;		//원글수정
		public static final int INSERT_REPLYINPUT = 8; 	    //댓글입력
		public static final int UPDATE_REPLYMODIFY = 9;		//댓글수정
		public static final int UPDATE_MEMBERMODIFY = 10;		//개인정보 수정
		public static final int UPDATE_MEMBERMODIFYGM = 11;		//개인정보 수정(관리자)
		public static final int UPDATE_PRODUCT = 12;		//상품 정보
		public static final int UPDATE_PRODUCTMODIFY = 13;		//상품 수정
		public static final int SELECT_FAMOUSPRODUCT = 14;		//상품 수정
		//필요한 질의문을 제공하는 함수
		public static String getSQL(int code) {
			//파라미터 code는 외부에서 필요한 질의문이 무엇인지를 알려주는 역할
			
			StringBuffer buff = new StringBuffer();
			
			switch(code) {
			
			case 1: //게시글 목록보기
				buff.append("SELECT   b_id as bid, ");
				buff.append("         p_id as pid, ");
				buff.append("     	  b_name as bname, ");
				buff.append("         b_svimg as svimg, ");
				buff.append("         b_img as img, ");
				buff.append("         b_create as bcreate, ");
				buff.append("         b_update as bupdate, ");
				buff.append("         lc_cnt as lccnt, ");
				buff.append("         b_cnt as bcnt, ");
				buff.append("         b_stat as bstat ");
				buff.append(" FROM board ");
				;//완료
				
			case 2: //1 (원글전체)목록보기
				buff.append("INSERT INTO board ");
				buff.append("VALUES( (SELECT    nvl( max(b_id),0)+1 ");
				buff.append("           FROM   board) ");
				buff.append("       ,? ,? ,? ,? ,? ,? ,? ,'N' ,0 ,0 ,SYSDATE-10,?, ,1 ) ");
				//buff.append("     글번호,작성명자,분류번호,제목,글내용,이미지,서버이미지,공지 유무,추천수,조회수
									//,등록일시SYSDATE,수정일시,상태)");
				break;//완료
			
			case 3://원글게시물수 조회
				buff.append("SELECT count(b_id) as cnt ");
				buff.append("FROM   board ");
				buff.append("WHERE  b_stat=1 ");
				break;//완료
			case 4://조회수 증가
				buff.append("UPDATE board ");
				buff.append("SET    lc_cnt=rb_hit+1 ");
				buff.append("WHERE  b_id=?");
				break;//완료
			case 5://원글상세보기
				buff.append("SELECT ");
				buff.append("		  b_id , ");
				buff.append("		  u_id , ");
				buff.append("         p_id , ");
				buff.append("     	  b_name , ");
				buff.append("         b_img , ");
				buff.append("         l_ccnt , ");
				buff.append("         b_cnt , ");
				buff.append("         b_create , ");
				buff.append("         b_update , ");
				buff.append("         b_stat  ");
				buff.append("FROM ");
				buff.append("	board ");
				buff.append("WHERE ");
				buff.append("  b_id=? ");
				buff.append("  and ");
				buff.append("  b_stat='1' ");
				break;//완료
			case 6://댓글상세보기
				buff.append("SELECT ");
				buff.append("	 bc_id  	   as bcid, ");
				buff.append("	 b_id   as bid, ");
				buff.append("	 u_id  as uid, ");
				buff.append("	 bc_comm    as bccomm, ");
				buff.append("	 bc_create   as bccreate, ");
				buff.append("	 bc_update as bcupdate ,  ");
				buff.append("	 bc_stat as bcstat   ");
				buff.append("FROM ");
				buff.append("	board_comment ");
				buff.append("WHERE ");
				buff.append("   b_id=? ");
				buff.append("   and ");
				buff.append("   bc_stat=1 ");
				buff.append("ORDER BY   ");
				buff.append("   bc_id DESC");
				break;//완료
			case 7://원글수정
				buff.append("UPDATE board ");
				buff.append("SET ");
				buff.append("	b_name=?, ");
				buff.append("	b_comm=?, ");
				buff.append("	u_pw=? ");
				buff.append("WHERE ");
				buff.append("   u_id=?");
				break;//완료
			case 8://댓글입력
				buff.append("INSERT INTO board_comment ");
				buff.append("VALUES( (SELECT    nvl( max(bc_id),0)+1 ");
				buff.append("           FROM   board_comment)  ");
				buff.append("         ,? ,? ,? ,?,SYSDATE-10,'Y',? )");
				//buff.append("       ,글번호,원글번호,댓글비번,댓글작성자명,댓글내용,댓글작성일SYSDATE,
										//상태 )");
				break;//완료
			case 9://댓글수정
				buff.append("UPDATE board_comment ");
				buff.append("SET ");
				buff.append("	bc_name=?, ");
				buff.append("	bc_comm=?, ");
				buff.append("	cb_pw=? ");
				buff.append("WHERE ");
				buff.append("   b_id=?");
				break;//미완
			case 10://개인정보 수정
				buff.append("UPDATE member ");
				buff.append("SET ");
				buff.append("	u_id=?, ");
				buff.append("	u_pw=?, ");
				buff.append("	u_name=?, ");
				buff.append("	u_nick=?, ");
				buff.append("	u_hp=?, ");
				buff.append("	u_gender=?, ");
				buff.append("	u_birthday=?, ");
				buff.append("	u_addsi=?, ");
				buff.append("	u_addgun=?, ");
				buff.append("	u_addetc=?, ");
				buff.append("WHERE ");
				buff.append("   u_logstat=?");
				break;//미완
			case 11://개인정보 수정(관리자)
				buff.append("UPDATE member ");
				buff.append("SET ");
				buff.append("	u_id=?, ");
				buff.append("	u_pw=?, ");
				buff.append("	u_name=?, ");
				buff.append("	u_nick=?, ");
				buff.append("	u_hp=?, ");
				buff.append("	u_gender=?, ");
				buff.append("	u_birthday=?, ");
				buff.append("	u_addsi=?, ");
				buff.append("	u_addgun=?, ");
				buff.append("	u_addetc=?, ");
				buff.append("	u_level=?, ");
				buff.append("	u_logstat=?, ");
				buff.append("WHERE ");
				buff.append("   u_logstat=?");
				break;//미완
			case 12://상품 정보
				buff.append("SELECT ");
				buff.append("SELECT   p_id as pid, ");
				buff.append("         u_id as uid, ");
				buff.append("         p_name as pname, ");
				buff.append("         p_comm as pcomm ");
				buff.append("FROM ");
				buff.append("	product_category ");
				buff.append("WHERE ");
				buff.append("  p_id=? ");
				break;//완료
			case 13://상품 수정
				buff.append("UPDATE reboard ");
				buff.append("SELECT   p_id =?, ");
				buff.append("         u_id =?, ");
				buff.append("         p_name =?, ");
				buff.append("         p_comm =? ");
				buff.append("WHERE ");
				buff.append("   u_id=?");
				break;//완료
				
			case 14://인기 상품 조회
				buff.append(" SELECT ");
				buff.append("   pb_no, ");
				buff.append("   pb_img, ");
				buff.append("   pb_title, ");
				buff.append("   m_jsi, ");
				buff.append("   m_jgu, ");
				buff.append("   m_jdong, ");
				buff.append("   pb_price, ");
				buff.append("   pb_zzimcnt, ");
				buff.append("   pb_replycnt ");
				buff.append(" FROM ");
				buff.append(" productboard ");
				break;//완료
			}//추가 예정
			//String으로 리턴
			return buff.toString();
			
		}
	}


