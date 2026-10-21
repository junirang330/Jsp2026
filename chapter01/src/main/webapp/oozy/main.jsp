<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OOZY COFFEE</title>
<!-- main.jsp의 head 영역 -->
<link rel="stylesheet" href="css/coffee.css?v=2">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String contentPage = "home.jsp";  // 기본 페이지 : 홈
		String pages = request.getParameter("page");  // nav에서 정보 request로 받아온다
		//String enrolls = request.getParameter("enroll");
		
		if("menuList".equals(pages)){
			contentPage = "menuList.jsp";
		}else if("menuInsert".equals(pages)){
			contentPage = "menuInsert.jsp";
		}else if("menuInsertProc".equals(pages)){
			contentPage = "menuInsertProc.jsp";
		}
		
		
	
	%>

	<!--header를 include로 불러오기  -->
	<%@ include file = "header.jsp" %>
	<!--nav를 include로 불러오기  -->
	<%@ include file = "nav.jsp" %>
	<!-- section (action으로 불러오기) -->
	<section>
		<jsp:include page="<%=contentPage %>"></jsp:include>
	</section>
	<!--footer를 include로 불러오기  -->
	<%@ include file = "footer.jsp" %>
</body>
</html>