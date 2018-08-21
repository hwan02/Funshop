<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="icon" href="/Funshop/image/favicon.ico">
<title>Funshop_공지사항</title>
<style type="text/css">
   a:link{color:buttonshadow;}
   a:hover {color:red; text-decoration: none;}
   a:active {color:yellow;}
   a:visited {color: skyblue;}
</style>
<script type="text/javascript">
function Delete() {
	location.href="/Funshop/admin_notice/delete.do?no=${notice.no}";
}
</script>
<style type="text/css">
.parent {
	text-align: center;
}
</style>
</head>
<%--notice_editForm.jsp --%>
<body class="parent">
	<br>
	<h1>공지사항 : 수정</h1>
	<hr class="container">
	<a href="/Funshop/admin_notice/noticeList.do">공지사항 목록</a>
	<br>
	<br>
	<form action="/Funshop/admin_notice/update.do?action=editForm" method="post"
		name="editForm" class="container">

		<input type="hidden" name="no" value="${notice.no }">
		<input type="text" name="write" 
			   placeholder="제목 작성" 
			   size="32.7" 
			   value="${notice.write }">
		<br><br>
		<textarea rows="5" cols="35" 
				  name="contents" 
				  placeholder="내용 작성">${notice.contents }</textarea>
		<br><br>
		<input type="submit" value="수정" class="btn btn-success">
		<input type="reset" value="리셋" class="btn btn-secondary">
		<input type="button" value="삭제" onclick="Delete()" class="btn btn-danger">
	</form>
</body>
</html>



