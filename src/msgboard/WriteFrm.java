package msgboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dispatcher.ReboardSuper;

// 글쓰기 폼요청 (/reboard/writeFrm.bo)이 들어올때
// 호출될 컨트롤러 클래스
public class WriteFrm implements ReboardSuper{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("WriteFrm컨트롤러 진입");
		
		//컨트롤러의 할 일은 아래와 같지만 여기에서는 폼만 보여주면 되므로 딱히 할 일이 없다.
		
		
		return "../view/reboard/writeFrm.jsp";
		
	}

}
