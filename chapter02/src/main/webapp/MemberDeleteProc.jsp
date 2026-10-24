<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pass3 = request.getParameter("pass3");
		boolean passChk = false;
	
		String msg = null;
		// db 연동 시작 --------------------------------------------------------------
		Connection con = null;
		PreparedStatement pstmt = null;
		// select 문 담는 ResultSet객체 변수
		ResultSet rs = null;
		
		System.out.println("2-----");
		// DB접속 정보 설정
		String driver = "com.mysql.cj.jdbc.Driver";  // JDBC 드라이버
		// DB URL(스키마 이름 : " jspdb")
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";  // DB 계정
		String password = "1234";  // DB 계정 비밀번호
		
		
		// 비밀번호 일치유무를 판단한다.
		if(pass3 == null || pass3.trim().isEmpty()){
			msg = "비밀번호를 입력하세요";
		}else{		
		try{
			// 드라이버 로딩
			Class.forName(driver);
			// DB연결
			con = DriverManager.getConnection(url, user, password);
			//가입한 회원 모든 정보 검색 select문 이용
			String sql = "select id, pass from member where id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			// resultSet 객체에 담기 => sql문의 실험결과를 담는다.
			pstmt.setString(1, id);
			pstmt.setString(2, pass3);
			// select문은 ResultSet()객체에 담아라.
			rs = pstmt.executeQuery();
			
		
			if(rs.next()){
				// 자원반납 : 위의 조회때 사용한 pstmt를 반납해야 한다.
				System.out.println("5번");
			    pstmt.close();
				rs.close(); 
				
				String sql2 = "delete from member where id=?";
				pstmt = con.prepareStatement(sql2);
				// 2) 비밀번호 확인이 종료되면 수정하기
				pstmt.setString(1, id);			 
				// update, delete, insert 데이터 타입 : int를 반환한다.
				// update가 실행되면 1 / 실행되지 않으면 0
				msg = "실패";
				int result = pstmt.executeUpdate();
				if(result>0){
					msg = "명단 삭제 성공";
					passChk = true;
				} else {
					msg = "삭제 실패";
				}
			} else {
				msg = "비밀번호를 확인하세요";
			}
			
		}catch(Exception e){
			e.printStackTrace();
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