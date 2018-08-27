<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="icon" href="/Funshop/image/favicon.ico">
<title>Funshop_회원정보 관리</title>
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
<%--member_listForm.jsp--%>
<body>
	<center>
		<br>
		<a href="/Funshop/admin_main/main_view.do"><h1>회원정보 관리 : 목록</h1></a>
		<hr class="container">
		<input type="search" placeholder="검색" >
		<br><br>
		<table cellpadding="5" class="container" >
			<thead>
				<tr bgcolor="skyblue">
					<th>아이디</th>
<<<<<<< HEAD
					<!-- <th>비밀번호</th> -->
					<th>이름</th>
					<th>이메일</th>
					<th>폰 번호</th>
=======
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>폰 번호</th>
					<th>주소</th>
>>>>>>> 2f154e2918aec43d528e1cca882c64bc0354d9e7
					<th>비밀번호 질문</th>
					<th>비밀번호 답변</th>
					<th>등급</th>
					<th>가입 일짜</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${list }" var="member">
<<<<<<< HEAD
				<c:if test="${member.id != 'admin'}" >
=======
>>>>>>> 2f154e2918aec43d528e1cca882c64bc0354d9e7
					<tr>	
						<td>${member.id }</td>
						<%-- <td>${member.pw }</td> --%>
						<td>${member.name }</td>
						<td>${member.pw }</td>
						<td>${member.email }</td>
						<td>${member.phone }</td>
<<<<<<< HEAD
=======
						<td>${member.addr }</td>
>>>>>>> 2f154e2918aec43d528e1cca882c64bc0354d9e7
						<td>${member.question }</td>
						<td>${member.answer }</td>
						<td>${member.rank }</td>
						<td>${member.wdate }</td>
						<td><a href="/Funshop/admin_member/memberEdit.do?id=${member.id }">삭제</a> </td>
					</tr>
<<<<<<< HEAD
				</c:if>
=======
>>>>>>> 2f154e2918aec43d528e1cca882c64bc0354d9e7
				</c:forEach>
			</tbody>
		</table>
		<hr class="container">
<%-- 		<c:forEach begin="1" end="${totalPage }" var="i">
			[<a href="/Funshop/admin_member/memberList.do?action=list&page=${i }">${i }</a>]
    	</c:forEach> --%>
	</center>
</body>
</html>