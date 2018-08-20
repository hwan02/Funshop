<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(function() {
		$('[name=bt_basket_delete]').click(function() {
			if(!confirm('정말 삭제 하시겠습니까?')) { return; }
			var tr = $(this).parent().parent();
			$.ajax({
				url:"/Funshop/myPage/basketResult.do",
				data:{ "action" : "delete",
					   "basket_no" : tr.attr("id").substr(3)},
				success:function() {
					tr.remove();
				},
				error:function() {
					alert('서버 점검중 입니다. 나중에 다시 시도하세요');
				}
			});
		});
	});
</script>
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
							<th colspan="2">상품정보</th>
							<th width="180">신청</th>
						</tr>
					<c:forEach var="basket" items="${list }" varStatus="status">
						<tr align="center" id="tr_${basket.basket_no }">
							<td>${status.count }</td>
							<td style="border-right-style: hidden;"><img src="/Funshop/upload/image/${map.get(basket.product_no).getProduct_mainImg() }" style="width: 100px; height: 100px"></td>
							<td>
								<b><font size="4px">${map.get(basket.product_no).getProduct_name() }</font></b><br>
								${map.get(basket.product_no).getProduct_summary() }<br>
							</td>
							<td><button>바로구매</button> <button name="bt_basket_delete">삭제</button></td>
						</tr>
					</c:forEach>
					</table>
				</c:if>
			</div>
		</td></tr>
	</table>
</center>