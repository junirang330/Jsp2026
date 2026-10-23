<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import ="java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원 전체 목록보기</title>
</head>
<body>
	<h2>가입한 회원 전체목록</h1>
	<%
		request.setCharacterEncoding("utf-8");
		Connection con = null;
		PreparedStatement pstmt = null;
		// select 문 담는 ResultSet객체 변수
		ResultSet rs = null;
		// id를 체크하는 체크키
		int count = 0;
		// DB접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";  // JDBC 드라이버
		// DB URL(스키마 이름 : " jspdb")
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";  // DB 계정
		String password = "1234";  // DB 계정 비밀번호
	%>	
		
		<table width = "700" border = "1">
			<tr height = "50" align = "center">
				<td>번호</td>
				<td>아이디</td>
				<td>이메일</td>
				<td>전화번호</td>
				<td>관심분야</td>
				<td>직업</td>
				<td>연령</td>
				<td>남기는 말</td>
				<td>상세보기</td>
			</tr>
			<%
				try{
					// 드라이버 로딩
					Class.forName(driver);
					// DB연결
					con = DriverManager.getConnection(url, user, password);
					//가입한 회원 모든 정보 검색 select문 이용
					String sql = "select * from member";
					pstmt = con.prepareStatement(sql);
					// resultSet 객체에 담기 => sql문의 실험결과를 담는다.
					rs = pstmt.executeQuery();
					// rs의 데이터가 1개 이상이므로 반복문이 필요
					// rs에 담긴 정보를 추출하는 메소드 => rs.getString()
					while(rs.next()){
						count++;
			%>
				<!-- select문으로 검색한 정보가 출력되는 <tr></tr>필요 -->
				<tr height = "50" align = "center">
					<td><%= count %></td>
					<td><%= rs.getString("id") %></td>
					<td><%= rs.getString("email") %></td>
					<td><%= rs.getString("tel") %></td>
					<td><%= rs.getString("hobby") %></td>
					<td><%= rs.getString("job") %></td>
					<td><%= rs.getString("age") %></td>
					<td><%= rs.getString("info") %></td>
					<!-- get방식으로 MemberDetail.jsp에 id를 떠넘겨야 한다. -->
					<!-- get방식으로 데이터를 넘길때, 조건이 여러개인 경우 : (main.jsp?조건&조건&조건) 방식-->
					<td><a href = "main.jsp?page=MemberDetail&id=<%= rs.getString("id") %>">상세보기</a></td>
				</tr>			
			
			
			<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					if(rs != null) {try{rs.close();}catch(Exception e){}}
					if(con != null) {try{con.close();}catch(Exception e){}}
					if(pstmt != null) {try{pstmt.close();}catch(Exception e){}}
				}
			%>	
		
		
		</table>
		
		<a href = "main.jsp?page=MemberJoin">회원가입으로 가지</a>
		
	
	
			

	
</body>
</html>