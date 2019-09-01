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

public class ShopFamousboardVO {
	
	private int pb_no;    //글번호 
	private String pb_img;   //사진주소
	private String pb_title; //글제목 
	private String m_jsi; //회원주소시 
	private String m_jgu; //회원주소구 
	private String m_jdong; //회원주소동
	private String pb_price; //가격
	private int pb_zzimcnt;	//찜횟수
	private int pb_replycnt; //댓글 수
	
	public int getPb_no() {
		return pb_no;
	}
	public void setPb_no(int pb_no) {
		this.pb_no = pb_no;
	}
	public String getPb_img() {
		return pb_img;
	}
	public void setPb_img(String pb_img) {
		this.pb_img = pb_img;
	}
	public String getPb_title() {
		return pb_title;
	}
	public void setPb_title(String pb_title) {
		this.pb_title = pb_title;
	}
	public String getM_jsi() {
		return m_jsi;
	}
	public void setM_jsi(String m_jsi) {
		this.m_jsi = m_jsi;
	}
	public String getM_jgu() {
		return m_jgu;
	}
	public void setM_jgu(String m_jgu) {
		this.m_jgu = m_jgu;
	}
	public String getM_jdong() {
		return m_jdong;
	}
	public void setM_jdong(String m_jdong) {
		this.m_jdong = m_jdong;
	}
	public String getPb_price() {
		return pb_price;
	}
	public void setPb_price(String pb_price) {
		this.pb_price = pb_price;
	}
	public int getPb_zzimcnt() {
		return pb_zzimcnt;
	}
	public void setPb_zzimcnt(int pb_zzimcnt) {
		this.pb_zzimcnt = pb_zzimcnt;
	}
	public int getPb_replycnt() {
		return pb_replycnt;
	}
	public void setPb_replycnt(int pb_replycnt) {
		this.pb_replycnt = pb_replycnt;
	}
	@Override
	public String toString() {
		return "ShopFamousboardVO [pb_no=" + pb_no + ", pb_img=" + pb_img + ", pb_title=" + pb_title + ", m_jsi="
				+ m_jsi + ", m_jgu=" + m_jgu + ", m_jdong=" + m_jdong + ", pb_price=" + pb_price + ", pb_zzimcnt="
				+ pb_zzimcnt + ", pb_replycnt=" + pb_replycnt + "]";
	}
	
	
	
}





