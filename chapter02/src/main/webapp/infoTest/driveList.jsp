<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>driveList</title>
</head>
<body>
	<h3>주행내역조회</h3>
	<%
		request.setCharacterEncoding("utf-8");
		Connection con = null;
		PreparedStatement pstmt = null;
		// select 문 담는 ResultSet 객체 변수
		ResultSet rs = null;
		
		// DB 접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";
		// DB URL
		String url = "jdbc:mysql://localhost:3306/infotest?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1234";
	%>
	
	<table>
		<tr>
			<th>주행일자</th>
			<th>차량번호</th>
			<th>모델</th>
			<th>출발Km</th>
			<th>도착Km</th>
			<th>부서명</th>
			<th>주유금액</th>
		</tr>
		
		<%
			try{
				// 드라이버 로딩
				Class.forName(driver);
				// DB연결
				con = DriverManager.getConnection(url, user, password);
				// 가입한 회원 모든 정보 검색 select문 이용
				String sql = "SELECT * FROM tbl_drive inner join tbl_car on tbl_drive.car_no = tbl_car.car_no";
				pstmt = con.prepareStatement(sql);
				// resultSet 객체에 담기 => sql 문의 실험결과를 담는다.
				rs = pstmt.executeQuery();
				// 1개 이상이므로 반복문이 필요
				// rs에 담긴 정보를 추출하느 메소드 => rs.getString()
				while(rs.next()){
		%>
		
			<tr>
				<td><%= rs.getString("drv_date") %></td>
				<td><%= rs.getString("car_no") %></td>
				<td><%= rs.getString("car_model") %></td>
				<td><%= rs.getString("drv_start") %></td>
				<td><%= rs.getString("drv_end") %></td>
				<td><%= rs.getString("dept_code") %></td>
				<td><%= rs.getString("drv_money") %></td>
			</tr>		
		<% 
					
				}
				
			}catch(Exception e){
				e.printStackTrace();
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