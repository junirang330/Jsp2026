<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 로그인 Proc</title>
</head>
<body>

	<!-- EL 표현식으로 구현 -->
	<!-- EL => ${} : 자바의 변수를 그대로 호출하여 사용할 수 없다.
		 requuest.setAttribute("변수이름 작명", value);
		 ${param.input태그의 name값을 가져올 수 있다.}
		 String id = request.getParameter("id")는 EL표현식의
		 ${param.id}와 같은 의미이다.	
	-->
	<p>${param.id}</p>
	<p>아이디 :${param.id}</p>
	<p>아이디 :${param.pass}</p>
	
	
</body>
</html>