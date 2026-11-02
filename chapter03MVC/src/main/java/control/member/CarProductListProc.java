package control.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.CarDTO;

@WebServlet("/CarProductListProc.do")
public class CarProductListProc extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		// MemberDAO 가져오기
		MemberDAO mdao = new MemberDAO();
		CarDTO cdto = new CarDTO();
		
		ArrayList<CarDTO> carAll;
		carAll = mdao.getAllProduct();
		
		request.setAttribute("carAll", carAll);
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=section.jsp");
		rd.forward(request, response);
	}

}
