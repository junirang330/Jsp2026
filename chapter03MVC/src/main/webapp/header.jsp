<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<header>
		<div class="headerWrap">
			<table width="1000" id="navi">
				<tr heigth="70">
					<td colspan="4" align="left">
						<a href="index.jsp">
							<img alt="로고" src="img/sk_logo.png" height="65"/>
						</a>
					</td>
				</tr>
				<tr height="50">
					<td align="center" width="200">
						<a href="#" class="nav">예약하기</a>
					</td>
					<td align="center" width="200">
						<a href="#" class="nav">예약확인</a>
					</td>
					<td align="center" width="200">
						<a href="#" class="nav">게시판</a>
					</td>
					
					<c:choose>
						<c:when test="${not empty sessionScope.id }">
						  	<c:choose>	
						  		<c:when test="${sessionScope.id == 'admin' }">
									<td align="center" width="200">
										<a href="MemberListCon.do" class="nav">회원관리</a>
									</td>
								</c:when>
								<c:otherwise>
									<td align="center" width="200">
										<a href="Mypage.do" class="nav">MyPage</span>
									</td>
								</c:otherwise>
							</c:choose>
							<td align="center" width="200">
									<span class="nav">${sessionScope.id }님</span>
							</td>
							<td align="center" width="200">
								<a href = "logoutProc.do"class="nav">로그아웃</a>
							</td>
						</c:when>
					
						<c:otherwise>
							<td align="center" width="200">
								<a href="index.jsp?section=member/MemberJoin.jsp" class="nav">회원가입</a>
							</td>
							<td align="center" width="200">
								<a href="index.jsp?section=login/loginForm.jsp" class="nav">로그인</a>
							</td>
						</c:otherwise>
					</c:choose>
					
				</tr>
			</table>
		</div>
	</header>
