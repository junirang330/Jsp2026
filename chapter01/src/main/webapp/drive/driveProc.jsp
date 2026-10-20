<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>driveProc</title>
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
	
	<table style = "width: 400px;  border-collapse: collapse;">
		<tr>
			<td style = "border: 1px solid black; background-color: dodgerblue; color: white; text-align: center">주행일자</td>
			<td style = "border: 1px solid black; text-align: center"><%= drvDate %></td>
		</tr>
		<tr>
			<td style = "border: 1px solid black;  background-color: dodgerblue; color: white; text-align: center">차량번호</td>
			<td style = "border: 1px solid black; text-align: center"><%= carNo %></td>
		</tr>
		<tr>
			<td style = "border: 1px solid black;  background-color: dodgerblue; color: white; text-align: center">출발Km</td>
			<td style = "border: 1px solid black; text-align: center"><%= drvStart %> km</td>
		</tr>
		<tr>
			<td style = "border: 1px solid black;  background-color: dodgerblue; color: white; text-align: center">도착Km</td>
			<td style = "border: 1px solid black; text-align: center"><%= drvEnd %> km</td>
		</tr>
		<tr>
			<td style = "border: 1px solid black;  background-color: dodgerblue; color: white; text-align: center">부서코드</td>
			<td style = "border: 1px solid black; text-align: center"><%= deptCode %></td>
		</tr>
		<tr>
			<td style = "border: 1px solid black;  background-color: dodgerblue; color: white; text-align: center">주유금액</td>
			<td style = "border: 1px solid black; text-align: center"><%= drvMoney %> 원</td>
		</tr>
	</table>
	
	<% } %>

</body>
</html>