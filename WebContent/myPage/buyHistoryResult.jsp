<%@page import="java.util.Date"%>
<%@page import="com.encore.funshop.vo.BuyHis"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	List<BuyHis> list = (List<BuyHis>)request.getAttribute("list");
	BuyHis pre_buyHis = list.get(0);
	pre_buyHis.setPdetail_name(pre_buyHis.getPdetail_name()+" : "+pre_buyHis.getBuyHis_num()+"개");
	for(int i=1; i<list.size(); i++) {
		BuyHis buyHis = list.get(i);
		buyHis.setPdetail_name(buyHis.getPdetail_name()+" : "+buyHis.getBuyHis_num()+"개");
		int product_no = buyHis.getProduct_no();
		Date buyHis_date = buyHis.getBuyHis_date();
		if(pre_buyHis.getProduct_no() == product_no && pre_buyHis.getBuyHis_date().getTime()/1000000 == buyHis_date.getTime()/1000000) {
			pre_buyHis.setPdetail_name(pre_buyHis.getPdetail_name()+"<br>"+buyHis.getPdetail_name());
			pre_buyHis.setBuyHis_payment(pre_buyHis.getBuyHis_payment()+buyHis.getBuyHis_payment());
			list.remove(i);
			i--;
		} else {
			pre_buyHis = buyHis;
			
		}
	}
%>
<table border="1" style="width: 100%;">
	<tr bgcolor="#E1E6F6" align="center">
		<th>주문번호</th>
		<th colspan="2">상품정보</th>
		<th>결제정보</th>
	</tr>
	<c:forEach var="buyHis" items="${list }">
		<tr align="center">
			<td>${buyHis.buyHis_no }</td>
			<td style="border-right-style: hidden;"><img src="/Funshop/img/${buyHis.product_mainimg }" style="width: 100px; height: 100px"></td>
			<td>
				<b><font size="4px">${buyHis.product_name }</font></b><br>
				${buyHis.pdetail_name }<br>
				<c:if test="${buyHis.buyHis_cond == null }">
					<a href="javascript:cancelOrder();">주문취소</a>
				</c:if>
				<a href="/Funshop/mainPage/review_write.do">리뷰작성</a>
			</td>
			<td>
				${buyHis.buyHis_payType }(${buyHis.buyHis_payInfo })<br>
				${buyHis.buyHis_payment+2500 }원<br><!-- 배송비 2500 -->
				<font size=2><fmt:formatDate value='${buyHis.buyHis_date }' type='both' dateStyle='short' timeStyle='short'/></font>
			</td>
		</tr>
	</c:forEach>
</table>