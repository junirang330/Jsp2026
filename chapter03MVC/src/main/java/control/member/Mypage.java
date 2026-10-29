package control.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBPKG.Util;
import model.member.MemberDAO;
import model.member.MemberDTO;


@WebServlet("/Mypage.do")
public class Mypage extends HttpServlet {
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 힌트 HttpSession 객체를 이용하여 세션이 null이면 로그인이 안된 상태
		// 세션이 null 이 아니면 로그인상태로, null이 아닐때, id값을 session.getAttribute("id")로 받아온다.
		
		request.setCharacterEncoding("utf-8");
		
		// request.getSession(false) : 만약 세션이 존재하면 가져오고, 없으면 새로만들지 않고 null로 가져온다(리턴).
		HttpSession session = request.getSession(false);

		// 로그인 된 아이디
		String id = (String) session.getAttribute("id");
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		
		// 조건 : session이 null이 아닌 경우 : 로그인 상태
		if(session != null) {
			mdto = mdao.getInfo(id);
		}
		// mdto 가방에 담은 값들을 jsp view단으로 넘길때는 setAttribute("작명", 값)에 담는다.
		request.setAttribute("mdto", mdto);
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=member/Mypage.jsp");
		// select문을 제외한 나머지 쿼리문 작성시, 
		// f5로 새로고침 시 화면이 다시 화면이 재요청이 되는 현상
		rd.forward(request, response);

		
	}

}
