<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	var date  = new Date();
	$(function() {
		$('button[name=bt_time]').each(function(index) {
			var month = date.getMonth();
			if(index == 1) $(this).val(month+1);
			else if(index > 1 && index < 7) {
				month = month-index+2;
				if(month < 1) month += 12;
				$(this).val(month);
				$(this).text(month+'월');
			}
		})
		$('button[name=bt_time]').click(function() {
			$.ajax({
				url: '/Funshop/myPage/buyHistoryResult.do',
				data: { "option":$(this).val(),
					    "userTime":$('#text_userTime').val() },
				success: function(result) {
					$('#div_HisTab').hide();
					$('#div_HisTab').html(result);
					$('#div_HisTab').slideDown("slow");
				}
			});
		});
		$('#text_userTime').click(function() {
			if($(this).val()=='년/월/일-년/월/일') $(this).val('');
		});
	});
</script>
<center>
	<table id="tb_buyHis" style="border-collapse: collapse; width: 90%;">
		<tr><td><h1 align="left">주문내역</h1></td></tr>
		<tr style="border: 10px solid lightgray; background: lightgray;">
			<td><font size="2px">기간별조회</font></td>
			<td><button name="bt_time" value="thisWeek">이번주</button></td>
			<td><button name="bt_time">이번달</button></td>
			<td width="10"></td>
			<td><button name="bt_time"></button></td><!-- 이번달-1 -->
			<td><button name="bt_time"></button></td><!-- 이번달-2 -->
			<td><button name="bt_time"></button></td><!-- 이번달-3 -->
			<td><button name="bt_time"></button></td><!-- 이번달-4 -->
			<td><button name="bt_time"></button></td><!-- 이번달-5 -->
			<td width="10"></td>
			<td><input id="text_userTime" type="text" value="년/월/일-년/월/일"></td>
			<td><button name="bt_time" value="userTime">조회하기▶</button></td>
		</tr>
	</table><br>
	<div id="div_HisTab" style="border: solid 1px; width: 90%"></div>
</center>