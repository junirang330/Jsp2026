<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>개인 회원 정보</title>
</head>
<body>
	<h2>회원 상세 정보</h2>
	
	<%
		request.setCharacterEncoding("utf-8");
		// MemberList에서 get방식으로 id 받아오기
		String id = request.getParameter("id");
		Connection con = null;
		PreparedStatement pstmt = null;
		// select 문 담는 ResultSet객체 변수
		ResultSet rs = null;
		
		// DB접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";  // JDBC 드라이버
		// DB URL(스키마 이름 : " jspdb")
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";  // DB 계정
		String password = "1234";  // DB 계정 비밀번호
	%>	
		<table width = "700" border = "1">
			
			<%
				try{
					// 드라이버 로딩
					Class.forName(driver);
					// DB연결
					con = DriverManager.getConnection(url, user, password);
					
					
					// 한명에 관련된 자료만 select문으로 검색
					String sql = "select * from member where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
				
					// resultSet 객체에 담기 => sql문의 실험결과를 담는다.
					rs = pstmt.executeQuery();
					// rs의 데이터가 1개 이상이므로 반복문이 필요
					// rs에 담긴 정보를 추출하는 메소드 => rs.getString()
					if(rs.next()){
						
			%>
				<!-- select문으로 검색한 정보가 출력되는 <tr></tr>필요 -->
				<tr align = "center">
					<td>아이디</td>
					<td><%= rs.getString("id") %></td>
				</tr>
				<tr align = "center">
					<td>이메일</td>
					<td><%= rs.getString("email") %></td>
				</tr>
				<tr align = "center">
					<td>전화번호</td>
					<td><%= rs.getString("tel") %></td>
				</tr>
				<tr align = "center">
					<td>관심분야</td>
					<td><%= rs.getString("hobby") %></td>
				</tr>
				<tr align = "center">
					<td>직업</td>
					<td><%= rs.getString("job") %></td>
				</tr>
				<tr align = "center">
					<td>연령</td>
					<td><%= rs.getString("age") %></td>
				</tr>
				<tr align = "center">
					<td>남기는 말</td>
					<td><%= rs.getString("info") %></td>
				</tr>
				<tr align = "center">
					<td colspan="2" align="center">
						<button onclick ="location.href='main.jsp?page=MemberUpdateForm&id=<%= rs.getString("id") %>'">회원수정</button>
						<button onclick ="location.href='main.jsp?page=MemberDeleteForm&id=<%= rs.getString("id") %>'">회원삭제</button>
						<button onclick ="location.href='main.jsp?page=MemberList'">목록보기</button>
						<button onclick ="location.href='main.jsp?page=MemberJoin'">회원가입</button>
					</td>						
				</tr>
			</table>
					<a href = "main.jsp?page=MemberList">회원 목록으로</a>
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

</body>
</html>