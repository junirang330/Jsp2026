<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션Test</title>
</head>
<body>
	<%
		String name = "shin";
		// session은 내장객체로 서버에서 정보(데이터)를 유지한다.
		// setAttribute("텍스트", object) => 저장
		// getAttribute("텍스트") => 추출
		session.setAttribute("seName", name);
		
		// 세션 만료시간 정하기
		session.setMaxInactiveInterval(10);  // 10초간 세션 유지 후, 종류
	%>
	<!-- get방식으로 떠넘기는 방법 -->
	
	<a href = "SessionName.jsp">세션네임 페이지로 이동</a>
	
	
</body>
</html>