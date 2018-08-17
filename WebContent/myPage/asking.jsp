<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	var member_id_from = '${member_id }';
	var member_id_to = 'admin';

	var flag_typing = false;
	var flag_editing = false;
	
	$(function() {
		$('#bt_asking_send').click(function () {
			var asking_text = $('#ta_asking').val().trim();
			if(asking_text == '') {
				alert('내용을 입력하세요 :)');
				return;
			} else if(flag_editing) {
				alert('메시지 편집을 끝내주세요 :)');
				return;
			} else if(asking_text.length > 100) {
				alert('100자 이내로 입력해주세요 :)');
				return;
			}
			$.ajax({
				url:'/Funshop/myPage/askingAction.do',
				data:{
					"action":"insert",
					"member_id_from":member_id_from,
					"member_id_to":member_id_to,
					"asking_content":asking_text
				},
				type:'POST',
				error : function() {
					alert('현재 1대1문의 점검중입니다');
				}
			});
			
			$('#ta_asking').val(''); //textarea 비우기
		});
		
		$('#div_askingFrame').on('click','div[name=div_myAsking]',function() {
			if(flag_editing) return;
			editChat(this);
		});
		$('#div_askingFrame').on('contextmenu','div[name=div_myAsking]',function() {
			if(flag_editing) return;
			editChat(this);
			return false;
		});
		
		$('#ta_asking').focusin(function() {
			flag_typing = true;
		});
		$('#ta_asking').focusout(function() {
			flag_typing = false;
		});
		$('#div_askingFrame').focusin(function() {
			flag_typing = true;
		});
		$('#div_askingFrame').focusout(function() {
			//flag_typing = false;
		});
		
		reqChat();
	});
	
	function reqChat() {
 			$.ajax({
			url:'/Funshop/myPage/askingAction.do',
			data:{
				"action":"list",
				"member_id_from":member_id_from,
				"member_id_to":member_id_to
			},
			type:'GET',
			dataType:'JSON',
			success:function(result) {
				if(!flag_editing) {
					if(result.length < 1) {
						$('#div_askingFrame').html('<br><b>지금 실시간문의를 시작하세요!!</b>');
					} else {
						$('#div_askingFrame').empty();
						var hidden_button;
						for(var i=0; i<result.length; i++) {
							var asking = result[i];
							asking.asking_content = asking.asking_content.replace(/</g, '&lt;').replace(/>/g, '&gt;');
							
							var div_asking = $('<div></div>').css({"width":"200px","border":"solid 1px", "border-radius":"1em", "word-break":"break-all", "padding":"5px"});
							var chat_html = asking.asking_content.replace(/\n/g, '<br>')+'</font><br><font size="1" id="'+asking.asking_no+'">'
				  			  			  + '　'+asking.asking_date;
							if(asking.member_id_from == member_id_from) { //자신의 채팅내용
								div_asking.css({"background":"yellow", "position":"relative", "left":"100px"});
								div_asking.attr("name","div_myAsking");
								chat_html += '　'+asking.asking_check;
							} else { //상대방(관리자)의 채팅내용
								div_asking.css({"background":"white"});
							}
							div_asking.attr("id","div_"+i);
							chat_html += '</font>';
							div_asking.html(chat_html);
							
							$('#div_askingFrame').append(div_asking).append('<br style="line-height: 50%">')
							document.getElementById("div_"+i).asking = asking;
							
							if(i == result.length-1 && !flag_typing) {
								var hidden_button = $('<button></button>')
								$('#div_askingFrame').append(hidden_button);
								hidden_button.focus().css({"display":"none"});
							}
						}
					}
				}
				setTimeout(reqChat, 500);
			},
			error : function() {
				alert('현재 1대1문의 점검중입니다');
			}
		});
	}
	
	function editChat(div_asking) {
		var asking = div_asking.asking;
		document.getElementById('div_asking_edit').asking = asking; //eidt폼으로 asking정보 넘겨주기
		flag_editing = true; //새로운 채팅 받아오기 중지
		$('#'+div_asking.id).append($('#div_asking_edit'));
		$('#div_asking_edit textarea').val(asking.asking_content);
		$('#div_asking_edit textarea').focus();
	}
	
	$(function() {
		$('#bt_asking_update').click(function() {
			var asking = document.getElementById('div_asking_edit').asking;
			$.ajax({
				url:'/Funshop/myPage/askingAction.do',
				data:{
					"action":"update",
					"asking_no":asking.asking_no,
					"asking_content":$('#ta_asking_update').val()
				},
				type:'POST',
				error:function(){
					alert('현재 1대1문의 점검중입니다');
				}
			});
			flag_editing = false;
			$('#div_asking_shelter').append($('#div_asking_edit'));
		});
		$('#bt_asking_delete').click(function() {
			var asking = document.getElementById('div_asking_edit').asking;
			$.ajax({
				url:'/Funshop/myPage/askingAction.do',
				data:{
					"action":"delete",
					"asking_no":asking.asking_no
				},
				type:'POST',
				error:function(){
					alert('현재 1대1문의 점검중입니다');
				}
			});
			flag_editing = false;
			$('#div_asking_shelter').append($('#div_asking_edit'));
		});
		$('#bt_asking_cancel').click(function() {
			flag_editing = false;
			$('#div_asking_shelter').append($('#div_asking_edit'));
		});
	});
	
	/* 관리자용 */
	$(function() {
		$('#bt_set_target').click(function() {
			member_id_to = $('#target_id').val();
		});
		if(${isAdmin }) reqListTo();
	});
	function reqListTo() {
		$.ajax({
			url:'/Funshop/myPage/askingAction.do',
			data:{
				"action":"listTo",
				"member_id_to":"${member_id }"
			},
			type:'GET',
			dataType:'JSON',
			success:function(result) {
				$('#tb_standing').empty();
				for(var i=0; i<result.length; i++) {
					asking = result[i]
					var tr = $('<tr align="center"></tr>').html('<td>'+(i+1)+'</td>'
												+'<td>'+asking.member_id_from+'</td>'
												+'<td>'+asking.asking_date+'</td>'
												+'<td><div class="ask_cont">'+asking.asking_content+'</div></td>'
												+'<td><button onclick=setMemberID("'+asking.member_id_from+'")>선택</button></td>');
					$('#tb_standing').append(tr);
				}
			},
			error:function() {
				alert('대기목록 불러오기 실패!!');
			}
		});
	}
	function setMemberID(targetID) {
		$('#target_id').val(targetID);
		member_id_to = targetID;
		setTimeout(reqListTo, 500);
	}
</script>
<style>
.ask_cont { display: inline-block; width: 350px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
#tb_standing tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<center>
	<table style="border-collapse: collapse; width: 90%;">
		<tr><td><h1 align="left" style="">실시간문의</h1><hr></td></tr>
		
		<!-- 관리자용 -->
		<c:if test="${isAdmin }">
			<tr><td>
				고객아이디 <input type="text" id="target_id">
				<button id="bt_set_target">설정</button>
			</td></tr>
		</c:if>
		
		<tr><td>
			<div id="div_askingFrame" style="border: solid 1px; width: 330px; height: 400px; overflow: auto; background: skyblue; padding: 10px;"></div><br>
		</td></tr>
		<tr><td>
			<textarea rows="2" cols="45" id="ta_asking"></textarea> <button id="bt_asking_send">보내기</button>
		</td></tr>
		<tr><td>
			<br>메시지를 클릭해서 편집할 수 있습니다 :) 
		</td></tr>
	</table>
</center>

<!-- 관리자용 -->
<c:if test="${isAdmin }">
	<hr>
	<div style="margin:10px">
		<h3>문의대기목록 <button onclick="reqListTo();">새로고침</button></h3> 
		<table style="border: solid 1px; width: 100%">
			<thead>
				<tr bgcolor="#E1E6F6">
					<th>번호</th>
					<th>고객아이디</th>
					<th>날짜</th>
					<th>최근문의내용</th>
					<th>응답</th>
				</tr>
			</thead>
			<tbody id="tb_standing">
			</tbody>
		</table>
	</div>
</c:if>

<div id="div_asking_shelter" style="display: none;">
	<div id="div_asking_edit" style="text-align: center;">
		<textarea rows="3" cols="25" id="ta_asking_update"></textarea><br>
		<button id="bt_asking_update">수정</button>
		<button id="bt_asking_delete">삭제</button>
		<button id="bt_asking_cancel">취소</button>
	</div>
</div>
