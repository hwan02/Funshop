<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<center>
	<table style="border-collapse: collapse; width: 90%;">
		<tr><td><h1 align="left" style="">장바구니</h1><hr></td></tr>
		<tr><td>
			<div id="div_baskTab" style="border: solid 1px; width: 90%">
				<c:if test="${list == null || list.size() < 1 }">
					<center>
						<br>장바구니에 담긴 물품이 없습니다<br>
						<a href="shopping.do">할인중인 상품보기☞</a><br><br>
					</center>
				</c:if>
				<c:if test="${list.size() > 0 }">
					<table border="1" style="width: 100%;">
						<tr bgcolor="#E1E6F6">
							<th width="60">번호</th>
							<th>상품정보</th>
							<th width="180">신청</th>
						</tr>
					<c:forEach var="basket" items="${list }" varStatus="status">
						<tr align="center">
							<td>${status.count }</td>
							<td>${basket.product_no }번 상품에 대한 정보</td>
							<td><button>바로구매</button> <button>삭제</button></td>
						</tr>
					</c:forEach>
					</table>
				</c:if>
			</div>
		</td></tr>
	</table>
</center>