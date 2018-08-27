<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="icon" href="/Funshop/image/favicon.ico">
<title>Funshop_매출현황</title>
<style type="text/css">
   a:hover {color:red; text-decoration: none;}
</style>
</head>
<%--sales_listForm.jsp--%>
<body class="container">
	<a href="/Funshop/admin_main/main_view.do"><h1 align="center">매출현황</h1></a>
	<hr>
	<table cellpadding="5" class="container">
		<thead>
			<tr bgcolor="skyblue">
				<th>구매금액</th>
				<th>할인금액</th>
				<th>매출(구매-할인금액)</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="sales" items="${list }">
				<tr>
					<td>${sales.buyHis_payment }</td>
					<td>${sales.buyHis_discount }</td>
					<td>${sales.buyHis_payment -sales.buyHis_discount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<hr>
	<table class="container">
		<thead>
			<tr bgcolor="skyblue">
				<th>총매출(구매-할인금액 : 총합)</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="total" value="0" />
			<c:forEach var="sales" items="${list }">
				<c:set var="total" value="${total + (sales.buyHis_payment -sales.buyHis_discount)}" />
			</c:forEach>
		</tbody>
	</table>
	<label><c:out value="${total}" /></label> 
</body>
</html>