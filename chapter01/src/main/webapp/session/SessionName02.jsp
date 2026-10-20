<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션02</title>
</head>
<body>
	<%
		String sessName03 = (String)session.getAttribute("seName"); 
	%>
	<h2><%= sessName03 %> 님, 안녕하세요</h2>
</body>
</html>