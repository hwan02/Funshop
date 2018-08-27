<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <script type="text/javascript">
    	$(function(){
    		if("${id}"=="admin") {
    			$("#productEnroll").show();
     			$("#admin_main").show();
    		}
    		
    		 $("input#mainSearch").keyup(function() {
                 var mainSearch = $(this).val();
                 if(mainSearch=='') { 
                     $("#display").hide();
                 } else {    
                     $.ajax({
                     url: "/Funshop/mainPage.do?action=search",
                     data: {mainSearch : mainSearch},
                     success:function(result){
                    	   // alert(result);
							var words = result.split("|");
							var count = words[0];
 							$("#display").empty();
							if(count>0){
							$.each(words[1].split(','),function(index, value){
								var name = value.split(':')[0];
								var no = value.split(':')[1];
								$("#display").append($('<a href="javascript:goMainDetail('+no+')">'+name+'</a><br>')).show();
							})
							}
						}
                     });
                 }
             });
     		 $(".container").click(function() {
    			 $("#display").hide();
    		 });
         });
    	
    	function logout() {
    		alert('로그아웃 되었습니다.');
    		location.replace('/Funshop/login.do?action=logout');
    	}
    	
    	function goMainDetail(no) {
    		location.href = '/Funshop/mainPage.do?action=mainDetail'+no;
    	}
    </script>       
</head>
<body>
 <!-- Navigation -->
    <nav class="navbar navbar-light bg-light fixed-top" >
      <div class="container">
      	<input type="hidden"  id="page-top">
        <a class="navbar-brand" href="/Funshop/mainPage/main.do"><b><font size="5px">Funshop</font></b></a>
        <div style="position: relative;">
        <input type="text"  placeholder="어떤 재미를 원하시나요?" id="mainSearch" style="width: 300px">
        <div id="display"  style="position: absolute; background-color: white; top: 25px; border: 1px solid black; width: 300px; display: none"></div>
         <a class="btn btn-primary" href="javascript:alert('서비스 준비중입니다.')" style="padding-top: 3px; padding-bottom: 3px">찾기</a>
         </div>
         <div>
         <a class="btn btn-primary" href="/Funshop/admin_main/main_view.do" style="display: none" id="admin_main">관리자페이지</a>
         <a class="btn btn-primary" href="/Funshop/myPage/main.do">마이페이지</a>
         <c:if test="${id == null}">
          	<a class="btn btn-primary" href="/Funshop/login.do">로그인</a>
         </c:if>
         <c:if test="${id != null}">
          	<a class="btn btn-primary" href="javascript:logout();">로그아웃</a>
         </c:if>
        <a class="btn btn-primary" href="/Funshop/adminPage/regProductForm.do" style="display: none" id="productEnroll">상품등록</a>
      	</div>
      </div><br>
      <div class="container">
        <a class="navbar-brand" href="javascript:alert('서비스 준비중입니다.')">베스트</a>
        <a class="navbar-brand" href="javascript:alert('서비스 준비중입니다.')">신규상품</a>
        <a class="navbar-brand" href="/Funshop/mainPage/review.do">리뷰</a>
        <a class="navbar-brand" href="/Funshop/userNotice/userNotice.do">공지사항</a>
        <a class="navbar-brand" href="/Funshop/mainPage/event.do">Event</a>
      </div>
    </nav>
</body>
</html>