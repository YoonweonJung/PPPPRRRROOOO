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

public class ReboardVO {
	//변수
	private int    no;		//글번호
	private int	   oriNo;	//원글번호	
	private String writer;  //작성자
	private String title;   //제목
	private Date   wday;    //작성일
	private int    hit;     //조회수
	private int    cnt;		//댓글수
	private String body;	//내용
	private String pw;		//비번
	
	
	//setter & getter & toString()
	public int getOriNo() {
		return oriNo;
	}
	public void setOriNo(int oriNo) {
		this.oriNo = oriNo;
	}
	public int getNo() {
		return no;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getWday() {
		return wday;
	}
	public void setWday(Date wday) {
		this.wday = wday;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	@Override
	public String toString() {
		return "ReboardVO [no=" + no + ", oriNo=" + oriNo + ", writer=" + writer + ", title=" + title + ", wday=" + wday
				+ ", hit=" + hit + ", cnt=" + cnt + ", body=" + body + ", pw=" + pw + "]";
	}
	
	
	
	
	
}














