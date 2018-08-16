<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table border="1" style="width: 100%;">
	<tr bgcolor="#E1E6F6">
		<th>주문번호</th>
		<th>날짜</th>
		<th>품번</th>
		<th>결제금액</th>
	</tr>
	<c:forEach var="buyHis" items="${list }">
		<tr align="center">
			<td>${buyHis.buyHis_no }</td>
			<td>${buyHis.buyHis_date }</td>
			<td>${buyHis.product_no }</td>
			<td>${buyHis.buyHis_payment }원</td>
		</tr>
	</c:forEach>
</table>