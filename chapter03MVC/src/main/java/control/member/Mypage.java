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

		HttpSession session = request.getSession();
		
		MemberDAO mdao = new MemberDAO();
		System.out.println("1번");
		
		if(session != null) {
			String id = (String) session.getAttribute("id");
			MemberDTO mdto = mdao.getInfo(id);
			request.setAttribute("mdto", mdto);
			System.out.println(mdto.getId());

		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=member/Mypage.jsp");
		rd.forward(request, response);
	}

}
