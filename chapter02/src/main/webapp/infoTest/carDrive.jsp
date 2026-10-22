<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량별주행조회</title>
</head>
<body>
	<h2>차량별주행조회</h2>
	<%
		request.setCharacterEncoding("utf-8");
		String tmp = "2";
	%>
	<form name = "carForm" method = "post" action = "index.jsp?page=carDrive">
		<select name = "select">
			<option value = none>차량선택</option>
		<%
			try{
				// 드라이버 로딩
				Class.forName(driver);
				// DB연결
				con = DriverManager.getConnection(url, user, password);
				// 가입한 회원 모든 정보 검색 select문 이용
				String sql = "select CAR_NO, CAR_MODEL from TBL_CAR";
				pstmt = con.prepareStatement(sql);
				// resultSet 객체에 담기 => sql 문의 실험결과를 담는다.
				rs = pstmt.executeQuery();
				System.out.println("일치");
				System.out.println(sql);
					System.out.println("test");
				
				while(rs.next()){
		%>
			<option value = "<%=rs.getString("CAR_NO")%>"> [<%=rs.getString("CAR_NO")%>] <%= rs.getString("CAR_MODEL")%></option>
			
		<%		
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
		</select>
		
		
		<button type = "submit" onclick ="infos()">
			<input type = "hidden" name="pages" value ="car"/>조회
		</button>
		
	</form>
		
		<script type="text/javascript">
			function infos(){
				alert("test");
				let f = document.carForm;
				// f.select.value = tmp;
				f.submit();
			}
		</script>
	
	<table>
		<tr>
			<th>주행일자</th>
			<th>출발Km</th>
		</tr>
		<%
	try{
		// 가입한 회원 모든 정보 검색 select문 이용
		String sql = " select sum(d.DRV_END-d.DRV_START) as t, sum(d.DRV_MONEY) as m from TBL_DRIVE d inner join TBL_DEPT p on d.DEPT_CODE = p.DEPT_CODE group by d.CAR_NO";
		pstmt = con.prepareStatement(sql);
		// resultSet 객체에 담기 => sql 문의 실험결과를 담는다.
		rs = pstmt.executeQuery();
		while(rs.next()){
	%>
		<tr>
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