<%@page import="org.apache.jasper.runtime.PageContextImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%-- buyhis.jsp --%>
<script>
$(function(){
			$("#card").hide();
			$("#noBank").hide();
			$("#stream").hide();
		$("button#cardBt").click(function(){
			$("#card").show();
			$("#noBank").hide();
			$("#stream").hide();
			var t= $(this).val();
			$("#buyHis_payType").val(t);
		});
		$("button#noBankBt").click(function(){
			$("#noBank").show();
			$("#card").hide();
			$("#stream").hide();
			var t= $(this).val();
			$("#buyHis_payType").val(t);
		});
		$("button#streamBt").click(function(){
			$("#card").hide();
			$("#noBank").hide();
			$("#stream").show()
			var t= $(this).val();
			$("#buyHis_payType").val(t);
		});
		$("#strong").text(parseInt('${hidTotal }')+2500)
		$("span#fee").text(parseInt('${hidTotal }')+2500)
		$("span#lastPrice").text(parseInt('${hidTotal }')+2500)
		$("#buyAddr").click(function() {
			$(this).val('');
		});
	});
</script>
<center>
<div style="margin-top:20px;"></div>
<div class="titleArea">
    <h2>주문서작성</h2>
</div>
<hr>
<h2>상품 주문내역</h2>
<table border="1" summary="">
<colgroup>
<col style="width:27px" class=""/>
<col style="width:92px"/>
<col style="width:200px"/>
<col style="width:98px"/>
<col style="width:75px"/>
<col style="width:98px"/>
<col style="width:98px"/>
</colgroup>
<thead><tr>
<th scope="col" class=""><input type="checkbox" /></th>
                        <th scope="col">이미지</th>
                        <th scope="col">상품정보</th>
                        <th scope="col">판매가</th>
                        <th scope="col">수량</th>
                        <th scope="col">배송비</th>
                        <th scope="col">합계</th>
                    </tr></thead>
<tfoot class="right"><tr>
<td class=""></td>
                        <td colspan="8">
상품구매금액 <strong>${hidTotal }</strong> + 배송비 2,500 <span class="displaynone"> - 상품할인금액 0 </span> = 합계 : <strong class="txtEm gIndent10"><span id="fee" class="txt18">261,400</span></strong> <span class="displaynone"></span>
</td>
                    </tr></tfoot><tbody class="xans-element- xans-order xans-order-normallist center"><tr class="xans-record-">
<td class=""><input type="checkbox"  /></td>
                        <td class="thumb"><a href="${path }/mainPage.do?action=mainDetail${pro.no}"><img src="${path }/img/${pro.mainImg}" alt="${pro.name }" width="100px" height="100px"/></a></td>
                        <td class="left">
                            <a href=""><strong>${pro.name }</strong></a>
                            <div class="option ">
										<c:forEach items="${list }" var="op">
											${op.opName } - ${op.opNum }
										</c:forEach>
							</div>
                        </td>
                        <td class="right">
						<strong>${hidTotal}</strong><p class="displaynone"></p>
                        </td>
                        <td>${productNum}</td>
                        <td><div class="txtInfo">2,500원<br/></div></td>
                        <td class="right">
							<strong id="strong"></strong><div class="displaynone"></div>
						</td>
                    </tr>
</tbody>
</table>
<hr>
<!-- 주문 정보 -->
<div class="orderArea  ec-shop-ordererForm">
        <div class="title">
            <h3>주문 정보</h3>
        </div>
            <table border="1" summary="">
            <colgroup>
				<col style="width:139px;"/>
				<col style="width:auto;"/>
			</colgroup>
<tbody class="address_form  ">
<tr>
<th scope="row">주문하시는 분 </th>
                    <td><input id="oname" name="oname" placeholder="" size="15" value="" type="text"  /></td>
                </tr>
<tr class="">
<th scope="row">주소</th>
                    <td>
                        <input placeholder="" size="40" value="주소를 입력해주세요." type="text" id="buyAddr"/> 
                    </td>
                </tr>
</tbody>
</table>
<hr>
        <h3>결제수단</h3>
		<button id="cardBt" value="카드결제" type="button">카드결제</button> 
		<button id="streamBt" value="실시간계좌이체" type="button">실시간계좌이체</button> 
		<button id="noBankBt" value="무통장입금" type="button">무통장입금</button> 
		<input type="hidden" id="payType">
		<input type="hidden" id="payInfo">
		<div id="showBt">
		 <!-- 카드결제 -->
                <table border="1" summary="" id="card" >
	                <colgroup>
					<col style="width:139px"/>
					<col style="width:auto"/>
					<col style="width:auto"/>
					</colgroup>
					<tbody>
						<tr>
						<th scope="row">카드명</th>
						 <td><select>
						                        		<option>::::선택해주세요::::</option>
						                        		<option>신한은행</option>
						                        		<option>우리은행</option>
						                        		<option>국민은행</option>
						                        		<option>카카오뱅크</option>
						                        		<option>IBK기업은행</option>
						                        		<option>케이뱅크</option>
						                        		<option>하나은행</option>
						                        	</select></td>
						</tr>
						<tr>
						<th scope="row">카드번호</th>
						                        <td>
						                        	<input type="text" placeholder="- 없이 번호만 입력">
						                        </td>
						                    </tr>
						<tr>
						<th scope="row">할부</th>
						                        <td>
						                        <select id="monthly">
						                        	<option>::::선택해주세요::::</option>
						                        		<option>일시불</option>
						                        		<option>2개월</option>
						                        		<option>3개월</option>
						                        		<option>4개월</option>
						                        		<option>5개월</option>
						                        		<option>6개월</option>
						                        		<option>9개월</option>
						                        		<option>12개월</option>
						                        </select>
						                        </td>
						                    </tr>
					</tbody>
			</table>
		 <!-- 무통장입금 -->
                <table border="1" summary="" id="noBank">
	                <colgroup>
					<col style="width:139px"/>
					<col style="width:auto"/>
					</colgroup>
					<tbody>
						<tr>
						<th scope="row">입금자명</th>
						 <td><input type="text"  id="noBankInfo"></td>
						</tr>
						<tr>
						<th scope="row">입금은행</th>
						                        <td>
						                        	<select>
						                        		<option>::::선택해주세요::::</option>
						                        		<option>신한은행:110-261-947620 서승환</option>
						                        	</select>
						                        </td>
						                    </tr>
					</tbody>
			</table>
<!-- 실시간 계좌이체 --><table border="1" summary="" id="stream" >
                <colgroup>
<col style="width:139px"/>
<col style="width:auto"/>
</colgroup>
<tbody><tr>
<th scope="row">예금주명</th>
                        <td><input type="text" id="streamInfo"></td>
                    </tr>
					<tr>
<th scope="row">에스크로</th>
                        <td><input type="checkbox" colspan="2" >구매안전 서비스 이용</td>
                     </tr>
                    </tbody>
</table>
		</div>
<script type="text/javascript">
$(function(){
	$("button#payment").on("click",function(){
		$("#paymentModal").show();
		 var allData = {
					"member_id": '${id}',
					"buyHis_addr" : $("#buyAddr").val(),
					"buyHis_payType" : $("#buyHis_payType").val(),
					"buyHis_payInfo" : $("#buyHis_payInfo").val()
					};  
					$.ajax({
						url: "${path}/mainPage.do?action=payment",
						data: allData
					});
	});
	$("#buyAddr").on("keyup",function(){
		$("#buyHis_addr").val($(this).val());
	})	;	
	$("#streamInfo").on("keyup",function(){
		$("#buyHis_payInfo").val($(this).val());
	})	;	
	$("#noBankInfo").on("keyup",function(){
		$("#buyHis_payInfo").val($(this).val());
	})	;	
	$("#monthly").change(function(){
		$("#buyHis_payInfo").val($(this).val());
	});	
	$("span#close").click(function(){
		$("#paymentModal").hide();
	});
	$("button#check").click(function(){
		$("#paymentModal").hide();
		location="${path}/myPage/main.do";
	});
	$("button#check1").click(function(){
		$("#paymentModal").hide();
		location="${path}/mainPage/main.do";
	});
});
</script>
	<div id="paymentLast"></div>
		<div>
			<p>최종결제 금액<br><span id="lastPrice"></span> </p>
					<button id="payment" >결제하기</button>	
			<div id="paymentModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<p>결제가 완료되었습니다.</p>
				<button class="btn btn-primary" id="check1" type="button" ><b>메인페이지로이동</b></button>
				<button class="btn btn-primary" id="check" type="button" ><b>마이페이지로 이동</b></button>
			</div>
						<input type="hidden" name="buyHis_payType" value="0" id="buyHis_payType">
						<input type="hidden" name="buyHis_payInfo" value="0" id="buyHis_payInfo">
			
				<%-- <form action="${path}/mainPage.do"  	id="form">
						<input type="hidden" name="member_id" value="${id}" >
						<input type="hidden" name="buyHis_addr" value="0" id="buyHis_addr">
						<input type="hidden" name="action" value="payment" id="buyHis_payInfo">
				</form> --%>
		</div>
        </div>