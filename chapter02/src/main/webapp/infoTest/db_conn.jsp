<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		
		Connection con = null;
		PreparedStatement pstmt = null;
		// select 문 담는 ResultSet 객체 변수
		ResultSet rs = null;
		
		// DB 접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";
		// DB URL
		String url = "jdbc:mysql://localhost:3306/infoTest?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1234";

		// 숫자 세자리마다 콤마, 원 표시 출력
		DecimalFormat df = new DecimalFormat("#,##0");
		DecimalFormat df02 = new DecimalFormat("￦#,##0");
		
		
	%>
	
</body>
</html>