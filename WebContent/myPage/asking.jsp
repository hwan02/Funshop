<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		$('#bt_asking_send').click(function() {
			$.ajax({
				url:'/Funshop/myPage/askingResult.do',
				data:{
					"action":"insert",
					"member_id":"${member_id }",
					"asking_content":$('#ta_asking').val()
				},
				type:'POST'
			});
			
			$('#ta_asking').val(''); //textarea 비우기
			var newDiv = $('<div></div>').html('하이');
			$('#div_userInfoFrm').append(newDiv);
			newDiv.focus();
		});
		
		$('#div_userInfoFrm').on('click','div',function() {
			alert("채팅하나 클릭");
		});
	});
</script>
<center>
	<table style="border-collapse: collapse; width: 90%;">
		<tr><td><h1 align="left" style="">실시간문의</h1><hr></td></tr>
		<tr><td>
			<div id="div_userInfoFrm" style="border: solid 1px; width: 300px; height: 400px; overflow: auto;">
				<div style="width: 200px; position: relative; left: 85px;">이 곳은 구매자 채팅 예시입니다.이 곳은 구매자 채팅 예시입니다.이 곳은 구매자 채팅 예시입니다.이 곳은 구매자 채팅 예시입니다.<br><font size="2">2018-01-01 오후2시30분</font></div><br style="line-height: 50%">
				<div style="width: 200px; position: relative; left: 85px;">이 곳은 구매자 채팅 예시입니다.이 곳은 구매자 채팅 예시입니다.이 곳은 구매자 채팅 예시입니다.이 곳은 구매자 채팅 예시입니다.<br><font size="2">2018-01-01 오후2시30분</font></div><br style="line-height: 50%">
				<div style="width: 200px;">이 곳은 관리자 채팅 예시입니다.이 곳은 관리자 채팅 예시입니다.이 곳은 관리자 채팅 예시입니다.이 곳은 관리자 채팅 예시입니다.<br><font size="2">2018-01-01 오후2시30분</font></div><br style="line-height: 50%">
				<div style="width: 200px;">이 곳은 관리자 채팅 예시입니다.이 곳은 관리자 채팅 예시입니다.이 곳은 관리자 채팅 예시입니다.이 곳은 관리자 채팅 예시입니다.<br><font size="2">2018-01-01 오후2시30분</font></div><br style="line-height: 50%">
				<div style="width: 200px; position: relative; left: 85px;">이 곳은 구매자 채팅 예시입니다.이 곳은 구매자 채팅 예시입니다.이 곳은 구매자 채팅 예시입니다.이 곳은 구매자 채팅 예시입니다.<br><font size="2">2018-01-01 오후2시30분</font></div><br style="line-height: 50%">
			</div><br>
		</td></tr>
		<tr><td>
			<textarea rows="2" cols="45" id="ta_asking"></textarea> <button id="bt_asking_send">보내기</button>
		</td></tr>
	</table>
</center>