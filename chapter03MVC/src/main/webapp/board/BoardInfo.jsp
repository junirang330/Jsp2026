<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel = "stylesheet" href="style/boardwrite.css">
<div class="boardwrap">
    <h2>게시글 보기</h2>
    <table width="600" border="1">
        <tr height="40">
            <td align="center" width="120">글번호</td>
            <td align="center" width="180">${bdto.num }</td>
            <td align="center" width="120">조회수</td>
            <td align="center" width="180">${bdto.readcount }</td>
        </tr>
        <tr height="40">
            <td align="center" width="120">작성자</td>
            <td align="center" width="180">${bdto.writer }</td>
            <td align="center" width="120">작성일</td>
            <td align="center" width="180">${bdto.reg_date}</td>
        </tr>
        <tr height="40">
            <td align="center" width="120">이메일</td>
            <td align="center" colspan="3">${bdto.email}</td>
        </tr>
        <tr height="40">
            <td align="center" width="120">제목</td>
            <td align="center" colspan="3">${bdto.subject}</td>
        </tr>
        <tr height="80">
            <td align="center" width="120">글내용</td>
            <td align="center" colspan="3">${bdto.content}</td>
        </tr>
        <tr height="40">
            <td align="center" colspan="4">
            	<%--로그인된 사태 관리자이면 [답글쓰기] 버튼출력, 단 수정/삭제 버튼은 출력되면 안됨
            	개인이 볼 수 있는 것은 목록보기만 출력되어야 한다. --%>
                <%-- 데이터를 읽어들여야 하기 때문에 servlet인 ~.do로 먼저 넘겨주고 다시 view-JSP파일로 넘겨주어야 함을 주의하자 --%>
                <c:if test = "${sessionScope.id eq 'admin'}">
	                <input type="button" value="답글쓰기" onclick="location.href='BoardReWriterCon.do?num=${bdto.num}&ref=${bdto.ref}&re_step=${bdto.re_step}'">
                </c:if>
                <%-- 1.관리자가 아니면서 일반 회원인 경우만 수정/삭제하기 버튼 보이기 --%>
                <c:if test = "${sessionScope.id ne 'admin' && not empty sessionScope.id}">
	                <input type="button" value="수정하기" onclick="location.href='BoardUpdateCon.do?num=${bdto.num}'">
	                <input type="button" value="삭제하기" onclick="location.href='BoardDeleteCon.do?num=${bdto.num}'">
                </c:if>
                <%-- 아무나 다 볼 수 있는 목록보기는 if문 하지 않는다. --%>
                <%-- 회원/비회원 모두 보기 가능 --%>
                <input type="button" value="목록보기" onclick="location.href='BoardListCon.do'">
            </td>
        </tr>
    </table>
</div>