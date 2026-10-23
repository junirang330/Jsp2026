<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>companyStat</title>
<link rel ="stylesheet" href="css/main_info.css"/>
</head>
<body>
	<table class="list">
	<h3 text-align = "center">(제조자별) 주행통계</h3>
		<tr>
			<th>제조사</th>
			<th>차량수</th>
			<th>총운행거리</th>
			<th>총주유금액</th>
		</tr>
		<tr>
		
	
	<%
	try{
		// 드라이버 로딩
		Class.forName(driver);
		// DB연결
		con = DriverManager.getConnection(url, user, password);
		// 가입한 회원 모든 정보 검색 select문 이용
		String sql = "select c.CAR_COMPANY, count(distinct c.CAR_DATE) as cnt, "  
					+ "sum(d.DRV_END-d.DRV_START) as t, sum(d.DRV_MONEY) as m "
					+ "from TBL_CAR c inner join TBL_DRIVE d on c.CAR_NO = d.CAR_NO "
					+ "group by c.CAR_COMPANY";
		pstmt = con.prepareStatement(sql);
		// resultSet 객체에 담기 => sql 문의 실험결과를 담는다.
		rs = pstmt.executeQuery();
		while(rs.next()){
	%>
			<td><%= rs.getString("c.CAR_COMPANY") %></td>
			<td><%= rs.getString("cnt") %></td>
			<td><%= rs.getString("t") %></td>
			<td><%= rs.getString("m") %></td>
		</tr>
	<%	}
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