<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
	//session.setAttribute("id", "gildong"); //for test
	String id = (String)session.getAttribute("id");
	if(id == null) {
		response.sendRedirect("/Funshop/login.do");
		return;
	}
			
	if(id.equals("admin")) session.setAttribute("isAdmin", true);
	else session.setAttribute("isAdmin", false);
	session.setAttribute("member_id", id);
%>
<script type="text/javascript" src="${path }/js/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${path}/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">      
<link href="${path}/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
<link href="${path}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<link href="${path}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/css/landing-page.min.css" rel="stylesheet">
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
<body style="width: 1250px;">
		<tiles:insert attribute="myPageHeader"/>
		<br>
		<table border="1" style="border-collapse: collapse;">
			<tr valign="top" align="center" style="border-bottom: hidden;">
				<td width="200px" height="1200px" style="border-left: hidden;"><br><tiles:insert attribute="myPageMenu"/></td>
				<td width="1000px" style="border-right: hidden;"><br><tiles:insert attribute="myPageBody"/></td>
			</tr>
		</table>	
</body>
</html>