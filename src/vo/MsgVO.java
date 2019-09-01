package vo;
import java.sql.Date;


public class MsgVO {
	private String   m_id;	//회원 아이디
	private int mb_no;//쪽지 번호
	private String mb_title;//제목
	private String mb_comm;//내용
	private int mb_comf;//확인
	private Date mb_date;//등록 일시
	private int mb_stat;//상태
	private String m_nick;//닉네임
	private String mb_idchk;//보낸 사람 체크
	
	
	//getter, setter

	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public int getMb_no() {
		return mb_no;
	}


	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}


	public String getMb_title() {
		return mb_title;
	}


	public void setMb_title(String mb_title) {
		this.mb_title = mb_title;
	}


	public String getMb_comm() {
		return mb_comm;
	}


	public void setMb_comm(String mb_comm) {
		this.mb_comm = mb_comm;
	}


	public int getMb_comf() {
		return mb_comf;
	}


	public void setMb_comf(int mb_comf) {
		this.mb_comf = mb_comf;
	}


	public Date getMb_date() {
		return mb_date;
	}


	public void setMb_date(Date mb_date) {
		this.mb_date = mb_date;
	}


	public int getMb_stat() {
		return mb_stat;
	}


	public void setMb_stat(int mb_stat) {
		this.mb_stat = mb_stat;
	}


	public String getM_nick() {
		return m_nick;
	}


	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}


	public String getMb_idchk() {
		return mb_idchk;
	}


	public void setMb_idchk(String mb_idchk) {
		this.mb_idchk = mb_idchk;
	}
	
	
	//보내기
	
	
		@Override
		public String toString() {
			return "MsgVO [m_id=" + m_id + ", mb_no=" + mb_no + ", mb_title=" + mb_title + ", mb_comm=" + mb_comm
					+ ", mb_comf=" + mb_comf + ", mb_date=" + mb_date + ", mb_stat=" + mb_stat + ", m_nick=" + m_nick
					+ ", mb_nickchk=" + mb_idchk + "]";
		}
	
	
	
}
