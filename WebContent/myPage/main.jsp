<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% session.setAttribute("member_id", "gildong"); %>
<script type="text/javascript" src="/Funshop/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		$('#menu a').mouseenter(function() {
			$(this).css({"font-size": "120%"});
		});
		$('#menu a').mouseleave(function() {
			$(this).css({"font-size": "100%"});
		});
	});
</script>
<style type="text/css">
	* {
		font-family: arial, sans-serif;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
</head>
<body style="width: 1200px;">
	<center>
		<br><br><br><br>
		<hr>
		<table border="1" align="left" style="border-collapse: collapse;">
			<tr valign="top" align="left">
				<td width="180px" height="800px"><tiles:insert attribute="menu"/></td>
				<td width="840px"><tiles:insert attribute="body"/></td>
			</tr>
			<tfoot><tr><td colspan="2"><br></td></tr></tfoot>
		</table>	
	</center>
</body>
</html>