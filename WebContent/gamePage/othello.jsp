<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오델로</title>
<script type="text/javascript" src="/Funshop/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	if('${id }' == '') {
		alert('로그인이 필요합니다.');
		location.replace('/Funshop/mainPage/main.do');
	}
	
	var stone = -1; //-1:흑돌, 1:백돌
	var point = 100; //게임 승리시 적립될 포인트
	
	$(function() {
		loadBoard();
		
		disableGameBt();
		disableRegameBt();
		$('#div_ready').click(function() {
			$(this).fadeOut(1000);
			$('#div_msg').html('<font size=4>당신은 흑돌입니다. 알파셀로를 이겨서 포인트를 획득하세요 :)</font>');
			enableGameBt();
		});
		
		$('[name=bt_stone]').each(function() {
			$(this).click(function() {
				$.ajax({
					url:"/Funshop/gamePage/othello.do",
					data:{"action":"putStone",
							"i":$(this).attr("id").substr(3, 1),
							"j":$(this).attr("id").substr(4, 1),
							"stone":stone},
					success:function(result) {
						if(result == 'success') {
							loadBoard(reqPut);
						} else {
							alert('둘 수 없는 곳입니다.');
						}
					},
					error: function(a,b) {
						alert("현재 페이지 점검중입니다.");
					}
				});
			});
		});
		
		$('#bt_pass').click(function() { //턴 넘기기
			reqPut();
		});
		
		$('#bt_regame').click(function() { //다시시작
			$.ajax({
				url:"/Funshop/gamePage/othello.do",
				data:{"action":"regame"},
				success:function(result) {
					$('[name=bt_stone]').html('');
					enableGameBt();
					loadBoard();
				},
				error: function(a,b) {
					alert("현재 페이지 점검중입니다.");
				}
			});
		});
	});
	
	function loadBoard(reqPut) {
		$.ajax({
			url:"/Funshop/gamePage/othello.do",
			data:{"action":"loadBoard"},
			success: function(result) { //게임중일 경우
				var posList = eval(result);
				for(var i=0; i<posList.length-1; i++) {
					pos = posList[i].split(':');
					var ij = pos[0];
					var stone = pos[1];
					if(stone == -1) { //흑돌
						stone = '<img src="/Funshop/img/stone_black.png" style="width: 40px; height: 40px;">'
					} else if(stone == 1) { //백돌
						stone = '<img src="/Funshop/img/stone_white.png" style="width: 40px; height: 40px;">'
					} else if(stone == 2) { //AI가 새로 둔 위치
						stone = '<img src="/Funshop/img/stone_white_blue.png" style="width: 40px; height: 40px;">'
					}
					$('#bt_'+ij).html(stone);
				}
				
				var result = posList[posList.length-1];
				if(result != 'playing') {
					if(result == 'black') { 
						alert('검은돌이 승리하였습니다!!');
						$.ajax({
							url:'/Funshop/myPage/pointResult.do',
							data:{"action":"insert",
								  "point_point":point},
							type:'POST',
							success:function() {
								alert('포인트 '+point+'점이 적립되었습니다 :)');
								//location.replace('/Funshop/myPage/point.do');
							}
						});
					}
					else if(result == 'white') alert('흰돌이 승리하였습니다 :(');
					else if(result == 'draw') alert('무승부입니다.');
					disableGameBt();
					$.ajax({
						url:"/Funshop/gamePage/othello.do",
						data:{"action":"regame"}
					});
				} else if(reqPut) {
					reqPut();
				}
			},
			error: function(a,b) {
				alert("현재 페이지 점검중입니다.");
			}
		});
	}
	
	function reqPut() {
		$.ajax({
			url:"/Funshop/gamePage/othello.do",
			data:{"action":"reqPut",
				  "stone":-stone},
			success: function(result) {
				disableGameBt();
				disableRegameBt();
				waitPut();
			},
			error: function(a,b) {
				alert("현재 페이지 점검중입니다.");
			}
		});
	}
	
	var times = 0;
	function waitPut() {
		if(times > 5) {
			$('#div_msg').html('　');
			times = 0;
			loadBoard();
			enableGameBt();
		} else {
			var msg = '알파셀로가 계산중입니다';
			for(var i=0; i<times; i++) {
				msg += ' . ';
			}
			$('#div_msg').html('<b><font size=4>'+msg+'</font></b>');
			times++;
			setTimeout(waitPut, 300);
		}
	}
	
	function disableGameBt() {
		$('[name=bt_stone]').attr({"disabled":"disabled"});
		$('#bt_pass').attr({"disabled":"disabled"});	
	}
	function disableRegameBt() {
		$('#bt_regame').attr({"disabled":"disabled"});
	}
	
	function enableGameBt() {
		$('[name=bt_stone]').removeAttr("disabled");
		$('#bt_pass').removeAttr("disabled");
		$('#bt_regame').removeAttr("disabled");
	}
</script>
</head>
<body>
<br><center>
	<center>
	</center>
	<div id="div_ready" style="position: absolute; left: 35%; top: 40%"><img src="/Funshop/img/othello_ready.jpg" width="400" height="auto"></div>
	<div>
		<div id="div_msg" style="height: 30px;"></div>
		<table border="solid 1px">
			<c:forEach begin="1" end="8" var="i">
				<tr>
				<c:forEach begin="1" end="8" var="j">
					<td><button style="width: 60px; height: 60px;" id="bt_${i }${j }" name="bt_stone"></button></td>
				</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div><br>
	<button id="bt_pass">턴 넘기기</button>
	<button id="bt_regame">다시시작</button><br>
<br></center>
</html>