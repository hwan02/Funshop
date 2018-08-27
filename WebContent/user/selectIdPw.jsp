<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID/PW찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">
	#d2{
		display: none;
	}
	
	input[type="text"], input[type="password"], select {
		border-top: thin;
		border-left: thin;
		border-right: thin;
		height: 37px;
		width: 250px;
		-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('[name=select]').on('click',function(){ //라디오 버튼 클릭시
		$('#result').html('');
		var checkVal = $('[name=select]:checked').val(); //'id','pw'
		console.log(checkVal);
		if(checkVal=='id'){
			$('#d1').css("display", "block");
			$('#d2').css("display", "none");
		}else if(checkVal=='pw'){
			$('#d2').css("display", "block");
			$('#d1').css("display", "none");
		}
	}); //id,pw 선택
	
	$('#selectId').click(function(){
		$.ajax({
			url:'/Funshop/login.do',
			success: function(data){
				console.log(data);
				console.log($.trim(data).length);
				$('#result').html('<font color=blue>'+data+'</font>');
				if($.trim(data).length==0){
					$('#result').html('<font color=red>정확한 정보를 기입해주세요.</font>');
				}
			},
			data:{
				action: 'selectIdPw',
				select: 'id',
				name: $('#name').val(),
				phone: $('#phone').val(),
			}
		});
	});//ID찾기 버튼 클릭
	
	$('#selectPw').click(function(){
		$.ajax({
			url:'/Funshop/login.do',
			success: function(data){
				console.log(data);
				$('#result').html('<font color=blue>'+data+'</font>');
				if($.trim(data).length==0){
					$('#result').html('<font color=red>정확한 정보를 기입해주세요.</font>');
				}
			},
			data:{
				action: 'selectIdPw',
				select: 'pw',
				name: $('#name2').val(),
				id: $('#id').val(),
				question: $('#question').val(),
				answer: $('#answer').val()
			}
		});
	});//pw찾기 버튼 클릭
});
</script>
</head>
<body class="container">
	<h3>ID/PW찾기</h3>
	<hr>
	<input type="radio" name="select" value="id" checked>ID
	<input type="radio" name="select" value="pw">PW
	<br>
	<hr>
	<div id="d1">
		<form name="selectId" style="text-align: center;">
			이름 <input type="text" id="name" name="name"><br>
			핸드폰 <input type="text" id="phone" name="phone" placeholder="'-'를 같이 입력해주세요."><br><br>
			<input type="button" value="검색" id="selectId" class="btn">
			<input type="button" value="닫기" id="close" onclick="window.close()" class="btn"><br>
		</form>
	</div>
	<!-- 
	<div id="d2">
	<div id="d2" style="display: none;">
		<form name="selectPw">
			이름: <input type="text" id="name2" name="name"><br>
			ID: <input type="text" id="id" name="id"><br>
			<input type="button" value="검색" id="selectPw">
		</form>
	</div>
	 -->
	<div id="d2">
		<form name="selectPw" style="text-align: center;">
			이름  <input type="text" id="name2" name="name"><br>
			ID <input type="text" id="id" name="id"><br>
			질문
				<select name="question" id="question">
					<option value="좋아하는 색깔은 무엇입니까?">좋아하는 색깔은 무엇입니까?</option>
					<option value="태어난 곳은 어디입니까?">태어난 곳은 어디입니까?</option>
					<option value="여행가고 싶은 곳은 어디입니까?">여행가고 싶은 곳은 어디입니까?</option>
				</select>
				<br>
			답변 <input type="text" name="answer" id="answer"><br><br>
				<input type="button" value="검색" id="selectPw" class="btn">
				<input type="button" value="닫기" id="close" onclick="window.close()" class="btn"><br>
		</form>
	</div>
	<div id="result" style="text-align: center;"></div>
</body>
</html>