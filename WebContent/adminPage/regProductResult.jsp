<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품등록완료</title>
</head>
<body>
	<center>
		<c:if test="${reg_product_success_flag }">
			<h3>상품등록이 완료되었습니다 :)</h3>
		</c:if>
		<c:if test="${!reg_product_success_flag }">
			<h3><font color="red">상품등록에 실패하였습니다</font></h3>
		</c:if>
		<a href="/Funshop/mainPage/main.do">메인페이지로 이동</a>
	</center>
</body>
</html>