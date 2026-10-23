<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "db_conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량별주행조회</title>
<link rel ="stylesheet" href="css/main_info.css"/>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sf02 = new SimpleDateFormat("yyyy년MM월dd일");
		String carNo = request.getParameter("carNo");  // 선택하지 않은 처음은 null 이다.
	%>
	<h3>차량별주행조회</h3>
	<form name = "carForm" method = "get" action = "index.jsp" >
		<!-- 보이지 않는 방식으로 전달됨 -->
		<input type = "hidden" name = "page" value = "carDrive" />
		<select name = "carNo" class = "inputBox" text-align="center">
			<option>차량선택</option>
			<option value = "10가0001" <%= "10가0001".equals(carNo)?"selected":"" %>>[10가0001]</option>
			<option value = "10가0002" <%= "10가0002".equals(carNo)?"selected":"" %>>[10가0002]</option>
			<option value = "10가0003" <%= "10가0003".equals(carNo)?"selected":"" %>>[10가0003]</option>
			<option value = "10가0004" <%= "10가0004".equals(carNo)?"selected":"" %>>[10가0004]</option>
			<option value = "10가0005" <%= "10가0005".equals(carNo)?"selected":"" %>>[10가0005]</option>
		</select>
		<input type = "button" value = "조회" onclick ="chkform()" class = "inputBox"/>
	</form>
	<!-- null 처리하는 if문  -->
	<%
		if(carNo!=null && !carNo.isEmpty()){
			
		}
	%>
	<script type="text/javascript">
		function chkform(){
			let f = document.carForm;
			f.submit();
		}
	</script>
	
	<table class= "list">
		<tr>
			<th>주행일자</th>
			<th>출발Km</th>
			<th>도착Km</th>
			<th>운행거리</th>
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
				String sql = "select d.DRV_DATE, d.DRV_START, d.DRV_END, (d.DRV_END - d.DRV_START) as ch, "
						+ "p.DEPT_NAME, d.DRV_MONEY from TBL_DEPT p "
						+ "inner join TBL_DRIVE d on p.DEPT_CODE = d.DEPT_CODE "
						+ "where d.CAR_NO = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,carNo);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
		<tr>
			<td><%= sf02.format(sf.parse(rs.getString("d.DRV_DATE"))) %></td>
			<td><%= rs.getInt("d.DRV_START") %></td>
			<td><%= rs.getInt("d.DRV_END") %></td>
			<td><%= rs.getString("ch") %></td>
			<td><%= rs.getString("p.DEPT_NAME") %></td>
			<td><%= rs.getInt("d.DRV_MONEY") %></td>
		</tr>
		<%		}
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