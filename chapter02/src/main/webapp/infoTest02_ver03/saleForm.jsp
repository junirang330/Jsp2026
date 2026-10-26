<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "db_conn.jsp" %>

<jsp:include page = "header.jsp"/>
<section>
	<h2>회원매출조회</h2>
	<table class = "form">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
		
		<%
			request.setCharacterEncoding("utf-8");
			String grade = "";
			String gradeName = "";
			
			try{
				Class.forName(driver);
				con = DriverManager.getConnection(url, user, password);
				String sql = "select me.custno, me.custname, me.grade, "
						+ "sum(mo.price) as total from member_tbl_02 me "
						+ "inner join money_tbl_02 mo on me.custno = mo.custno " 
						+ "group by me.custno order by total desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					grade = rs.getString("me.grade");
					if(grade.equals("A")) gradeName = "VIP";
					else if(grade.equals("B")) gradeName = "일반";
					else gradeName = "직원";
		%>
		<tr>
			<td><%=rs.getInt("me.custno")%></td>
			<td><%=rs.getString("me.custname")%></td>
			<td><%=gradeName%></td>
			<td><%=String.format("￦%,d", rs.getInt("total")) %></td>
		</tr>
		<%			
				}
			}catch(Exception e){
				e.printStackTrace();		
			}finally{
				if(rs!=null)rs.close();
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			}
		
		
		
		%>
	
	
	</table>
</section>
<jsp:include page = "footer.jsp"/>