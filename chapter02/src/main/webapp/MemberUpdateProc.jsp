<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String pass2 = request.getParameter("pass2");
		boolean passChk = false;
	
		String msg = null;
		// db 연동 시작 --------------------------------------------------------------
		Connection con = null;
		PreparedStatement pstmt = null;
		// select 문 담는 ResultSet객체 변수
		ResultSet rs = null;
		
		// 비밀번호 일치유무를 판단한다.
		if(pass2 == null || pass2.trim().isEmpty()){
			msg = "비밀번호를 입력하세요";
		}else if(email == null || email.trim().isEmpty()){
			msg = "이메일을 입력하세요";
		}else if(tel == null || tel.trim().isEmpty()){
			msg = "전환번호를 입력하세요";
		}
		
		// DB접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";  // JDBC 드라이버
		// DB URL(스키마 이름 : " jspdb")
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";  // DB 계정
		String password = "1234";  // DB 계정 비밀번호
		
		// DB는 네트워크의 톰켓서버를 통해 데이터가 전달되므로 개발자가 오류를 찾기 어렵다
		// 고로 try{}catch(){}문을 이용해 작성함이 원칙이다.
		// 암기 필요함
		
		try{
			// 드라이버 로딩
			Class.forName(driver);
			// DB연결
			con = DriverManager.getConnection(url, user, password);
			//가입한 회원 모든 정보 검색 select문 이용
			String sql = "select id from member where id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			// resultSet 객체에 담기 => sql문의 실험결과를 담는다.
			pstmt.setString(1, id);
			pstmt.setString(2, pass2);
			// select문은 ResultSet()객체에 담아라.
			rs = pstmt.executeQuery();
			System.out.println("2번, 요기까지 왔니?");
			
			// 비밀번호까지 확인이 끝난 경우,
			//  현재 rs는 id정보가 같은 한 사람의 정보만 가진다.
			if(rs.next()){
				// 자원반납 : 위의 조회때 사용한 pstmt를 반납해야 한다.
				pstmt.close();
				rs.close();
				// update 방식
				// update table set 수식(a=b) where 조건;
				String sql2 = "update member set email = ?, tel =? where id = ?";
				// 2) 비밀번호 확인이 종료되면 수정하기
				pstmt = con.prepareStatement(sql2);
				pstmt.setString(1, email);
				pstmt.setString(2, tel);
				pstmt.setString(3, id);
				
				// update, delete, insert 데이터 타입 : int를 반환한다.
				// update가 실행되면 1 / 실행되지 않으면 0
				int result = pstmt.executeUpdate();
				if(result>0){
					msg = "업데이트 성공";
					passChk = true;
				} else {
					msg = "수정 실패";
				}
			} else {
				msg = "비밀번호를 확인하세요";
				/* 회원정보 수정하는 스크립트 */
				%>
				<script type="text/javascript">
					history.go(-1);
				</script>
				<%
			}
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("3번, 요기까지 왔니?");
		}finally{
			if(rs!=null){
				try{
					rs.close();
				}catch(Exception e){}
			}
			if(con!=null){
				try{
					con.close();
				}catch(Exception e){}
			}
			if(pstmt!=null){
				try{
					pstmt.close();
				}catch(Exception e){}
			}
		}
		
	%>
	
	<script type="text/javascript">
			alert("<%= msg %>");
		
			<%if(passChk){%>
	 		location.href = "main.jsp?page=MemberList";
			<%}else{%>
			history.go(-1);		
			<%}	%>
	</script>
	
	
</body>
</html>