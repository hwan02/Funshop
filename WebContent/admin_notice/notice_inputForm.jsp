<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Funshop_공지사항</title>
<style type="text/css">
  .parent { text-align: center; }
/*   .child { display: inline-block; } */
</style>
</head>
<%--notice_inputForm.jsp--%>
<body  class="parent"> 
	<br>
	<h1>공지사항 : 작성</h1>
	<hr class="container">
	<a href="/Funshop/admin_notice/noticeList.do?action=list">공지사항 목록</a>
	<br><br>
	<form  action="noticeList.do?action=insert" method="post">
		<input type="text" name="write" size="47.7" placeholder="제목 작성"> <br>
		<br>
		<textarea rows="10" cols="50" name="contents" placeholder="내용 작성"></textarea>
		<br>
		<br>
		<button class="btn btn-info">전송(DB)</button>
	</form>
</body>
</html>



