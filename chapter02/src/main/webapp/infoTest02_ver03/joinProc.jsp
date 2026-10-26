<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import ="DBPKG.Util" %>

<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	boolean msgChk = false;  // 회원등록이 될 떄, 메시지 체크 변수
	try {
		con = Util.getConnection();

		String sql = "insert into member_tbl_02 values(null, ?, ?, ?, ?, ?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("custname"));
		pstmt.setString(2, request.getParameter("phone"));
		pstmt.setString(3, request.getParameter("address"));
		pstmt.setString(4, request.getParameter("joindate"));
		pstmt.setString(5, request.getParameter("grade"));
		pstmt.setString(6, request.getParameter("city"));
		
		// msgChk 를 위해서, insert / update / delete 실행후, int값으로 받는다.
		// 1=> 실행 / 0 => 실패
		// 0 보다 크면 true
		msgChk = pstmt.executeUpdate() > 0;
	    
	  } catch (Exception e) {
	    e.printStackTrace();
	  } finally {
	    try {
	      if (rs != null) rs.close();
	      if (pstmt != null) pstmt.close();
	      if (con != null) con.close();
	    } catch (Exception e) { e.printStackTrace(); }
	  }
%>
<script>
	<% if(msgChk) { %>
		alert("회원등록이 완료됨");
		location.href="memberForm.jsp";
	<%} else {%>
		alert("회원등록실패");
		history.go(-1);
	<%} %>
</script>