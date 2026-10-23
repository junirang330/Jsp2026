<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 삭제하기</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
	%>
	<h2>회원 정보 삭제하기</h2>
	<form action = "MemberDeleteProc.jsp" method="post">
		<input type = "hidden" name = "id" value = "<%= id %>"/>
		<table>
			<tr>
				<td>아이디</td>
				<td><%= id %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type = "password" name = "pass3" />
				</td>
			</tr>
			<tr colspan = "2">
				<td>
					<input type = "submit" value="회원 삭제하기" onclick=""/>&nbsp;
					<input type = "button" value = "회원 전체보기" onclick = "location.href='main.jsp?page=MemberList'"/>
				</td>
			</tr>
		</table>
	</form>
	
	
	

</body>
</html>