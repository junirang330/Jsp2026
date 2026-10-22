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

	<form name = "driveForm" action="driveProc02.jsp" method ="post">
		<h1>주행내역등록</h1>
		<table border = "1" width = "700">
			<tr>
				<th width = "100" height = "40" align = "center">구분</th><th>입력</th>
			</tr>
			<tr>
				<td width = "100" height = "40" align = "center"><label for = "date">주행일자</label></td>
				<td><input type ="text" id = "date" name = "drvDate" style = "border: none;"/>
				2023년01월01일 예)20230101</td>
			</tr>
			<tr>
				<td width = "100" height = "40" align = "center"><label for = "carNum">차량번호</label></td>
				<td><input type ="text" id = "carNum" name = "carNo" style = "border: none;"/>
				예)10가0001</td>
			</tr>
			<tr>
				<td width = "100" height = "40" align = "center"><label for = "startKm">출발Km</label></td>
				<td><input type ="text" id = "startKm" name = "drvStart" style = "border: none;"/>Km</td>
			</tr>
			<tr>
				<td width = "100" height = "40" align = "center"><label for = "endKm">도착Km</label></td>
				<td><input type ="text" id = "endKm" name = "drvEnd" style = "border: none;"/>Km</td>
			</tr>
			<tr>
				<td width = "100" height = "40" align = "center"><label for = "code">부서코드</label></td>
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
				<td width = "100" height = "40" align = "center"><label for = "drvMoney">주유금액</label></td>
				<td><input type = "text" id = "price" name = "drvMoney" style = "border: none;"/>원</td>
			</tr>
			<tr>
				<td colspan = "2">
					<button type = "button" onclick = "chkform()">주행내역등록</button>
					<button type = "button" onclick = "resetform()">다시쓰기</button>
				</td>
			</tr>
		
		</table>
	</form>
	
	<!-- 자바스크립트를 이용해서 유효성 검사 하기 -->
	<script type="text/javascript">
		function chkform(){
			let f = document.driveForm;
			if(f.drvDate.value == ""){
				alert("주행입력 안됨");
				/* 주행입력에 포커스(커서 이동)하는 방법 */
				f.drvDate.focus();
				return;
			}
			if(f.carNo.value == ""){
				alert("차량번호 안됨");
				f.carNo.focus();
				return;
			}
			if(f.drvStart.value == ""){
				alert("출발Km 안됨");
				f.drvStart.focus();
				return;
			}
			if(f.drvEnd.value == ""){
				alert("도착Km 안됨");
				f.drvEnd.focus();
				return;
			}
			if(f.deptCode.value == ""){
				alert("부서코드 입력 안됨");
				f.deptCode.focus();
				return;
			}
			if(f.drvMoney.value == ""){
				alert("주유금액 입력 안됨");
				f.drvMoney.focus();
				return;
			}
			
			f.submit();
		}
		function resetform(){
			let f = document.driveForm;
			alert("정보를 지우고 다시 입력");
			f.reset();
			f.drvDate.focus();
		}
	</script>
	
</body>
</html>