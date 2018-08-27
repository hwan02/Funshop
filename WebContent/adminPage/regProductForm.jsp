<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		var pdCnt = 0; //옵션개수
  		var div_pd_last = $("#div_pro");
  		
  		/* 옵션 추가 버튼 */
  		$('#bt_addPd').click(function() {
  			pdCnt++; //옵션개수 카운트
  			
  			var div_pd = $('#div_pd').clone(); //옵션 div 복사
  			div_pd.attr({'id':div_pd.attr('id')+pdCnt}); //복사한div id설정(div_pd1, div_pd2...)
  			div_pd.find('th').text('옵션'+pdCnt); //옵션타이틀 설정(옵션1, 옵션2 ...)
  			div_pd.find('input').each(function() {
  				$(this).attr({'name':$(this).attr('name')+pdCnt}); //입력태그의 name속성 지정(pdName1, pdName2...)
  				if($(this).attr('type') != 'file') $(this).attr({'required':'required'}); //입력태그 required지정
  			});
  			div_pd.find('textarea').attr({'name':div_pd.find('textarea').attr('name')+pdCnt});
  			div_pd.find('textarea').attr({'required':'required'});
  			
  			div_pd_last.after(div_pd); //상품메인폼 또는 마지막 옵션 뒤에 붙히기
  			div_pd.slideDown(); //복사한div 보이기
  			div_pd_last = div_pd; //마지막 옵션을 복사한 div로 설정
  			$("[name=pdCnt]").val(pdCnt); //hidden데이터로 옵션개수 저장
  		});
  		
  		/* 등록 버튼 */
  		$('#bt_reg').click(function() {
  			if(pdCnt == 0) {
  				alert('최소 1개 이상의 옵션이 필요합니다.');
  				return false;
  			} else return true;
  		});
  		
  		/* 취소 버튼 */
		$('#bt_cancel').click(function() {
  			
  		});
  	});
  </script>
</head>
<body><br>
	<form method="post" enctype="multipart/form-data" action="/Funshop/adminPage/regProductAction.do">
		<div class="container">
			<div class="row" id="div_pro">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd " >
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">상품 등록</th>
						</tr>
					</thead> 
					<tbody>
						<tr>
							<td>
								<label for="proName">상품 정보</label>
								<input type="text" class="form-control" placeholder="상품명" name="proName" maxlength="50" required>
								<input type="text" class="form-control" placeholder="요약" name="proSumm" maxlength="50" required>
							</td>
						</tr>
						<tr>
							<td>
								<textarea class="form-control" placeholder="상품 설명" name="proDesc" maxlength="1000" style="height: 300px;"></textarea>
							</td>
						</tr>
		           	   <tr>
							<td>
								<label>상품 분류</label><br>
								<select style="width: 25%;" name="proCat">
									<option>&lt;카테고리&gt;</option>
									<option>의류</option>
									<option>음식</option>
									<option>장소</option>
								</select>
								<select style="width: 25%;" name="proTime">
									<option>&lt;시간&gt;</option>
									<option>아침</option>
									<option>점심</option>
									<option>저녁</option>
								</select>
								<select style="width: 25%;" name="proSeas">
									<option>&lt;계절&gt;</option>
									<option>봄</option>
									<option>여름</option>
									<option>가을</option>
									<option>겨울</option>
								</select>
							</td>
						</tr>
						<tr>
							<td scope="row">
								메인이미지 <input name="proImg" type="file" required/>
							</td>
		           	   </tr>
					</tbody>		
				</table>
			</div>
			<div class="container">
					<input type="button" id="bt_addPd" class="btn btn-secondary" value="옵션추가">
					<input type="submit" id="bt_reg" class="btn btn-primary" value="등록">
					<input type="button" id="bt_cancel"  class="btn btn-primary" value="취소">
			</div>
		</div><br>
		
		<!-- 옵션 -->
		<div id="div_pd" style="display: none">
			<hr style="border: solid black 1px">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd " >
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">옵션</th>
					</tr>
				</thead> 
				<tbody>
					<tr>
						<td>
							<label for="pdName">옵션 정보</label>
							<input type="text" class="form-control" placeholder="옵션명" name="pdName" maxlength="50">
							<input type="text" class="form-control" placeholder="요약" name="pdSumm" maxlength="50">
						</td>
					</tr>
					<tr>
						<td>
							<textarea class="form-control" placeholder="옵션 설명" name="pdDesc" maxlength="1000" style="height: 150px;"></textarea>
						</td>
					</tr>
		           	<tr align="center">
						<td>
							<input type="number" class="form-control" placeholder="가격" name="pdPrice" maxlength="50" style="width: 200px" min="10">
							<input type="number" class="form-control" placeholder="수량" name="pdNum" maxlength="50" style="width: 200px" min="1">
						</td>
					</tr>
					<tr>
						<td scope="row">
							옵션이미지 <input name="pdImg" type="file"/>
						</td>
		        	</tr>
				</tbody>		
			</table>
		</div>
		<input type="hidden" name=pdCnt>
	</form>
</body>
</html>