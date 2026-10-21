<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>driveForm</title>
</head>
<body>

	<form action="driveProc.jsp" method ="post">
		<h1>주행내역등록</h1>
		<table border = "1" >
			<tr>
				<th>구분</th><th>입력</th>
			</tr>
			<tr>
				<td><label for = "date">주행일자</label></td>
				<td><input type ="text" id = "date" name = "drvDate" style = "border: none;"/>
				2023년01월01일 예)20230101</td>
			</tr>
			<tr>
				<td><label for = "carNum">차량번호</label></td>
				<td><input type ="text" id = "carNum" name = "carNo" style = "border: none;"/>
				예)10가0001</td>
			</tr>
			<tr>
				<td><label for = "startKm">출발Km</label></td>
				<td><input type ="text" id = "startKm" name = "drvStart" style = "border: none;"/>Km</td>
			</tr>
			<tr>
				<td><label for = "endKm">도착Km</label></td>
				<td><input type ="text" id = "endKm" name = "drvEnd" style = "border: none;"/>Km</td>
			</tr>
			<tr>
				<td><label for = "code">부서코드</label></td>
				<td>
					<select name = "deptCode">
						<option value = none >부서</option>
						<option value = 10>[10]영업부</option>
						<option value = 20>[20]총무부</option>
						<option value = 30>[30]구매부</option>
						<option value = 40>[40]개발부</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for = "drvMoney">주유금액</label></td>
				<td><input type ="text" id = "price" name = "drvMoney" style = "border: none;"/>원</td>
			</tr>
			<tr>
				<td colspan = "2"><input type = "submit" value ="주행내역등록"/>
				<input type = "reset" value = "다시쓰기"/></td>
			</tr>
		
		</table>
	</form>
	
</body>
</html>