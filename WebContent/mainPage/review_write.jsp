<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(function() {
		$('#toReview').click(function() {
			location.replace('/Funshop/mainPage/review.do');
		});
	});
</script>
<br>
<form method="post" enctype="multipart/form-data" action="/Funshop/mainPage/reviewAction.do?action=insert">
	<div class="container">
		<div class="row" >
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd " >
				<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">게시글 작성</th>
				</tr>
				</thead> 
				<tbody>
					<tr>
						<td>
						<label for="reviewName">제목</label><input type="text" class="form-control" placeholder="제목을 입력해주세요" name="review_name" maxlength="50" required></td>
					</tr>
					<tr>
						<td><textarea type="text" class="form-control" placeholder="내용을 입력해주세요" name="review_content" maxlength="1000" style="height: 200px;" required></textarea>
					</tr>
					<tr class="">
						<td scope="row">이미지 <input name="review_img" type="file" required/></td>
	           	   </tr>
				</tbody>		
			</table>
				<input type="button" id="toReview" class="btn btn-primary pull-left" value="목록"></input>
				<input type="submit"  id="addReview" class="btn btn-primary pull-right" value="등록"></input>
		</div>
	</div>
	<input type="hidden" name="member_id" value="${id }">
</form>
<br>

