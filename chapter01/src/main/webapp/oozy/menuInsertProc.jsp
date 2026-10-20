<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>


	<%
		request.setCharacterEncoding("utf-8");
		String menuName = request.getParameter("menuName");
		String menuSort = request.getParameter("menuSort");
		String menuPrice = request.getParameter("menuPrice");
		String menuStat = request.getParameter("menuStat");
		String menuDesc = request.getParameter("menuDesc");
	
		String msg = " ";		
		
		/* 예외처리 */
		if(menuName == null || menuName.isEmpty()){
			msg = "메뉴명이 입력되지 않았습니다!";
		}else if(menuSort.equals("none") || menuSort.isEmpty()){
			msg = "분류가 선택되지 않았습니다!";
		}else if(menuPrice == null || menuPrice.isEmpty()){
			msg = "가격이 입력되지 않았습니다!";
		}else if(menuStat == null || menuStat.isEmpty()){
			msg = "판매상태가 선택되지 않았습니다!";
		}else if(menuDesc == null || menuDesc.isEmpty()){
			msg = "설명이 입력되지 않았습니다!";
		}
		
		if(msg!=" "){
	%>

	<script type="text/javascript">
		alert("<%=msg%>");
		history.go(-1);
	</script>	
	
	<% }else{ %>
	
	<h2>메뉴등록 확인</h2>
	<table class="certify">
		<tr>
			<td>메뉴명</td>
			<td><%=menuName %></td>
		</tr>
		<tr>
			<td>분류</td>
			<td><%=menuSort %></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><%=menuPrice %></td>
		</tr>
		<tr>
			<td>판매상태</td>
			<td><%=menuStat %></td>
		</tr>
		<tr>
			<td>설명</td>
			<td><%=menuDesc %></td>
		</tr>
	</table>
	<% } %>
