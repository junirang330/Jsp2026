package control.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardDTO;

@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		// num, subject, content 받아오기
		int num = Integer.parseInt(request.getParameter("num"));
		// userPw 받아오기
		// 게시글의 비밀번호가 같을때만, 수정가능하도록 예외처리 해야 함
		String userPw = request.getParameter("userPw");
		// board DB의 비밀번호
		String dbPw = request.getParameter("dbPw");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		
		// 실제로업데이트 되는 처리 과정
		// DAO / DTO 가져오기
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(userPw.equals(dbPw)) {
			// db의 비밀번호와 내가 입력한 비밀번호가 같으면 수정
			BoardDAO bdao = new BoardDAO();
			bdao.updateBoard(num, subject, content);
			// 반드시 sendRedirect()로 넘기기
			response.sendRedirect("BoardListCon.do");
		}else {
			// 비밀번호가 일치하지 않으면, 메시지창 띄우고, 이전페이지로 이동
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush();  // 화장실 변기물 내릴때, 사용하는 기능 (메시지를 지워버림)
		}
		
	}

}
