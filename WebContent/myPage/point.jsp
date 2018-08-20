<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function () {
		$('[name=bt_level]').click(function() {
			var level =  $(this).text();
			var size, mineNum;
			switch(level) {
				case '초급': size=10; mineNum=10; break;
				case '중급': size=16; mineNum=40; break;
				case '고급': size=22; mineNum=100; break;
			}		
			location.replace('/Funshop/myPage/point.do?size='+size+'&mineNum='+mineNum);
		});
		$('#div_minSearch').show(1000);
	});
	function afterMineSearchWin() {
		$.ajax({
			url:'/Funshop/myPage/pointResult.do',
			data:{"action":"insert",
				  "point_point":mineNum},
			type:'POST',
			success:function() {
				alert('포인트 '+mineNum+'점이 적립되었습니다 :)');
				location.replace('/Funshop/myPage/point.do');
			}
		});
	}
</script>
<style type="text/css">
	#div_minSearch {
		display: none;
	}
</style>
<center>
	<table style="border-collapse: collapse; width: 90%;">
		<tr><td><h1 align="left" style="">포인트관리</h1><hr></td></tr>
		<tr><td>
			<div id="div_userInfoFrm" style="border: solid 1px; width: 90%">
				<br>당신의 포인트는 총 ${validPoint }점 입니다.<br>
				이번달 소멸예정 포인트는 ${warningPoint }점 입니다.<br>
			</div><br>
		</td></tr>
		<tr id="gameBoard"><td>
			<%@ include file="/gamePage/mineSearch.jsp" %>
		</td></tr>
		<tr><td>
			<button name="bt_level">초급</button>
			<button name="bt_level">중급</button>
			<button name="bt_level">고급</button>
		</td></tr>
	</table>
</center>