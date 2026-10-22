<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서별 주행통계</title>
<link rel = "stylesheet" href="css/main_info.css">
</head>
<body>
	<h2>(부서별) 주행통계</h2>
	<%
		request.setCharacterEncoding("utf-8");
		/* Connection con = null;
		PreparedStatement pstmt = null;
		// select 문 담는 ResultSet 객체 변수
		ResultSet rs = null;
		
		// DB 접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";
		// DB URL
		String url = "jdbc:mysql://localhost:3306/infoTest?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1234";

		// 숫자 세자리마다 콤마, 원 표시 출력
		DecimalFormat df = new DecimalFormat("#,##0");
		DecimalFormat df02 = new DecimalFormat("￦#,##0"); */
	%>
	
	<table class="list">
		<tr>
			<th>부서코드</th>
			<th>부서명</th>
			<th>총운행거리</th>
			<th>총주유금액</th>
		</tr>
		
		<%
			try{
				// 드라이버 로딩
				Class.forName(driver);
				// DB연결
				con = DriverManager.getConnection(url, user, password);
				// 가입한 회원 모든 정보 검색 select문 이용
				String sql = " select p.DEPT_CODE, p.DEPT_NAME, sum(d.DRV_END-d.DRV_START) as t, sum(d.DRV_MONEY) as m  from TBL_DRIVE d"
						 + " inner join TBL_DEPT p on d.DEPT_CODE = p.DEPT_CODE "
						 + "group by p.DEPT_CODE";
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
				<td><%= rs.getString("p.DEPT_CODE") %></td>
				<td><%= rs.getString("p.DEPT_NAME") %></td>
				<td><%= rs.getInt("t") %></td>
				<td><%= df02.format(rs.getInt("m")) %></td>
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