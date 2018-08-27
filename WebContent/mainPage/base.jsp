<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://struts.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Funshop</title>
<% 
	String path = request.getContextPath();
	request.getSession().setAttribute("path", path);
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
</head>
<%-- base.jsp(레이아웃 설정) --%>
<body>
<center>
		<table border="1" width="100%">
			<tr>
				<td><tiles:insert attribute="header"/></td>
			</tr>
			<tr>
				<td><tiles:insert attribute="body"/></td>
			</tr>
			<tr>
				<td colspan="2"><tiles:insert attribute="footer"/></td>
			</tr>
		</table>
	</center>
</body>
</html>