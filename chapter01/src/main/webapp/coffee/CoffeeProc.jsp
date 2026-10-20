<%@page import="java.text.DecimalFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문계산 결과처리</title>
</head>
<body>
<!-- 스크립트릿은 모두 자바이다. -->
	<%
		request.setCharacterEncoding("utf-8");
		// 세자리마다 콤마 출력하는 DecimalFormat 객체를 인스턴스한다.
		DecimalFormat de = new DecimalFormat("#,##0");
		
		String type = request.getParameter("type");
		// Request 객체는 반환타입이 String이므로 정수타입으로 변환 불가능
		// 정수타입으로 반환받으려면, 파싱한다.
		
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int price = 0;  // 각 커피메뉴 가격 담을 변수
		int total = 0;  // 총 주문 금액 변수
		
		int money = Integer.parseInt(request.getParameter("money"));
		
		if(type.equals("아메리카노")){
			price = 3000;
		}else if(type.equals("카페라떼")){
			price = 3300;
		}else if(type.equals("에스프레소")){
			price = 2500;
		}else if(type.equals("얼그레이티")){
			price = 3500;
		}
		
		total = quantity * price;
	%>
	<h2>주문계산 결과</h2>
	<ul>
		<li>커피종류 : <%=type %></li>
		<li>1개 가격 : <%= de.format(price) %>원</li>
		<li>수량 : <%=de.format(quantity) %></li>
		<li>총 금액 : <%= de.format(total) %>원</li>
		<li>입금액 : <%=de.format(money) %>원</li>
		<li>거스름돈 : <%= de.format(money - total) %>원</li>
		
	</ul>

</body>
</html>