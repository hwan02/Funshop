<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(function(){
		$.ajax({
			url:"${path}/mainPage.do?action=image",
			success : function(result){
				$("#portfolio").html(result);
			}
		});
		$("i:first").click(function(){
			$("#portfolio").attr("style=display:none;");
			$.ajax({
				url:"${path}/mainPage.do?action=cloth",
				success:function(result){
					$("#portfolio").html(result);
				}
			});
		});
		$("i#i2").click(function(){
			$("#portfolio").attr("style=display:none;");
			$.ajax({
				url:"${path}/mainPage.do?action=place",
				success:function(result){
					$("#portfolio").html(result);
				}
			});
		});
		$("i#i3").click(function(){
			$("#portfolio").attr("style=display:none;");
			$.ajax({
				url:"${path}/mainPage.do?action=food",
				success:function(result){
					$("#portfolio").html(result);
				}
			});
		});
	});
</script>
<!--****** Carousel ******-->
        <div id="myCarousel" class="carousel slide" data-ride="carousel" align="center">
            <!-- Indicator 표시자 -->
            <!-- 하단에 위치 // 누르면 해당 카드로 넘어감-->
            <ul class="carousel-indicators" id="page-top">
                <!-- TIP: 선택자 -->
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ul>
            <!-- data-slide-to: 해당 Indicator 클릭 시 몇 번째 슬라이드로 넘어갈지 표시
                class="active": 페이지 시작 시 Indicator의 초기값
             -->
            <!-- Wrapper for slides -->
            <!-- 출력할 요소들을 넣어줍니다. -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="${path }/img/cloth_carousel.jpg" alt="cloth" width="1500px"	height="500px">
                    <div class="carousel-caption">
                        <h1>널 위해 준비한 옷</h1>
                        <p>어디 한 번 날아보자</p>
                    </div>
                </div>

                <div class="carousel-item">
                    <img src="${path }/img/place_carousel.jpg" alt="place" width="1500px"	height="500px">
                    <div class="carousel-caption">
                        <h1>오늘 어디갈까</h1>
                        <p>시원하게 뛰어보자</p>
                    </div>
                </div>

                <div class="carousel-item">
                    <img src="${path }/img/food_carousel.jpg" alt="food" width="1500px"	height="500px">
                    <div class="carousel-caption">
                        <h1>뭘 만들지 고민 마세요</h1>
                        <p>적극 추천해드리는 음식</p>
                    </div>
                </div>
                <!-- html은 어떤 상황에도 페이지의 정보를 사용자에게 효과적으로 전달하도록 만들어졌다. -->
                <!-- alt 태그는 주소가 잘못 되었거나 서버에 문제가 있어 이미지를 제대로 불러오지 않을 때
                    본 메시지를 이미지를 대신하여 출력합니다.
                -->
            </div>

            <!-- 좌우 컨트롤 버튼 -->
            <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    <!-- Icons Grid -->
    <section class="features-icons bg-light text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="icon-mustache m-auto text-primary"></i>
              </div>
             <h3>의류</h3>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="icon-map m-auto text-primary" id="i2"></i>
              </div>
              <h3>장소</h3>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="icon-energy m-auto text-primary" id="i3"></i>
              </div>
              <h3>음식</h3>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- 이미지 가져오기 -->
    <section id="portfolio" style="display: ;">
       
    </section>
    