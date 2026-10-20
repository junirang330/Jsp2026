<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/main_info.css"/>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String drvDate = request.getParameter("drvDate");
		String carNo = request.getParameter("carNo");
		String drvStart = request.getParameter("drvStart");
		String drvEnd = request.getParameter("drvEnd");
		String deptCode = request.getParameter("deptCode");
		String drvMoney = request.getParameter("drvMoney");
	
		
		String msg =" ";
		/* 예외처리 */
		if(drvDate == null || drvDate.isEmpty()){
			msg = "주행일자가 입력되지 않았습니다!";
		}else if(carNo == null || carNo.isEmpty()){
			msg = "차량번호가 입력되지 않았습니다!";
		}else if(drvStart == null || drvStart.isEmpty()){
			msg = "출발Km가 입력되지 않았습니다!";
		}else if(drvEnd == null || drvEnd.isEmpty()){
			msg = "도착Km가 입력되지 않았습니다!";
		}else if(deptCode.equals("none") || deptCode.isEmpty()){
			msg = "부서코드가 선택되지 않았습니다!";
		}else if(drvMoney == null || drvMoney.isEmpty()){
			msg = "주유금액이 입력되지 않았습니다!";
		}
		
		if(msg != " "){
		
		
	%>
	<script type="text/javascript">
		alert("<%= msg%>");
		history.go(-1);
	</script>
	
	<% 
		} else{
	%>
	
	<table class="list">
		<tr>
			<td>주행일자</td>
			<td><%= drvDate %></td>
		</tr>
		<tr>
			<td>차량번호</td>
			<td><%= carNo %></td>
		</tr>
		<tr>
			<td>출발Km</td>
			<td><%= drvStart %> km</td>
		</tr>
		<tr>
			<td>도착Km</td>
			<td><%= drvEnd %> km</td>
		</tr>
		<tr>
			<td>부서코드</td>
			<td><%= deptCode %></td>
		</tr>
		<tr>
			<td>주유금액</td>
			<td><%= drvMoney %> 원</td>
		</tr>
	</table>
	
	<% } %>
</body>
</html>