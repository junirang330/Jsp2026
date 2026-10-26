<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "db_conn.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	/* 데이터 타입 꼭 정확하게 DB와 일치하기 */
	int custno = Integer.parseInt(request.getParameter("custno"));
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	boolean updateMsg = false;
	String msg = "";

	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		// 업데이트 sql => update 테이블명 set 수식(a=b) where ~ ;
		String sql = "update member_tbl_02 set custname=?, phone=?, address=?, "
				+ "joindate=?, grade=?, city=? where custno=?";
		pstmt = con.prepareStatement(sql);  // 실행객체 생성
		// ? 에 대응하는 세팅값 설정하기
		// 단, 물음표는 갯수만큼 대응한다.
		// 왼쪽부터 순서대로 1, 2, ...  이다.
		// 물음표는 총 7개 (where 절에도 물음표 있다.)
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setInt(7, custno);
		pstmt.executeUpdate();
		// update, insert, delete 실행 명령어
		// executeUpdate()
		
		// try안에서 update가 실행된 상태이므로, 메시지는 true
		updateMsg = true;
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null) rs.close();
		if(con!=null) con.close();
		if(pstmt!=null) pstmt.close();
	}
%>
<script type="text/javascript">
	<% if(updateMsg){%>
			alert("회원정보 수정완료함!");
			location.href = "memberForm.jsp";
	<% }else { %>
			alert("회원정보 수정 실패함!");
			history.go(-1);
	<% } %>
</script>