<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "db_conn.jsp" %>
<jsp:include page="header.jsp" />
<section>
	<h2>회원등록조회/수정</h2>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>회원전화</th>
			<th>회원주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
		<tr>
		<%
			String grade = "";
			String gradeName = "";
			
			try{
				Class.forName(driver);
				con = DriverManager.getConnection(url, user, password);
				
				String sql = "select * from member_tbl_02";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery(); // 지금현재 커서 위치 : 값이 존재하는 부분앞에 위치
				
			/* 	System.out.println("====================");
				System.out.println(rs.getInt("custno")); */
				
				while(rs.next()){
					grade = rs.getString("grade");
					if(grade.equals("A")) gradeName = "VIP";
					else if(grade.equals("B")) gradeName = "일반";
					else gradeName = "직원";
		%>		
					<!-- 반복문 안에 tr/td 넣기 -->
					<!-- 회원번호는, 수정화면으로 이동할때, 회원번호를 get방식으로 떠넘겨줘야 한다. -->
					<!-- get방식 이동할페이지이름 ? 변수 = 필드명 -->
					<tr>
						<td><a class = "list" href="modForm.jsp?custno=<%= rs.getInt("custno") %>"><%= rs.getInt("custno")%></a></td>
						<td><%= rs.getString("custname") %></td>
						<td><%= rs.getString("phone") %></td>
						<td><%= rs.getString("address") %></td>
						<td><%= rs.getString("joindate") %></td>
						<td><%= gradeName %></td>
						<td><%= rs.getString("city") %></td>
					</tr>	
		<%		}
				
			}catch(Exception e){
				
			}finally{
				try{
					if(rs!=null)rs.close();
					if(con!=null)rs.close();
					if(pstmt!=null)pstmt.close();
				}catch(Exception e){e.printStackTrace();}
			}
		
		%>
		</tr>	
	</table>
	


</section>

<jsp:include page="footer.jsp" />