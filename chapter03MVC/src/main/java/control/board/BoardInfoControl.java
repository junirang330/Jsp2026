package control.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLEditorKit.Parser;

import model.board.BoardDAO;
import model.board.BoardDTO;

@WebServlet("/BoardInfoControl.do")
public class BoardInfoControl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");
		// 객체선언
		BoardDTO bdto = new BoardDTO();
		BoardDAO bdao = new BoardDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		bdto = bdao.getOneBoard(num);
		System.out.println(num);
			
		request.setAttribute("bdto", bdto);
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=board/BoardInfo.jsp");
		rd.forward(request, response);
	}
}
