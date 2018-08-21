<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="icon" href="/Funshop/image/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Funshop_공지사항</title>
<style type="text/css">
   a:hover {color:red; text-decoration: none;}
</style>
<script type="text/javascript">
	$(function() {
		$("input").keyup(function() {
			var search = $(this).val().toUpperCase();
			$("#tbody tr").filter(function() { //모든 tr
				var txt = $(this).text().toUpperCase();
				$(this).toggle(txt.indexOf(search) > -1);
			});
		});
	});//document.ready
</script>
</head>
</head>
<%--list.jsp --%>
<body>
	<center>
		<br>
		<a href="/Funshop/admin_main/main_view.do"><h1>공지사항 : 목록</h1></a>
		<hr class="container">
		<a href="/Funshop/admin_notice/notice.do">공지사항 작성</a>
		<br><br>
		<input type="search" placeholder="검색" >
		<br><br>
		<table cellpadding="5" class="table, container">
			<thead>
				<tr bgcolor="skyblue">
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
					<th>수정 및 삭제</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${list }" var="notice">
					<tr>
						<td>${notice.no }</td>
						<td>${notice.write }</td>
						<td>${notice.contents }</td>
						<td><fmt:formatDate value="${notice.wdate }"
								pattern="yyyy-MM-dd" /></td>
						<td><a
							href="/Funshop/admin_notice/noticeEdit.do?no=${notice.no }">수정
								및 삭제</a></td>
				</c:forEach>
			</tbody>
		</table>
		<br><br>
	<%-- 	<c:choose>
      <c:when test="${param.page==totalPage}">다음</c:when>
      <c:otherwise>
        <a href="/Funshop/admin_notice/noticeList.do?action=list&page=${param.page+1 }">다음</a>
      </c:otherwise>
    </c:choose> --%>
		<hr class="container">
<%-- 		<c:forEach begin="1" end="${totalPage }" var="i">
       [<a href="	?action=list&page=${i }">${i }</a>]
    </c:forEach> --%>



	</center>
</body>
</html>





