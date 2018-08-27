<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>회원가입</title>
<style type="text/css">
	input[type="text"], input[type="password"],select{
		display: inline-block;
		/* border: 1px solid #ccc; */
		border-left: thin;
		border-right: thin;
		border-top: thin;
		border-radius: 4px;
		box-sizing: border-box;
    	-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
    	resize: vertical;
    	size: 50px;
		height: 37px;
		width: 400px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#id').click(function(){ //id입력텍스트 클릭시 중복확인창 띄우기
		$('#check').click();
	});
	
	$('#site').change(function(){ //이메일 입력
		var site = $('#site').val();
		console.log(site);
		if(site!='==직접입력=='){
			$("input[name=email2]").val(site);
			$("input[name=email2]").attr('readonly', true); //readonly로 직접입력 막기.
		}else{
			$("input[name=email2]").val('');
			$("input[name=email2]").attr('readonly', false);
		}
	});
	
	$('#insert').click(function(){ //회원가입 폼 유효성 검사
		//var nameExp = /^[가-힣a-zA-Z]{2,15}$/; //이름 유효성 검사식
		var emailExp = /^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+$/;
		var phoneExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		
		if($('#id').val()==''){
			alert('중복확인을 통해 id를 입력해주세요.');
			$('#id').focus();
		}else if($('#pw').val().trim()==''){
			alert('비밀번호를 입력해주세요.');
			$('#pw').focus();
		}else if($('#pw2').val().trim()==''){
			alert('비밀번호를 입력해주세요.');
			$('#pw2').focus();
		}else if($('#pw').val() != $('#pw2').val()){
			alert('비밀번호가 일치하지 않습니다');
			$('#pw2').val('');
			$('#pw2').focus();
		}else if($('#name').val().trim()==''){ //(!nameExp.test($('#name').val())){
			alert('이름을 정확히 입력해주세요.');
			//alert('이름에는 숫자가 들어갈 수 없습니다.');
			$('#name').focus();
		}else if(!phoneExp.test($('#phone1').val()+'-'+$('#phone2').val()+'-'+$('#phone3').val())){
			alert('알맞지 않은 핸드폰 번호입니다.');
			$('#name').focus();
		}else if(!emailExp.test($('#eamil1').val()+'@'+$('#email2').val())){
			alert('알맞지 않은 이메일형식입니다.');
			$('#email1').val('');
			$('#email2').val('');
			$('#email1').focus();
		}else if($('#question').val()=='질문'){
			alert('질문을 선택해주세요.');
			$('#question').focus();
		}else if($('#answer').val().trim()==''){
			alert('답변을 입력해주세요.');
			$('#answer').focus();
		}else{
			//올바른 데이터 입력시
			$('#frm').submit();
		}
	}); //등록 버튼 클릭
	
	$('#phone1').keyup(function(){ //핸드폰 입력 focus 자동 넘기기
		var limit = $(this).attr('maxlength');
		if(this.value.length >= limit){
			$('#phone2').focus();
			return false;
		}
	});
	$('#phone2').keyup(function(){
		var limit = $(this).attr('maxlength');
		if(this.value.length >= limit){
			$('#phone3').focus();
			return false;
		}
	});
	
});

function confrimId(){//id 중복확인 창
	window.open('userinput.do?action=idCheck', 'IDCheck', 'top=150px, left=90px, height=200px, width=500px');
	return false;
}
</script>
<body class="container" style="text-align: center;">
	<h3>회원가입</h3>
	<hr>
	<!-- <form name="frm" method="post" id="frm"> -->
	<form action="userinput.do?action=insert" name="frm" id="frm" method="post">
		<div class="container">
			<table style="text-align: center;" class="container">
				<tr>
					<td>
						<input type="text" id="id" name="id" placeholder="중복확인을 통해 ID를 입력해주세요" readonly style="width: 310px;">
						<input type="button" value="중복확인" onclick="confrimId()" id="check" class="btn">
					</td>
				</tr>

				<tr>
					<td><input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요"></td>
				</tr>
				<tr>
					<td><input type="password" id="pw2" name="pw2" placeholder="위와 같은 비밀번호를 입력해주세요"></td>
				</tr>
				<tr>
					<td><input type="text" id="name" name="name" placeholder="이름"></td>
				</tr>
				<tr>
					<td>
						<input type="text" id="phone1" name="phone1" maxlength="3" placeholder="핸드폰"  style="width:125px">-
						<input type="text" id="phone2" name="phone2" maxlength="4"  style="width:125px">-
						<input type="text" id="phone3" name="phone3" maxlength="4"  style="width:125px">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="email1" name="email1" placeholder="이메일 아이디" style="width:120px">@
						<input type="text" id="email2" name="email2" placeholder="사이트" style="width:125px">
						<select name="site" id="site" style="width: 130px;">
							<option value="==직접입력==">==직접입력==</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<select name="question" id="question">
							<option value="질문">질문</option>
							<option value="좋아하는 색깔은 무엇입니까?">좋아하는 색깔은 무엇입니까?</option>
							<option value="태어난 곳은 어디입니까?">태어난 곳은 어디입니까?</option>
							<option value="여행가고 싶은 곳은 어디입니까?">여행가고 싶은 곳은 어디입니까?</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="text" name="answer" id="answer" placeholder="답변"></td>
				</tr>
			</table>
		</div>
		<br>
		<div class="container">
			<button id="insert" type="button" class="btn">등록</button>
		</div>
	</form>
</body>
</html>