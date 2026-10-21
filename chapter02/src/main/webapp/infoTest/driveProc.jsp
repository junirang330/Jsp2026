<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/main_info.css"/>
</head>
<body>


	<%
		request.setCharacterEncoding("utf-8");
		
		String drvDate = request.getParameter("drvDate");
		String carNo = request.getParameter("carNo");
		String drvStart = request.getParameter("drvStart");
		String drvEnd = request.getParameter("drvEnd");
		String deptCode = request.getParameter("deptCode");
		String drvMoney = request.getParameter("drvMoney");
	
		// db 연동 시작----------------------------------------
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// ResultSet rs02 = null;
		// 주행일자와 차량번호를 체크하는 체크키
		boolean dateChk = false;
		// DB 접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";
		// DB URL
		String url = "jdbc:mysql://localhost:3306/infoTest?serverTimezone=UTC&useSSl=false";
		String user = "root";
		String password = "1234";
		
		try{
			// 드라이버 로딩
			Class.forName(driver);
			// DB 연결
			con = DriverManager.getConnection(url, user, password);
			
			// 기존에 주행일자 존재하면 "이미 등록된 주행일자입니다" 창띄우기
			// select문 이용하기
			String chkSql = "select drv_date from tbl_drive where drv_date=?";
			pstmt = con.prepareStatement(chkSql);
			pstmt.setString(1, drvDate);
			rs = pstmt.executeQuery();
				
			// select문은 실행할대, 반드시 ResultSet객체에 담는다
			// 현재 rs로 받아온 값이 존재하는지 유무 if로 비교
			if(rs.next()){
				dateChk = true;
			}else{
				String sql = "insert into tbl_drive values(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, drvDate);
				pstmt.setString(2, carNo);
				pstmt.setString(3, drvStart);
				pstmt.setString(4, drvEnd);
				pstmt.setString(5, deptCode);
				pstmt.setString(6, drvMoney);
				pstmt.executeUpdate();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(con != null){
				try{con.close();}catch(Exception e){}
			}
			if(pstmt != null){
				try{pstmt.close();}catch(Exception e){}
			}
			if(rs != null){
				try{rs.close();}catch(Exception e){}
			}
		}
		
		
		
		// db 종료 --------------------------------------------------
		
		
		
		String msg =" ";
		/* 예외처리 */
		if(drvDate == null || drvDate.isEmpty()){
			msg = "주행일자가 입력되지 않았습니다!";
		}else if(carNo == null || carNo.isEmpty()){
			msg = "차량번호가 입력되지 않았습니다!";
		}else if(drvStart == null || drvStart.isEmpty()){
			msg = "출발Km가 입력되지 않았습니다!";
		}else if(drvEnd == null || drvEnd.isEmpty()){
			msg = "도착Km가 입력되지 않았습니다!";
		}else if(deptCode.equals("none") || deptCode.isEmpty()){
			msg = "부서코드가 선택되지 않았습니다!";
		}else if(drvMoney == null || drvMoney.isEmpty()){
			msg = "주유금액이 입력되지 않았습니다!";
		}
		
		if(msg != " "){
		
		
	%>
	<script type="text/javascript">
		alert("<%= msg%>");
		history.go(-1);
	</script>
	
	<% 
		} else{
			msg = "주행내역이 정상적으로 등록되었습니다";
	%>
		
		<script type="text/javascript">
			alert("<%= msg%>");
			history.go(-2);
		</script>

	
	<% 
			
		} %>
</body>
</html>