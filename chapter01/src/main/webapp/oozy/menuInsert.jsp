<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴등록</title>
</head>
<body>
	<form action = "main.jsp?page=menuInsertProc" method = "post">
		<h3>메뉴등록</h3>
		<table class = "enrollment">
			<tr>
				<td><label for = "menuName">메뉴명</label></td>
				<td><input type = "text" id = "menuName" name = "menuName"/></td>
			</tr>
			<tr>
				<td><label>분류</label></td>
				<td>
					<select name = "menuSort">
						<option value = "none">분류</option>
						<option value = "10">[10]COFFEE</option>
						<option value = "20">[20]COLD BREW</option>
						<option value = "30">[30]BEVERAGE</option>
						<option value = "40">[40]DESSERT</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for = "menuPrice">가격</label></td>
				<td><input type = "text" id = "menuPrice" name = "menuPrice"/></td>
			</tr>
			<tr>
				<td><label>판매상태</label></td>
				<td>
					<input type = "radio" value = "판매중" id = "sale" name ="menuStat"/>
					<label for="sale">판매중</label>
					<input type = "radio" value = "SEASON OUT" id = "season_out" name ="menuStat"/>
					<label for = "season_out">SEASON OUT</label>
				</td>
			</tr>
			<tr>
				<td><label for = "menuDesc">설명</label></td>
				<td>
					<input type = "textarea" id = "menuDesc" name = "menuDesc"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- 메뉴등록버튼 -->
					<input type = "submit" value= "enroll"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>