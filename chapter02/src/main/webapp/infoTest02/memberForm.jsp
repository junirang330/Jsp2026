<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회</title>
<link rel = "stylesheet" href = "css/main.css"/>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
	%>
	

	<h2>회원목록조회/수정</h2>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
		<%
			try {
				// 드라이버 로딩
				Class.forName(driver);
				// DB연결
				con = DriverManager.getConnection(url, user, password);
				// 가입한 회원 모든 정보 검색 select문 이용
				String sql = "select * from member_tbl_02";
				pstmt = con.prepareStatement(sql);
				// resultSet 객체에 담기 => sql 문의 실험결과를 담는다.
				rs = pstmt.executeQuery();
				System.out.println("회원조회시작  -- 1  ");
				
				while(rs.next()){
		%>
					<tr>
						<td><a href ="modForm.jsp"><%= rs.getString("custno") %></a></td>
						<td><%= rs.getString("custname") %></td>
						<td><%= rs.getString("phone") %></td>
						<td><%= rs.getString("address") %></td>
						<td><%= rs.getString("joindate") %></td>
						<td><% if(rs.getString("grade").equals("A")){ %>
									VIP
							<% }else if(rs.getString("grade").equals("B")){ %>	
									일반
							<% }else if(rs.getString("grade").equals("C")){ %>
									직원
							<% } %>
						</td>
						<td><%= rs.getString("city") %></td>
					</tr>		
					
					
		<%		}
			    
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
		
		<tr>
		</tr>
	</table>
</body>
</html>