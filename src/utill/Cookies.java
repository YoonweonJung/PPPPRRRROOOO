package utill;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;//Servlet-api
import javax.servlet.http.HttpServletRequest;

//교재 p222 참고
public class Cookies {

	//변수
	private Map<String, Cookie> cookieMap = 
			new HashMap<String, Cookie>();
	
	//생성자
	public Cookies(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if( cookies!=null || cookies.length!=0 ){
			int len = cookies.length; //쿠키의 수
			for(int i=0; i<len ;i++){
				Cookie temp = cookies[i]; //반복한번 돌때마다 Cookie를 가져온다
				String key  = temp.getName();  //쿠키의 키값가져오기
				//위에서 선언한 변수의 타입<String, Cookie>에 맞추어 준다
				cookieMap.put(key, temp); 
			}	
		}
	}

	
	//함수
	//쿠키제공함수
	public Cookie  getCookie(String name) {
		return cookieMap.get(name);
	}
	
	//쿠키의 value를 제공함수
	public String getValue(String name) throws IOException {
		Cookie cook = cookieMap.get(name);
		if( cook==null ) {  //쿠키가 없으면
			return null;    
		}
		return URLDecoder.decode(cook.getValue(),"euc-kr");
	}
		
	
	//특정쿠키 존재여부 확인
	public boolean exiests(String name) {
		return cookieMap.get(name) != null;
	}
	
	//쿠키생성
	//static으로 선언했으므로
	//누군가가 Cookie가 필요하면 클래스명을 이용해서 함수를 호출할 수 있다
	//예) Cookies.createCookie("id", "hongid가나다");
	public static Cookie createCookie(String name, String value)
			 throws IOException {
		return new Cookie(name, URLEncoder.encode(value,"utf-8"));
	}

	//쿠키생성함수의 오버로딩
	//오버로딩은 동일클래스내  함수명이 같은 메소드가 여러개
	//이 때, 파라미터의 개수, 타입, 순서가  달라야한다
	public static Cookie createCookie(String name, String value,
			String path, int maxAge )
			 throws IOException {
		Cookie cook = new Cookie(name, URLEncoder.encode(value,"utf-8"));
		
		//저장위치를 지정
		cook.setPath(path); //브라우저별로 쿠키 저장소의 루트에 기록해 달라는 의미
		//생존기간을 지정
		cook.setMaxAge(maxAge);    //하루는 60*60*24
		
		return cook;
	}
	
	
	public static Cookie createCookie(String name, String value, String domain,
			String path, int maxAge )
			 throws IOException {
		Cookie cook = new Cookie(name, URLEncoder.encode(value,"utf-8"));
		
		//기본적으로 쿠키는 그 쿠키를 생성한 서버에만 전송
		//유효한 도메인지정
		cook.setDomain(domain);
		
		//저장위치를 지정
		cook.setPath(path); //브라우저별로 쿠키 저장소의 루트에 기록해 달라는 의미
		//생존기간을 지정
		cook.setMaxAge(maxAge);    //하루는 60*60*24
		
		return cook;
	}

}

/* 참고
 *  저
 * 인코딩
 * 
 * 디코딩
 * 
 * 
 * */




















