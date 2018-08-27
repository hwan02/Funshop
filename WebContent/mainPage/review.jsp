<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- review.jsp --%>
<script type="text/javascript">
	function moveToWritePage() {
		if('${id }' != '') {
			location.href='/Funshop/mainPage/review_write.do';
		} else {
			alert('로그인이 필요합니다.');
		}
	}
	
	
	var showUntil = 1; 
	function showMore() {
		for(var i=showUntil; i<showUntil+5; i++) {
			$('#td_'+i).show();
		}
		showUntil+=5;
	}
	
	$(function() {
		showMore();
	});
</script>
<style>
.re_cont { display: inline-block; width: 350px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
</style>
<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin-top:50px" >
			<thead>
			<tr><td><h1 align="left" style="">리뷰</h1><hr></td></tr>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">번호</th>
				<th style="background-color: #eeeeee; text-align: center;">상품이미지</th>
				<th style="background-color: #eeeeee; text-align: center;">제목</th>
				<th style="background-color: #eeeeee; text-align: center;">작성자</th>
				<th style="background-color: #eeeeee; text-align: center;">작성일</th>
			</tr>
			</thead> 
			<tbody>
				<c:forEach var="review" items="${list }" varStatus="stat">
					<tr id="td_${stat.count }" style="display: none;">
						<td>${list.size()-stat.count+1 }</td>
						<td><img src="/Funshop/img/${review.review_img }" style="width: 100px; height: 100px"></td>
						<td class="re_cont"><a href="/Funshop/mainPage/review_read.do?review_no=${review.review_no}">${review.review_name }</a></td>
						<td>${review.member_id.substring(0, 2)}**${review.member_id.substring(4) }</td>
						<td>${review.review_date }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						<a href="javascript:showMore();" class="btn btn-primary">더보기</a>	
					</td>
				</tr>
			</tfoot>
		</table>
		<a href="javascript:moveToWritePage();" class="btn btn-primary pull-right">글쓰기</a>		
	</div>
</div>
<br>
