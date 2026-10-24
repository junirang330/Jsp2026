<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록 proc</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		int number = Integer.parseInt(request.getParameter("number"));
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joinDate = request.getParameter("joinDate");
		String grade = request.getParameter("grade");
		String cityCode = request.getParameter("cityCode");
		System.out.println("1단계---------");
		try{
			// 드라이버 로딩
			Class.forName(driver);
			// DB연결
			con = DriverManager.getConnection(url, user, password);
			// insert 쿼리문작성
			boolean nameChk = false;
			System.out.println("2단계---------");
			
			// 기존에 회원 id가 존재하면 "이미 존재하는 아이디 입니다" 창띄우기
			// -----------------------------------------------
			// select문 이용하기
			String chkSql = "select custname from member_tbl_02 where custname=?";
			pstmt = con.prepareStatement(chkSql);
			pstmt.setString(1, name);
			// select문은 실행할때, 반드시 ResultSet객체에 담는다.
			rs = pstmt.executeQuery();
			
			// 현재 rs로 받아온 값이, 존재하는지 유무 if로 비교
			if(rs.next()){
				// rs.next()가 true이면, 이미 같은 id가 존재한다는 의미임
				nameChk = true;
				System.out.println("3단계---------");
			}else{
				String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, number);
				pstmt.setString(2, name);
				pstmt.setString(3, phone);
				pstmt.setString(4, address);
				pstmt.setString(5, joinDate);
				pstmt.setString(6, grade);
				pstmt.setString(7, cityCode);
				
				pstmt.executeUpdate();  // insert를 성공하면 1을 반환
			
				System.out.println("4단계---------");
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("catch 예외단계 ---------");
		}finally{
			// 자원해제는 반드시 작성할 것
			if(pstmt != null){
				try{
					pstmt.close();
				}catch(Exception e){}
			}
			if(con != null){
				try{
					con.close();
				}catch(Exception e){}
			}
			if(rs != null){
				try{
					rs.close();
				}catch(Exception e){}
			}
		}
		
				System.out.println("5단계---------");
		
		
		String msg = null;
		/* 예외처리 */
		if(name == null || name.trim().isEmpty()){
			msg = "회원성명이 입력되지 않았습니다!";
		}else if(phone == null || phone.trim().isEmpty()){
			msg = "회원전화가 입력되지 않았습니다!";
		}else if(address == null || address.trim().isEmpty()){
			msg = "회원주소가 입력되지 않았습니다!";
		}else if(joinDate == null || joinDate.trim().isEmpty()){
			msg = "가입일자가 입력되지 않았습니다!";
		}else if(grade == null || grade.trim().isEmpty()){
			msg = "고객등급이 선택되지 않았습니다!";
		}else if(cityCode == null || cityCode.trim().isEmpty()){
			msg = "도시코드가 입력되지 않았습니다!";
		}
		
			// msg 예외처리
			if(msg != " "){
			%>
			<script type ="text/javascript">
				alert("<%= msg %>" );
				history.go(-1);
			</script>
			
			<% } else{%>
			<% } %>
	

</body>
</html>