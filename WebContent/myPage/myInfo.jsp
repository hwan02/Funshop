<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(function() {
		$('[name=question]').val('${userInfo.question }');
	});
	
	function myInfoSubmit() {
		if($('#phone1').val().trim() == '' ||
		   $('#phone2').val().trim() == '' ||
		   $('#phone3').val().trim() == '' ||
		   $('#email1').val().trim() == '' ||
		   $('#email2').val().trim() == '' ||
		   $('#answer').val().trim() == '') {
			alert('변경할 정보를 입력하세요.');
			return;
		} else if($('#pw_old').val() != $('#pw').val()) {
			alert('기존 비밀번호를 확인하세요.');
			return;
		} else if($('#pw_new').val() != $('#pw_new2').val()) {
			alert('변경할 비밀번호가 일치하지 않습니다.');
			return;
		}
		
		if($('#pw_new').val() == '') {
			$('#pw').val($('#pw_old').val());
		} else {
			$('#pw').val($('#pw_new').val());
		}
		
		alert("변경되었습니다 :)");
		document.frm.submit();
	}
	
	function myInfoOut() {
		if($('#pw_old2').val() != $('#pw').val()) {
			alert('비밀번호를 확인하세요.');
			return;
		}
		
		alert('탈퇴되었습니다.');
		location.replace('/Funshop/myPage/userInfoResult.do?action=delete');
	}
</script>
<center>
	<table style="border-collapse: collapse; width: 90%;">
		<tr><td><h1 align="left" style="">회원정보변경</h1><hr></td></tr>
		<tr><td>
			<div id="div_userInfoFrm" style="border: solid 1px; width: 90%">
					<form action="/Funshop/myPage/userInfoResult.do?action=update" method="post" name="frm" id="frm">
						<div class="container">
							<div class="row" id="div_pro">
								<table class="table table-striped">
									<tr>
										<td>ID</td>
										<td colspan="3"><input type="text" id="id" name="id" readonly style="width: 100px" value="${userInfo.id }"></td>
									</tr>
									<tr>
										<td>기존비밀번호</td>
										<td colspan="3">
											<input type="password" id="pw_old" name="pw_old">
											<input type="hidden" id="pw" name="pw" value="${userInfo.pw }">
										</td>
									</tr>
									<tr>
										<td>변경할비밀번호</td>
										<td><input type="password" id="pw_new" name="pw_new" placeholder="변경 희망시 입력하세요"></td>
										<td>비밀번호확인</td>
										<td><input type="password" id="pw_new2" name="pw_new2" placeholder="변경 희망시 입력하세요"></td>
									</tr>
									<tr>
										<td>이름</td>
										<td colspan="3"><input type="text" id="name" name="name" style="width: 80px" readonly value="${userInfo.name }"></td>
									</tr>
									<tr>
										<td>핸드폰</td>
										<td colspan="3">
											<input type="text" id="phone1" name="phone1" maxlength="3" style="width: 45px" value='${userInfo.phone.split("-")[0] }'>-
											<input type="text" id="phone2" name="phone2" maxlength="4" style="width: 50px" value='${userInfo.phone.split("-")[1] }'>-
											<input type="text" id="phone3" name="phone3" maxlength="8" style="width: 50px" value='${userInfo.phone.split("-")[2] }'>
										</td>
									</tr>
									<tr>
										<td>E-Mail</td>
										<td>
											<input type="text" id="email1" name="email1" style="width: 100px" value='${userInfo.email.split("@")[0] }'>
											@ 
											<input type="text" id="email2" name="email2" style="width: 120px" value='${userInfo.email.split("@")[1] }'>
										</td>
									</tr>
									<tr>
										<td>질문</td>
										<td colspan="3">
											<select name="question" id="question">
												<option value="좋아하는 색깔은 무엇입니까?">좋아하는 색깔은 무엇입니까?</option>
												<option value="태어난 곳은 어디입니까?">태어난 곳은 어디입니까?</option>
												<option value="여행가고 싶은 곳은 어디입니까?">여행가고 싶은 곳은 어디입니까?</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>답변</td>
										<td colspan="3"><input type="text" name="answer" id="answer" size="29" value="${userInfo.answer }"></td>
									</tr>
									<tr>
										<td>기본배송지</td>
										<td colspan="3"><input type="text" name="addr" id="addr" size="70" value="${userInfo.addr }" maxlength="100" placeholder="설정 희망시 입력하세요"></td>
									</tr>
								</table>
								<a class="btn btn-primary" href="javascript:myInfoSubmit();" style="margin: 10px;">변경</a>
							</div>
						</div>
				</form>
			</div><br>
		</td></tr>
		
		<tr><td><h1 align="left" style="">회원탈퇴</h1><hr></td></tr>
		<tr><td>
			<div id="div_userInfoFrm" style="border: solid 1px; width: 90%">
				<div class="container">
					<div class="row" id="div_pro">
						<table class="table table-striped">
							<tr>
								<td>비밀번호</td>
								<td colspan="3"><input type="password" id="pw_old2" name="pw_old2"></td>
							</tr>
							<tr>
								<td>탈퇴사유</td>
								<td colspan="3">
									<select name="outQuestion" id="outQuestion">
										<option value="서비스가 마음에 들지 않아서">서비스가 마음에 들지 않아서</option>
										<option value="이용하지 않는 사이트라서">이용하지 않는 사이트라서</option>
										<option value="다른 사이트를 주로 이용해서">다른 사이트를 주로 이용해서</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>기타</td>
								<td colspan="3"><input type="text" name="answer" id="answer" size="29" placeholder="탈퇴 사유를 입력해주세요"></td>
							</tr>
						</table>
						<a class="btn btn-primary" href="javascript:myInfoOut();" style="margin: 10px;">탈퇴</a>
					</div>
				</div>
			</div><br>
		</td></tr>
	</table>
</center>