package vo;

import java.sql.Date;

//VO : Value Object로 데이터를 보관하기 위한 클래스
//1. 데이터를 보관하기위한 변수 준비
//2. 변수를 조작(셋팅, 제공)하기위한 setXxx, getXxx함수 준비
//   특히 getXxx함수는 JSTL에서 데이터를 사용할 목적으로 제작한다
//   사용할 때는  get을 제외한 나머지이름만 이용.
//            첫글자는 소문로 나머지이름은 대소문자 그대로 이용.
//   예) getTitle();   ->사용할 때는  ${title}
//3. (선택) toString() 재정의

//참고	DTO: 데이터를 셋팅, 제공

public class ShopboardVO {
	
	private int    b_id;		//글번호
	private int	   p_id;		//상품번호	
	private int	   b_stat;   //회원 접속 상태 	
	private int	   b_cnt;    //게시판 조회 수 	
	private int	   l_ccnt;   //좋아요 수 	
	private Date   b_create;    //작성일
	private Date   b_update;    //수정일
	private String u_id;  	//작성자 아이디 
	private String b_name;   //글제목
	private String b_comm;	//글내용
	private String sv_img;	//서버이미지
	private String b_img;		//이미지 
	private String b_notiyn; //회원알림 
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getB_stat() {
		return b_stat;
	}
	public void setB_stat(int b_stat) {
		this.b_stat = b_stat;
	}
	public int getB_cnt() {
		return b_cnt;
	}
	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}
	public int getL_ccnt() {
		return l_ccnt;
	}
	public void setL_ccnt(int l_ccnt) {
		this.l_ccnt = l_ccnt;
	}
	public Date getB_create() {
		return b_create;
	}
	public void setB_create(Date b_create) {
		this.b_create = b_create;
	}
	public Date getB_update() {
		return b_update;
	}
	public void setB_update(Date b_update) {
		this.b_update = b_update;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_comm() {
		return b_comm;
	}
	public void setB_comm(String b_comm) {
		this.b_comm = b_comm;
	}
	public String getSv_img() {
		return sv_img;
	}
	public void setSv_img(String sv_img) {
		this.sv_img = sv_img;
	}
	public String getB_img() {
		return b_img;
	}
	public void setB_img(String b_img) {
		this.b_img = b_img;
	}
	public String getB_notiyn() {
		return b_notiyn;
	}
	public void setB_notiyn(String b_notiyn) {
		this.b_notiyn = b_notiyn;
	}
	@Override
	public String toString() {
		return "ShopboardVO [b_id=" + b_id + ", p_id=" + p_id + ", b_stat=" + b_stat + ", b_cnt=" + b_cnt + ", l_ccnt="
				+ l_ccnt + ", b_create=" + b_create + ", b_update=" + b_update + ", u_id=" + u_id + ", b_name=" + b_name
				+ ", b_comm=" + b_comm + ", sv_img=" + sv_img + ", b_img=" + b_img + ", b_notiyn=" + b_notiyn + "]";
	}
	
	
	
}












