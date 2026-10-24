<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원등록</title>
<link rel="stylesheet" href="css/main.css"/>
</head>
<body>

	<%
		request.getParameter("utf-8");
	%>
	<h2>홈쇼핑 회원등록</h2>
	<form name = "join" action = "joinProc.jsp" method = "post" >
		<table>
			<tr>
				<th>회원정보(자동생성)</th>
	<%
		try {
			// 드라이버 로딩
			Class.forName(driver);
			// DB연결
			con = DriverManager.getConnection(url, user, password);
			// 가입한 회원 모든 정보 검색 select문 이용
			String sql = "select custno from member_tbl_02";
			pstmt = con.prepareStatement(sql);
			// resultSet 객체에 담기 => sql 문의 실험결과를 담는다.
			rs = pstmt.executeQuery();
	%>
				<td>
					<%-- <input  name = "number" value = "<%= rs.getString("CUSTNO") %>"/> --%>
					<%= rs.getString("custno") %>
				</td>
	<%
		  } catch (Exception e) {
		    e.printStackTrace();
		  } finally {
		    try {
		      if (rs != null) rs.close();
		      if (pstmt != null) pstmt.close();
		      if (con != null) con.close();
		    } catch (Exception e) { e.printStackTrace(); }
		  }
	%>
			</tr>
			<tr>
				<th>회원성명</th>
				<td>
					<input type="text" name = "name"/>
				</td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td>
					<input type="text" name = "phone"/>
				</td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td>
					<input type="text" name = "address"/>
				</td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td>
					<input type="text" name = "joinDate"/> 예)20151202
				</td>
			</tr>
			<tr>
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<td>
					<select name = "grade">
						<option value = none>선택</option>
						<option value = A>[A]VIP</option>
						<option value = B>[B]일반</option>
						<option value = c>[C]직원</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td>
					<input type="text" name = "cityCode"/>
				</td>
			</tr>
			<tr >
				<td colspan = "2">
					<input type = "submit" onclick = "chkForm()" value = "등록"/> 
					<input type = "button" onclick = "memberForm()" value = "조회"/>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>

