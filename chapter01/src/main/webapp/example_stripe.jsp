<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습문제 03</title>
</head>
<body>
	<!-- 제곱/구분 -->
	<%!
	public String root(int n){
		String answer = "";
			
		/* (n*n)%2==0 ? answer = "짝수": answer = "홀수"; */
		
		if(n*n % 2==0){
			answer = "짝수";
		}else{
			answer = "홀수";
		}
		return answer;
	}
	%>
	<table border = "1">
		<tr>
			<th>숫자</th><th>제곱</th><th>구분</th>
		</tr>
		
		<%
			for(int i = 1; i<=20; i++){
		%>
			<tr style = "background-color : <%= (i%2 == 0) ? "#e6f2ff": "#ffffff" %>;">
			<td>
			<!-- 3의 배수 굵게 - out.print 사용 -->
			<%
				if(i%3==0){
					out.print("<b>" + i + "</b>");
				}else {
					out.print(i);
				}
			%>
			
			</td>
			<td><%= i*i %></td>
			<td><%= root(i)%></td>	
			</tr>
		<%
			}
		%>
		
	
	
	</table>
	
</body>
</html>