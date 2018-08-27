<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 중복확인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript">
$(function(){
	$('#result').click(function(){
		var idExp = /^[a-zA-Z0-9]{4,15}$/;
		if(!idExp.test($('#id').val())){ //id 유효성 검사
			alert("ID는 띄어쓰기 없이 4~15자리의 영문자/숫자만 가능합니다.");
			$('#id').focus();
		}else{
			$.ajax({
				url:'/Funshop/userinput.do',
				success: function(data){
					console.log($.trim(data));
					console.log($.trim(data).length);
					if($.trim(data).length==0){ //id값이 있으면 사용 불가
						$('#msg').html("<font color=red>사용 불가능합니다.</font>");
						//$('#cancel').css('visibility','visible');
						//$('#use').css('visibility','hidden');
						$('#cancel').css('display','block');
						$('#use').css('display','none');
					}else { //id값이 없으면 사용 가능
						$('#msg').html("<font color=blue>"+data+"는(은) 사용 가능합니다.</font>");
						$('#cancel').css('display','none');
						$('#use').css('display','block');
					}
				},
				data:{
					action: 'check',
					id: $('#id').val()
				}
			});
		}//else
	});//확인 버튼 클릭
});

function sendCheckId(){//사용하기 클릭 시 부모창으로 값 전달 
	//$('#부모창의 값을 받을Id', opener.document).append('자식창의 보낼value가 들어있는 Id');
	$('#id',opener.document).val($('#id').val()); //회원가입 화면의 ID입력란에 값을 전달
	window.close();
}
</script>
<style type="text/css">
	#cancel{
		/* visibility:visible; */
		display: none;
		margin:0px auto;
	}
	
	#use{
		display: none;
		margin:0px auto;	
	}
	
	input[type="text"]{
		border: 1px solid #ccc;
		border-radius: 4px;
		width: 260px;
		height: 37px;
		box-sizing: border-box;
		-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
    	resize: vertical;
	}
</style>
</head>
<body class="container">
	<h3>ID 중복 확인</h3>
	<hr>
	<div class="container" style="text-align: center;">
		ID: <input type="text" name="id" id="id" placeholder="띄어쓰기 없이 영/숫자 4~15자" >
		<input type="button" value="확인" id="result" class="btn">
		<div id="msg"></div>
		<br>
		<div class="container">
			<input id="cancel" type="button" value="취소" onclick="window.close()" class="btn">
			<input id="use" type="button" value="사용하기" onclick="sendCheckId()" class="btn">
		</div>
	</div>
</body>
</html>