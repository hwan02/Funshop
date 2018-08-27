<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function() {
		$('#toReview').click(function() {
			location.href('/Funshop/mainPage/review.do');
		});	
	});
	
	function deleteReview(review_no) {
		if(confirm('정말 삭제하시겠습니까?')) {
			alert('삭제되었습니다.');
			location.href = '/Funshop/mainPage/reviewAction.do?action=delete&review_no='+review_no;
		}
	}
</script>
<br>
<form method="post" enctype="multipart/form-data" action="/Funshop/mainPage/reviewAction.do?action=insert">
	<div class="container">
		<div class="row" >
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd " >
				<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">${review.review_name }</th>
				</tr>
				</thead> 
				<tbody>
					<tr>
						<td>
							<div align="left" style="display: inline; float:left;">${review.review_date }</div>
							<div align="right">작성자 ${review.member_id.substring(0, 2)}**${review.member_id.substring(4) }</div>
						</td>
					</tr>
					<tr>
						<td>
							<img alt="사진 없음" src="/Funshop/img/${review.review_img } " style="width: 500px; height: auto"><br>
							<br>${review.review_content }
						</td>
					</tr>
				</tbody>		
			</table>
				<input type="button" id="toReview" class="btn btn-primary pull-left" value="목록"></input>
				<c:if test='${review.member_id.equals(id) || (id!=null && id.equals("admin"))}'>
					<input type="button" class="btn btn-primary pull-left" value="삭제" onclick="deleteReview(${review.review_no })"></input>
				</c:if>
		</div>
	</div>
</form>
<br>

