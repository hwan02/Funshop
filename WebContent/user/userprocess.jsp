<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입처리결과</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body class="container" style="text-align: center;">
	<h3>회원가입 성공!!</h3>
	<hr class="container">
		<b>[${id }]님 회원가입을 축하합니다.</b><br>
		앞으로 많은 이용 부탁드립니다.
		<br><br>
		<hr class="container">
		<a href="/Funshop/mainPage/main.do">메인 페이지로 이동</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/Funshop/login.do?action=loginForm">로그인 페이지로 이동</a>
</body>
</html>