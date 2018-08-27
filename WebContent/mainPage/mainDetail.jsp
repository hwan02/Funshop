<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>	
<%-- mainDetail.jsp --%>
 <link type="text/css" rel="stylesheet" href="${path }/css/custom.css"> 
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/gds.css" type="text/css">
<div id="bodyClear"></div>
<script type="text/javascript">
		function purchase(){
			if('${id }' == ''){
				alert("로그인이 필요합니다");
				location.href="/Funshop/login.do"; 
			}else if($("#totalAmt").val()==0){
				alert("상품을 선택해주세요!!");
			}else{
				frm.submit();
			}
		};
	$(function(){
		$("#typeSelect").change(function(){
			location="${path}/mainPage/main.do";
		});
		$.ajax({
			url:"${path}/mainPage.do?action=detailType",
			data:{"detailType": "${pro.type}"},
			success:function(result){
				var typeList = result.split(",");
				$("#typeSelect").html(result);
			}
		});
		$("button.minus").click(function(){
			var minus = $("input#ord_qty").val();
			if(minus <2){
				return;
			}
			$("input#ord_qty").val(--minus);
		});
		 $("button.plus").click(function(){
			var plus = $("input#ord_qty").val();
			$("input#ord_qty").val(++plus);
		}); 
		
		$("#selectName").change(function(){
			var selectName = $(this).val();
			$("#inputSelect").attr("value", selectName);
		});
			var cnt1=0;
			var cnt2=0;
		$("#opAdd").click(function(){
			$("table#opTable").append("<tr><th id=optionH"+(cnt1++)+">"+$("#selectName").val()+"</th><td id=optionD"+(cnt2++)+">"+$("#ord_qty").val()+"</td></tr>");
			var price = $("#"+$('#selectName').val()).val();
			$("#totalAmt").text(parseInt($("#totalAmt").text())+parseInt(price));
			$("#hidTotal").val(parseInt($("#totalAmt").text()));
			var optionName = $("#selectName").val(); //옵션명
			var hid_input = $("#hid_"+optionName); 
			var pre_val = parseInt(hid_input.val()); // input hidden의 val 가져오기 
			var plus_val = parseInt($("#ord_qty").val()); // 갯수 가져오기 
			hid_input.val(pre_val+plus_val);	// input hidden의 넣어진 값 + 추가된 갯수 
		});
		$(":button#sns").click(function(){
			$("div#snsModel").show();
		});
	});
</script>
<!-- CONTENT -->
<div id="content" class="content">
	<!-- WRAP -->
	<div class="wrap gds" id="goodsInfoDiv">
	<!-- NAVI -->
		<!-- ROUTE -->
		<div>
			<ul>
				<li><a href="${path}/mainPage/main.do">홈</a></li>
				<li><select id="typeSelect"><option>${pro.type }</option></select></li>
			</ul>
		</div>
		
		<!-- GOODS VIEW -->
		<div class="gds_view" id="gds_view">
			<!-- GOODS IMG. -->
			<div class="gds_img" id="gds_img">
			<c:choose>
				<c:when test="${special==1}">
					<div class="g_sell"><span class="sell"><em>이벤트<br/>특가</em></span></div>
					<div class="g_sell"><span class="sell"><em>NEW</em></span></div>
				</c:when>
				<c:otherwise>
					<div class="g_sell"><span class="sell"><em>FunItem</em></span></div>
				</c:otherwise>
			</c:choose>
				<div class="gd_img_bx">
					 <div class="fade_slide gd_img" >
						<ul class="cont">
							<li class="active" style="background-image: url('${path }/img/${pro.mainImg}');"></li>
						</ul>		
					</div>
				</div>
			</div>
			<!-- //GOODS IMG. -->

			<!-- GOODS INFO -->
			<div class="gds_info" data-price_type_cd="10">
				<!-- NAME -->
				<h2 class="gd_name">${pro.name }</h2>
				<!-- //NAME -->
				
				<!-- TAG -->
				<div class="gd_ico">

	<span class="ico4"><em>${pro.type }</em></span>
				</div>
				<!-- //TAG -->
				<!-- SCORE -->
				<div class="gd_base">
					<div class="g_sns">						
						<button type="button" class="btn_sns" id="sns" >공유</button>
					</div>
				</div>
			<div id="snsModal" class="modal">
					<div class="modal-content">
						<span class="close" style="align-items: right">&times;</span>
						<p>친구들에게 알려볼까요?</p>
						  <ul class="list-inline mb-0">
				              <li class="list-inline-item mr-3">
				                <a href="http://www.facebook.com">
				                  <i class="fa fa-facebook fa-2x fa-fw"></i>
				                </a>
				              </li>
				              <li class="list-inline-item mr-3">
				                <a href="http://www.twitter.com">
				                  <i class="fa fa-twitter fa-2x fa-fw"></i>
				                </a>
				              </li>
				              <li class="list-inline-item">
				                <a href="http://www.instagram.com">
				                  <i class="fa fa-instagram fa-2x fa-fw"></i>
				                </a>
				              </li>
          				  </ul>
					</div>
				</div> 
				<!-- INFO. -->
				<div class="gd_info">
					<dl>
						<dt>판매가
						</dt>
						<dd class="prc">
							<span class="sale"><b>${lowPrice }</b></span>
						</dd>
					</dl>
					<dl>
						<dt>배송정보</dt>
						<dd class="drv">
							<span>택배 <em>08/28(화요일)</em>부터 배송 받으실 수 있습니다.</span>
						</dd>
					</dl>
					<dl>
						<dt class="dt"><label for="ord_qty">수량</label></dt>
						<dd>
							<span class="qty">
								<button type="button" class="minus"  title="제품수량감소" >감소</button>							
								<button type="button" class="plus"  title="제품수량증가">증가</button>							
							</span>
							<input type="number" name="ord_qty" id="ord_qty" value="1" class="input" maxlength="3" min="1" readonly title="제품수량입력"/>
						</dd>
					</dl>
					
					<dl>
						<dt class="dt"><label for="ord_qty">옵션</label></dt>
						
						<dd>
							<div class="gd_set_sort">
								<select id="selectName" >
								<c:forEach items="${pdtailList }" var="pdtail" varStatus="stat">
									<option value="${pdtail.name }">${pdtail.name }--${pdtail.price }</option>
								</c:forEach>
								</select>
								<c:forEach items="${pdtailList }" var="pdtail" varStatus="stat">
									<input type="hidden" id=${pdtail.name } value="${pdtail.price }">
								</c:forEach>
								<input type="hidden"  name="selectName" id="inputSelect" ></input>
								<button id="opAdd" class="btn btn-primary">옵션추가</button>
								<button id="regularBt" class="btn btn-primary">정기구매</button>
								<div id="opShow">
									<table id="opTable">
										
									</table>
								</div>
							</div>
						</dd>
					</dl>
				</div>
				<!-- //INFO. -->
				
				<!-- AMOUNT -->
				<div class="gd_amt">
					<dl>
						<dt>총 제품금액</dt>
						<dd><b id="totalAmt">0</b><em>원</em></dd>
					</dl>
				
				</div>
				<!-- //AMOUNT -->

<script type="text/javascript">
	$(function(){
		$("button#openCart").click(function(){
			if('${id }' == ''){
				alert("로그인이 필요합니다");
				location.href="/Funshop/login.do"; 
			}else{
				$.ajax({
					url:"${path }/myPage/basketResult.do?action=insert",
					data:{
						"product_no": '${pro.no}',
						"member_id":'${id}'
					}
				});
				location.href="/Funshop/myPage/basket.do";
			}
		});
		$("button#purchase").on("click",function(){
			if('${id }' == ''){
				alert("로그인이 필요합니다");
				location.href="/Funshop/login.do"; 
			}else if($("#totalAmt").text()==0){
				alert("상품을 선택해주세요!!");
			}else{
				frm.submit();
			}
		});
		$("button#regularBt").click(function(){
			location.href="${path}/myPage/regBuy.do"
		});
	});
</script>
				<!-- BTN. -->
				<div class="gd_btns">
					<!-- TOOLTIP -->
					<button type="button" class="cart" id="openCart" title="장바구니 상품 알림 레이어 열기" ><em>장바구니</em></button>
					 <form action=" ${path}/mainPage.do" name="frm">
						<c:forEach items="${pdtailList }" var="pdtail" varStatus="stat">
									<input type="hidden" name="${pdtail.name}" value="0"  id="hid_${pdtail.name}" > 
						</c:forEach>
						<input type="hidden" value="directBuy" name="action">
						<input type="hidden" value="${pro.no}" name="productNumber">
						<input type="hidden" id="hidTotal" name="hidTotal">
					</form>
					<button type="button" class="buy"  title="주문하기 페이지 이동" id="purchase" ><em>바로구매</em></button>
				</div>
				<!-- //BTN. -->
			</div>
			<!-- //GOODS INFO -->
		</div>
		<!-- GOODS VIEW -->
		<style>
			.detailClass{
				text-align: center;
				align-content: center;
			}
		</style>
		<!-- GOODS CONTENT -->
			<!-- DETAIL -->
			<div class="detailClass">
				<h3 class="ir">제품 상세정보</h3>
				<div class="gd_detail">
				<p><img alt="" src="${path }/img/${pro.mainImg}" /></p>
				</div>
				<h4>${pro.summary }</h4>
				<p>${pro.description}</p>
				
				<c:forEach items="${pdtailList }" var="pdtail" varStatus="stat">
				<div class="gd_detail">
				<p><img alt="" src="${path }/img/${pdtail.pdImg}" /></p>
				</div>
				<h4>${pdtail.summary }</h4>
				<p>${pdtail.description}</p>
				</c:forEach>
			</div>
		<!-- TAB4 -->
		<div class="gds_cont" id="gds_cont4">
			<div class="gd_noti">
				<h3>주문 전 꼭 확인해 주세요</h3>
				<div class="g_noti bg_car">
					<ul>
						<li>최소 구매액은 10,000원(기본 포장 비용) 부터 가능합니다.</li>

						<li>결제금액 기준 
							<span>배송비는 할인금액 적용한 일반 택배는 2,500원 /수도권 새벽직배송은 2,900원이 부가 됩니다.</span> 
						</li>

						<li>주문마감 이전에 결제 완료시, 지정하신 희망배송일에 받을 수 있습니다. 
							<span>
								주문 마감 이전에 결제 완료시, 지정하신 희망배송일에 받을 수 있습니다.<br/>
								단, 월요일에는 일반 택배사 휴무 관계로 인하여 희망배송일로 지정되지 않습니다.<br/><br/>
								새벽직배송의 경우 제품수령일 당일 오전 7시까지 받으실 수 있습니다.<br/>
								(교통사항, 천재지변, 명절특수 등의 경우 변경이 있을 수 있으니 상세확인은 고객센터로 문의해 주세요)
							</span>
						</li>
					</ul>
				</div>
				<h3>취소/반품 주의사항</h3>
				<div class="g_noti">
					<ul>
						<li>주문취소는 주문마감시간 (오전6시) 전까지 취소가 가능합니다.
							<span>주문취소는 MY더반찬 &gt; 주문취소에서 직접 취소 가능합니다.</span>
						</li>
						<li>주문 직접취소가 어려울 경우
							<span>결제/입금 완료된 상태에서 직접취소가 어려우실 경우 고객센터 운영시간 (오전9시~오후6시) 연락주시기 바랍니다.<br/>비회원의 경우 동일하게 고객센터 운영시간에 연락주시면 취소가 가능합니다.</span>
						</li>
						<li>반품정책
							<span>고객의 단순변심으로 교환 및 반품이 되지 않으니 양해바랍니다.</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //TAB4 -->


	</div>
	<!-- WRAP -->
	
</div>
<!-- //CONTENT -->


