<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Funshop_회원정보 관리</title>
<script type="text/javascript">
	function Delete() {
		location.href = "/Funshop/admin_member/delete.do?no=${member.no}";
	}
</script>
<style type="text/css">
.parent {
	text-align: center;
}

.table {
	table-layout: auto;
}
</style>
</head>
<%--member_editForm.jsp --%>
<body class="parent">
	<br>
	<h1>회원정보 관리 : 편집</h1>
	<hr class="container">
	<a href="/Funshop/admin_member/memberList.do">회원정보 목록</a>
	<br>
	<br>
	<form action="/Funshop/admin_member/update.do?action=listForm"
		method="post" name="editForm" class="container">
		<input type="hidden" name="no" value="${member.no }">
		<table border="1" class="table">
			<tr>
				<th>아이디</th>
				<td><input type="text" 
						   name="id"
						   placeholder="아이디 작성"
						   size="32.7" value="${member.id }">
				</td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="text"
						   name="pw"
						   placeholder="비밀번호 작성"
						   size="32.7" value="${member.pw }">
				</td>
			</tr>

			<tr>
				<th>이름</th>
				<td><input type="text"
						   name="name"
						   placeholder="이름 작성"
						   size="32.7" value="${member.name }">
				</td>

			</tr>
			
			<tr>
				<th>이메일</th>
				<td><input type="text"
						   name="email"
						   placeholder="이메일 작성"
						   size="32.7" value="${member.email }">
				</td>
			</tr>
			
			<tr>
				<th>폰 번호</th>
				<td><input type="text"
						   name="phone"
						   placeholder="폰 번호 작성"
						   size="32.7" value="${member.phone }">
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td><input type="text"
						   name="addr"
						   placeholder="주소작성"
						   size="32.7" value="${member.addr }">
				</td>
			</tr>
		</table>
		<br><br>
		<input type="submit" value="수정"class="btn btn-success">
		<input type="reset" value="리셋" class="btn btn-secondary">
		<input type="button" value="삭제" onclick="Delete()" class="btn btn-danger">
	</form>
</body>
</html>



