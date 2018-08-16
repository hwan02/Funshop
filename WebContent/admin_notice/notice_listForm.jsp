<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Funshop_공지사항</title>
</head>
<%--list.jsp --%>
<body>
	<center>
		<br>
		<h1>공지사항 : 목록</h1>
		<hr class="container">
		<a href="/Funshop/admin_notice/notice.do">공지사항 작성</a>
		<br>
		<br>
		<table cellpadding="5" class="table, container" >
			<thead>
				<tr bgcolor="skyblue">
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
					<th>수정 및 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="notice">
					<tr>
						<td>${notice.no }</td>
						<td>${notice.write }</td>
						<td>${notice.contents }</td>
						<td><fmt:formatDate value="${notice.wdate }"
								pattern="yyyy-MM-dd" /></td>
						<td><a href="/Funshop/admin_notice/noticeEdit.do?no=${notice.no }">수정 및 삭제</a> </td>
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





