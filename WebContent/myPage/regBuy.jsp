<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(function() {
		$('[name=bt_regBuy_edit]').click(function() {
			$('#regBuy_editForm').show();
			$(this).parent().parent().after(document.getElementById('regBuy_editForm'));
		});
	});
</script>
<center>
	<table style="border-collapse: collapse; width: 90%;">
		<tr><td><h1 align="left" style="">정기구매</h1><hr></td></tr>
		<tr><td>
			<div id="div_regBuyTab" style="border: solid 1px; width: 90%">
				<c:if test="${list == null || list.size() < 1 }">
					<center>
						<br>정기구매 중인 물품이 없습니다<br>
						<a href="shopping.do">할인중인 상품보기☞</a><br><br>
					</center>
				</c:if>
				<c:if test="${list.size() > 0 }">
					<table border="1" style="width: 100%;">
						<tr bgcolor="#E1E6F6">
							<th width="60">번호</th>
							<th>신청일</th>
							<th>상품정보</th>
							<th width="150">신청</th>
						</tr>
					<c:forEach var="regBuy" items="${list }" varStatus="status">
						<tr align="center">
							<td>${status.count }</td>
							<td>${regBuy.regBuy_date }</td>
							<td>${regBuy.product_no }번 상품에 대한 정기구매 정보</td>
							<td><button name="bt_regBuy_edit">수정</button> <button>취소</button></td>
						</tr>
					</c:forEach>
					</table>
				</c:if>
			</div>
		</td></tr>
		<tr style="display: none;" id="regBuy_editForm" align="center"><td colspan="4">
			수량 <input type="text">
			배송일 <input type="date">
			<button>확인</button>
			<button>이번달만 구매중지</button>
		</td></tr>
	</table>
</center>