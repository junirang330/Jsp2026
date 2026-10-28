package control.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberDTO;

@WebServlet("/loginProc.do")
public class loginProc extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿 작성순서
		// 1) 인코딩
		// 2) input에서 입력받은 값을 request로 가져오기 request.getParameter()
		// 3) MemberDTO 인스턴스하기
		// 4) MemberDAO 인스턴스하기
		// 5) 예외처리하기(중복아이디 체크, pass=passchk..)
		// 6) request.setAttribute("이름",값)저장
		// 7) RequestDispatcher 객체로 jsp 파일로 forward 하기
		
		// 1. 인코딩
		request.getParameter("utf-8");
		// 2. 입력받은 id / pass 꺼내오기
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
	
		// 3. MemberDAO 인스턴스
		MemberDAO mdao = new MemberDAO();
		
		boolean chkOk = mdao.loginCheck(id, pass);
		
		// mdto 가방에 input에서 받은 값으 꺼내어 담는다.
		
		
		if(chkOk) {
			// 로그인 성공한 상태 => 세션에 id를 저장해야 한다.
			// jsp페이지에서는, 세션을 인스턴스 없이 사용하지만
			// servlet에서는, 세션을 인스턴스로 꺼내와야 사용가능하다.
			HttpSession session = request.getSession();  // 세션 새로 생성
			request.setAttribute("msgid", "존재하지 않는 아이디 입니다.");
			// session.setAttribute("작명이름", 값) : 저장
			// session.getAttribute(값) : 꺼내오다
			session.setAttribute("id", id);
			// 세션유지시간 : 30분
			session.setMaxInactiveInterval(60*30);  // 초: 30*60 = 30분
			// 로그인성공하고난 후 => 메인화면으로 이동
			response.sendRedirect("index.jsp");
		}else {  // 로그인 실패 : 아이디와 패스워드가 다른 경우
			request.setAttribute("msg", "아이디와 패스워드를 확인하세요");
			RequestDispatcher rd = request.getRequestDispatcher("/login/loginErr.jsp");
			rd.forward(request, response);
		}
	}
}
