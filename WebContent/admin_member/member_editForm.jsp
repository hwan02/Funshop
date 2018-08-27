<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="icon" href="/Funshop/image/favicon.ico">
<title>Funshop_회원정보 관리</title>
<style type="text/css">
   a:hover {color:red; text-decoration: none;}
</style>
<script type="text/javascript">
	function Delete() {
		location.href = "/Funshop/admin_member/delete.do?id=${member.id}";
	}
</script>
<style type="text/css">
.parent {
	text-align: center;
}

tr{
	text-align: left;
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
		method="post" name="editForm">
		<table border="1" align="center">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" 
						   name="id"
						   size="32.7" value="${member.id }"
						   disabled>
				</td>
			</tr>

<%-- 			<tr>
				<th>비밀번호</th>
				<td><input type="text"
						   name="pw"
						   size="32.7" value="${member.pw }" 
						   disabled>
				</td>
			</tr> --%>

			<tr>
				<th>이름</th>
				<td><input type="text"
						   name="name"
						   size="32.7" value="${member.name }"
						   disabled>
				</td>

			</tr>
			
			<tr>
				<th>이메일</th>
				<td><input type="text"
						   name="email"
						   size="32.7" value="${member.email }"
						   disabled>
				</td>
			</tr>
			
			<tr>
				<th>폰 번호</th>
				<td><input type="text"
						   name="phone"
						   size="32.7" value="${member.phone }"
						   disabled>
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td><input type="text"
						   name="addr"
						   size="32.7" value="${member.addr }"
						   disabled>
				</td>
			</tr>	
			
			<tr>
				<th>비밀번호 질문</th>
				<td><input type="text"
						   name="question"
						   size="32.7" value="${member.question }"
						   disabled>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호 질문 답</th>
				<td><input type="text"
						   name="answer"
						   size="32.7" value="${member.answer}"
						   disabled>
				</td>
			</tr>
			
			<tr>
				<th>등급</th>
				<td><input type="text"
						   name="rank"
						   size="32.7" value="${member.rank }"
						   disabled>
				</td>
			</tr>
		</table>
		<br><br>
		<!-- <input type="submit" value="수정"class="btn btn-success">
		<input type="reset" value="리셋" class="btn btn-secondary"> -->
		<input type="button" value="삭제" onclick="Delete()" class="btn btn-danger">
	</form>
</body>
</html>



