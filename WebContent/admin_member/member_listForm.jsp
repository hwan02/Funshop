<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Funshop_회원정보 관리</title>
</head>
<%--member_listForm.jsp--%>
<body>
	<center>
		<br>
		<h1>회원정보 관리 : 목록</h1>
		<hr class="container">
		<table cellpadding="5" class="table, container" >
			<thead>
				<tr bgcolor="skyblue">
					<th>번호</th>
					<th>회원 아이디</th>
					<th>회원 이름</th>
					<th>회원 이메일</th>
					<th>회원 폰 번호</th>
					<th>회원 주소</th>
					<th>회원 가입 일짜</th>
					<th>수정 및 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="member">
					<tr>
						<td>${member.no }</td>
						<td>${member.id }</td>
						<td>${member.name }</td>
						<td>${member.email }</td>
						<td>${member.phone }</td>
						<td>${member.addr }</td>
						<td>${member.wdate }</td>
						<td><a href="/Funshop/admin_member/memberEdit.do?no=${member.no }">수정 및 삭제</a> </td>
				</c:forEach>
			</tbody>
		</table>
<%-- 		<br>
		<br>

		<c:if test="${param.page==1 }">이전</c:if>
		<c:if test="${param.page>1 }">
			<a href="control?action=list&page=${param.page-1 }">이전</a>
		</c:if>

		<c:choose>
			<c:when test="${param.page==totalPage}">다음</c:when>
			<c:otherwise>
				<a href="control?action=list&page=${param.page+1 }">다음</a>
			</c:otherwise>
		</c:choose>
		<hr>
		<c:forEach begin="1" end="${totalPage }" var="i">
       [<a href="control?action=list&page=${i }">${i }</a>]
    </c:forEach> --%>
	</center>
</body>
</html>