package msgboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MsgDAO;
import shopdispatcher.ShopreboardSuper;

// 이 클래스는 (원)글삭제 요청을 담당하는 컨트롤러
public class MsgBoardDelete implements ShopreboardSuper {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//할일
		//1. 파라미터받기
		String msg_board = request.getParameter("m_num");
		int    m_num    = Integer.parseInt(msg_board);
		String pw 		= request.getParameter("pw");
		String nowPage 	= request.getParameter("nowPage");
		
		//2. 비즈니스로직
		MsgDAO dao=new MsgDAO();
		int change = dao.deleteMsgboard(m_num, pw);
		//update가 되었으면 즉 delete가 되었으면 1리턴
		//0을 리턴받으면 실패
		
		dao.close(); //connection닫기
		
		//3. 모델
		//4. 뷰
		request.setAttribute("CHANGE", change); //update성공실패여부 결과
		request.setAttribute("nowPage", nowPage);
		
		return "../view/reboard/msgboardDelete.jsp";
	}

}
