<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8" import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원 가입 하기</h1>
	<%
		/* 스크립트릿은 자바코드만 작성 가능하다. */
		request.setCharacterEncoding("utf-8");
		// Requestjoin.jsp의 입력된 정보를 Request 객체를 통해
		// 정보를 꺼내오세요.
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String passchk = request.getParameter("passchk");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String hobbyOne = ""; // 하나의 관심분야 담는 변수
		String[] hobby = request.getParameterValues("hobby");
		for(int i = 0; i<hobby.length; i++){
			hobbyOne += hobby[i] + " ";
		}
		String job = request.getParameter("job");
		String age = request.getParameter("age");
		String info = request.getParameter("info");
		
		
		
		
		// db 연동 시작 --------------------------------------------------------------
		
		Connection con = null;
		PreparedStatement pstmt = null;
		// select 문 담는 ResultSet객체 변수
		ResultSet rs = null;
		// id를 체크하는 체크키
		boolean idChk = false;
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
			// insert 쿼리문작성
			
			
			// 기존에 회원 id가 존재하면 "이미 존재하는 아이디 입니다" 창띄우기
			// -----------------------------------------------
			// select문 이용하기
			String chkSql = "select id from member where id=?";
			pstmt = con.prepareStatement(chkSql);
			pstmt.setString(1, id);
			// select문은 실행할때, 반드시 ResultSet객체에 담는다.
			rs = pstmt.executeQuery();
			
			// 현재 rs로 받아온 값이, 존재하는지 유무 if로 비교
			if(rs.next()){
				// rs.next()가 true이면, 이미 같은 id가 존재한다는 의미임
				idChk = true;
			}else{
				String sql = "insert into member values(?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
			
				// -----------------------------------------------
				// prepareStatement 객체에 setString(), setInt().. 메소드가 존재
				// set~()메소드는 sql문을 저장하겠다는 의미이다.
				// pstmt.setString(1, id) => 첫 번재 필드는 id이다
				// 단, 반드시 1부터 시작한다.
				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				pstmt.setString(3, email);
				pstmt.setString(4, tel);
				pstmt.setString(5, hobbyOne);
				pstmt.setString(6, job);
				pstmt.setString(7, age);
				pstmt.setString(8, info);
				
				// insert는 executeUpdate() 메소드를 이용하여 실행함
				// insert, delete, update쿼리는 executeUpdate()메소드를 이용하여 실행한다.
				// select는 => executeQuery()메소드를 이용하여 실행함
				//            단, select의 결과는 ResultSet 객체에 담는다.
	
				pstmt.executeUpdate();  // insert를 성공하면 1을 반환
			
			}
		}catch(Exception e){
			e.printStackTrace();
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
		
		
		
		
		// db 연동 종료 --------------------------------------------------------------
		
		String msg = " ";
		
		if(id == null || id.isEmpty()){
			msg = "아이디를 입력하세요";
		}else if(pass == null || pass.isEmpty()){
			msg = "비밀번호를 입력하세요";
		}else if(passchk == null || passchk.isEmpty()){
			msg = "비밀번호를 확인을 입력하세요";
		}else if(!pass.equals(passchk)){
			msg = "비밀번호가 틀립니다.";
		}else if(email == null || email.isEmpty()){
			msg = "이메일을 입력하세요";
		}else if(tel == null || tel.isEmpty()){
			msg = "전화번호를 입력하세요";
		}else if(hobby == null || hobby.length==0){
			msg = "관심분야를 한개 이상 입력하세요";
		}else if(job == null || job.isEmpty()){
			msg = "직업을 선택하세요";
		}else if(age == null || age.isEmpty()){
			msg = "연령을 선택하세요";
		}else if(idChk){
			msg = "이미 존재하는 아이디 입니다.";
		}
		
		// msg 예외처리
		if(msg != " "){
			
	%>

	
	<script type ="text/javascript">
		alert("<%= msg %>" );
		history.go(-1);
	</script>
	
	<% } else{
			
	   
	%>
	
	
	
	<%
		}
	%>
</body>
</html>