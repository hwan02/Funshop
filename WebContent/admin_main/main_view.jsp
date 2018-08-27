<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<link rel="icon" href="/Funshop/image/favicon.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#member").click(function() {	
			$.ajax({
				url : "/Funshop/admin_member/memberList.do",
				success : function(result) {
					$("#view").html(result);
				}
			});
		});

		$("#notice").click(function() {
			$.ajax({
				url : "/Funshop/admin_notice/noticeList.do",
				success : function(result) {
					$("#view").html(result);
				}
			});
		});

		$("#sales").click(function() {
			$.ajax({
				url : "/Funshop/admin_sales/sales.do",
				success : function(result) {
					$("#view").html(result);
				}
			});
		});
	}); 

	function logout() {
		alert('로그아웃 되었습니다.');
		location.replace('/Funshop/login.do?action=logout');
	}
</script>
<title>Funshop_관리자 메인</title>
</head>
<body >
	<!-- Nav tabs -->
	<div class="container mt-3">
		<!--로그아웃 클릭시 메인 페이지 이동-->
		<h2>관리자 페이지 <button id="bt"  onclick="logout()" class="btn btn-danger">로그아웃</button>
		<button id="bt2"  onclick="location.href='/Funshop/mainPage/main.do'" class="btn btn-danger">메인페이지</button></h2>
		<br>
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				href="/Funshop/admin_main/main_view.do">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="#" id="member">Member</a></li>
			<li class="nav-item"><a class="nav-link" href="#" id="notice">Notice</a></li>
			<li class="nav-item"><a class="nav-link" href="#" id="sales">Sales</a></li>
			<!-- <li class="nav-item"><a class="nav-link" href="#" id="adminPage">Product</a></li> -->
		</ul>

		<!-- Tab panes -->
 		<div id="view" class="tab-content">
			<br>
			<h3>&#169;Funshop 주식회사</h3>
		</div>
	</div>
</body>
</html>
