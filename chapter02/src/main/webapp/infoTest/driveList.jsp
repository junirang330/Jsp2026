<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>driveList</title>
<link rel = "stylesheet" href="css/main_info.css">
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
		String url = "jdbc:mysql://localhost:3306/infoTest?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1234";
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sf02 = new SimpleDateFormat("yyyy년MM월dd일");
		// 숫자 세자리마다 콤마, 원 표시 출력
		DecimalFormat df = new DecimalFormat("#,##0");
		DecimalFormat df02 = new DecimalFormat("￦#,##0");
	%>
	
	<table  class="list">
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
				String sql = "select d.DRV_DATE, d.CAR_NO, C.CAR_MODEL, d.DRV_START, d.DRV_END, p.DEPT_NAME, d.DRV_MONEY from TBL_CAR c " 
						+ "inner join TBL_DRIVE d on d.CAR_NO = c.CAR_NO "
						+ "inner join TBL_DEPT p on d.DEPT_CODE = p.DEPT_CODE "
						+ "order by d.CAR_NO asc";
				pstmt = con.prepareStatement(sql);
				// resultSet 객체에 담기 => sql 문의 실험결과를 담는다.
				rs = pstmt.executeQuery();
				System.out.println("일치");
				System.out.println(sql);
				
				
				// 1개 이상이므로 반복문이 필요
				// rs에 담긴 정보를 추출하느 메소드 => rs.getString()
				while(rs.next()){
		%>
		
			<tr>
				<td><%= sf02.format(sf.parse(rs.getString("d.DRV_DATE"))) %></td>
				<td><%= rs.getString("d.CAR_NO") %></td>
				<td><%= rs.getString("c.CAR_MODEL") %></td>
				<td><%= df.format(rs.getInt("d.DRV_START")) %></td>
				<td><%= df.format(rs.getInt("d.DRV_END")) %></td>
				<td><%= rs.getString("p.DEPT_NAME") %></td>
				<td><%= df02.format(rs.getInt("d.DRV_MONEY")) %></td>
			</tr>		
		<% 
				System.out.println("일치2");		
				}
				
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("불일치");
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