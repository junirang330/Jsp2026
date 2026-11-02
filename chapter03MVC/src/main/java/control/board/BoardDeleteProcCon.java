package control.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;

@WebServlet("/BoardDeleteProcCon.co")
public class BoardDeleteProcCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String userPw = request.getParameter("userPw");
		String dbPw = request.getParameter("dbPw");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		// 비밀번호가 같으면, 소프트 삭제
		if(userPw.equals(dbPw)&&userPw!=null) {
			// 비밀번호가 같다.
			BoardDAO bdao = new BoardDAO();
			bdao.deleteBoard(num);
			// 소프트 삭제되면, BoardListCon.do로 보내기
			response.sendRedirect("BoardListCon.do");
		}else {
			// 비밀번호가 틀리면, alert 창 띄우기
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush();
		}
	}
}
