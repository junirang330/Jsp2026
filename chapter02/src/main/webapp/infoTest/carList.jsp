<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량조회</title>
</head>
<body>
	<h3>차량조회</h3>
	<%
		request.setCharacterEncoding("utf-8");
		Connection con = null;
		PreparedStatement pstmt = null;
		// select 문 담는 ResultSet 객체 변수
		ResultSet rs = null;
		// DB 접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";
		// DB URL(스키마 이름 : "infoTest")
		String url = "jdbc:mysql://localhost:3306/infoTest?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1234";
		
		// 자바에서 날짜 형식 변경하는 클래스
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sf02 = new SimpleDateFormat("yyyy년MM월dd일");
	%>
	<table width="700" border="1">
		<tr height = "40" align = "center">
			<th>차량번호</th>
			<th>모델</th>
			<th>제조사</th>
			<th>구매일</th>
		</tr>
		
	<%
		try{
			// 드라이버 로딩
			Class.forName(driver);
			// DB연결
			con = DriverManager.getConnection(url, user, password);
			// 가입한 회원 모든 정보 검색 select문 이용
			String sql = "select * from TBL_CAR";
			pstmt = con.prepareStatement(sql);
			// resultSet 객체에 담기 => sql 문의 실험결과를 담는다.
			rs = pstmt.executeQuery();
			// 1개 이상이므로 반복문이 필요
			// rs에 담긴 정보를 추출하느 메소드 => rs.getString()
			while(rs.next()){
	%>		
			<tr>
				<td height = "40" align = "center"><%= rs.getString("CAR_NO") %></td>
				<td height = "40" align = "center"><%= rs.getString("CAR_MODEL") %></td>
				<td height = "40" align = "center"><%= rs.getString("CAR_COMPANY") %></td>
				<!--
					format()는 Date형식이고, DB는 String이기 때문에
					parse() : String -> Date = > "20230101" => Date객체
					format() : Date -> String => Date객체 => "2023년01월01일"
				 -->
				
				<td height = "40" align = "center"><%= sf02.format(sf.parse(rs.getString("CAR_DATE"))) %></td>
			</tr>
	<%	
			}
		}catch(Exception e){
			e.printStackTrace();
			out.println("DB fail");
		}finally{
			if(rs!=null){
				try{
					rs.close();
				}catch(Exception e){}
			}
			if(con != null){
				try{
					con.close();
				}catch(Exception e){}
			}
			if(pstmt != null){
				try{
					pstmt.close();
				}catch(Exception e){}
			}
		}
	%>
		
	</table>
</body>
</html>