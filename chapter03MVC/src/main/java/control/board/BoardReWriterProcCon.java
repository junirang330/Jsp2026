package control.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.board.BoardDAO;
import model.board.BoardDTO;

@WebServlet("/BoardReWriterProcCon.do")
public class BoardReWriterProcCon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 세션 가져오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		// BoardDTO에서 넘어온 데이터를 저장
		BoardDTO bdto = new BoardDTO();
		bdto.setWriter(request.getParameter("writer"));
		bdto.setEmail(request.getParameter("email"));
		bdto.setSubject(request.getParameter("subject"));
		bdto.setPassword(request.getParameter("password"));
		bdto.setContent(request.getParameter("content"));
		bdto.setRef(Integer.parseInt(request.getParameter("ref")));
		bdto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		bdto.setId(id);
		
		// DAO 메소드
		BoardDAO bdao =new BoardDAO();
		bdao.reinsertBoard(bdto);
		
		// 댓글이 작서이 된 후는, BoardListCon.do로 이동한다.
		response.sendRedirect("BoardListCon.do");
		// RequestDispatcher rd = request.getRequestDispatcher("BoardListCon.do");
		// rd.forward(request, response);
	}
}
