package control.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberDTO;


@WebServlet("/MProc.do")
public class MemberJoinProc extends HttpServlet {
	
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
		
		request.setCharacterEncoding("utf-8");
		MemberDTO mdto = new MemberDTO();
		MemberDAO mdao = new MemberDAO();
		
		// k123
		String id = request.getParameter("id");
		mdto.setId(id);
		// DAO의 getId()메소드를 추출
		String chkid = mdao.getId(id); 
		
		String pass = request.getParameter("pass");
		String passchk = request.getParameter("passchk");
		
		// 콘솔 출력
		System.out.println("입력 : ["+id+"], 조회 결과 ["+chkid+"]");
		
		// mdto 가방에 input에서 받은 값을 꺼내어 담는다.
		mdto.setPass(pass);
		mdto.setPasschk(passchk);
		
		mdto.setEmail(request.getParameter("email"));
		mdto.setTel(request.getParameter("tel"));
		
		// hobby 는 체크박스이므로 동시에 여러개가 선택되어 저장되도록 코드작성해야 함
		String hobbyOne = "";
		String[] arr = request.getParameterValues("hobby");
		/*
		 * for(int i = 0; i<arr.length; i++) { hobbyOne += arr[i] + " "; }
		 */
		for(String hob : arr) {
			hobbyOne += hob + " ";
		}
		mdto.setHobby(hobbyOne);
		mdto.setJob(request.getParameter("job"));
		mdto.setAge(request.getParameter("age"));
		mdto.setInfo(request.getParameter("info"));

		// 예외처리하기: 중복아이디 체크
		// msg = "이미 존재하는 아이디"
		// pass = passchk가 같으면 member테이블에 insert해야함.
		// pass가 틀리면, "비밀번호를 확인하세요"
		
		String jspAddress = "";
		// 중복아이디 체크
		if(id.equals(chkid)) {
			request.setAttribute("msgid", "이미 존재하는 아이디 입니다.");
			jspAddress = "/member/joinIderr.jsp";
		}else if(pass.equals(passchk)) {  // 패스워드 pass = passchk
			// mdao의 insert쿼리문
			mdao.insertMember(mdto);
			
			// 회원전체 목록을 출력하는 MemberList 생성할 예정
			// MemberJoinProc 컨트롤러에서 -> MemberListCon.do 컨트롤러로 이동
			jspAddress = "/MemberListCon.do";
			
		}else {
			request.setAttribute("msg", "패스워드를 확인하세요");
			jspAddress = "/member/joinerr.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(jspAddress);
		rd.forward(request, response);
	}
}
