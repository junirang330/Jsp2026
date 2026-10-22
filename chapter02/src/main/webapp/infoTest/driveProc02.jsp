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
		int drvStart = Integer.parseInt(request.getParameter("drvStart"));
		int drvEnd = Integer.parseInt(request.getParameter("drvEnd"));
		String deptCode = request.getParameter("deptCode");
		String drvMoney = request.getParameter("drvMoney");
		System.out.println("검사");
		
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

			String sql = "insert into TBL_DRIVE values(?,?,?,?,?,?)";
			// 연결 단계				
			pstmt = con.prepareStatement(sql);
			// pstmt 객체에, 입력받은 값을 하나씩 저장
			pstmt.setString(1, drvDate);
			pstmt.setString(2, carNo);
			pstmt.setInt(3, drvStart);
			pstmt.setInt(4, drvEnd);
			pstmt.setString(5, deptCode);
			pstmt.setInt(6, Integer.parseInt(drvMoney));
			pstmt.executeUpdate();
			System.out.println("확인1");
			%>
				<script type="text/javascript">
					alert("주문내역 정상 등록됨");
					location.href = "index.jsp";
				</script>
			<%
			
		}catch(Exception e){
			e.printStackTrace();
		
			%>
				<script type="text/javascript">
					alert("등록실패");
					history.go(-1);
				</script>
			<%
		}finally{
			if(con != null){
				try{con.close();}catch(Exception e){}
			}
			if(pstmt != null){
				try{pstmt.close();}catch(Exception e){}
			}
			/* if(rs != null){
				try{rs.close();}catch(Exception e){}
			} */
		}
		
		// db 종료 --------------------------------------------------
		
		%>
</body>
</html>