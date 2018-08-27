<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt"	prefix="fmt" %>
<%-- getImage.jsp --%>
<div class="container">
            <div class="row">
                <div class="col-lg-8 text-center">
                </div>
            </div>
            <div class="row">
				<c:forEach items="${productList}"  var="product" varStatus="stat">
					<c:choose>
						<c:when test="${time1==1&& produc.time.equals('아침')}">
							<div style="border: 15px solid azure">
								<div class="col-sm-4 portfolio-item">
						                    <a href="${path}/mainPage.do?action=mainDetail${product.no}&special=1" >
						                        <div class="caption">
						                            <div class="caption-content">
						                                <i class="fa fa-search-plus fa-3x"></i>
						                            </div>
						                        </div>
						                        <img src="${path }/img/${product.mainImg}" class="img-responsive" width="400px" height="300px">
						                    </a>
						           </div>
					        </div>
						</c:when>
						<c:when test="${time2==1 && product.time.equals('점심')}">
							<div style="border: 15px solid gold">
								<div class="col-sm-4 portfolio-item">
						                    <a href="${path}/mainPage.do?action=mainDetail${product.no}&special=2" >
						                        <div class="caption">
						                            <div class="caption-content">
						                                <i class="fa fa-search-plus fa-3x"></i>
						                            </div>
						                        </div>
						                        <img src="${path }/img/${product.mainImg}" class="img-responsive" width="400px" height="300px">
						                    </a>
						           </div>
					        </div>
						</c:when>
						<c:when test="${time3==1 && product.time.equals('저녁')}">
							<div style="border: 15px solid olive">
								<div class="col-sm-4 portfolio-item">
						                    <a href="${path}/mainPage.do?action=mainDetail${product.no}&special=3" >
						                        <div class="caption">
						                            <div class="caption-content">
						                                <i class="fa fa-search-plus fa-3x"></i>
						                            </div>
						                        </div>
						                        <img src="${path }/img/${product.mainImg}" class="img-responsive" width="400px" height="300px">
						                    </a>
						           </div>
					        </div>
						</c:when>
						<c:otherwise>
				         <div class="col-sm-4 portfolio-item">
				                    <a href="${path}/mainPage.do?action=mainDetail${product.no}" >
				                        <div class="caption">
				                            <div class="caption-content">
				                                <i class="fa fa-search-plus fa-3x"></i>
				                            </div>
				                        </div>
				                        <img src="${path }/img/${product.mainImg}" class="img-responsive" width="400px" height="300px">
				                    </a>
				           </div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
</div>
<!-- Portfolio Modals -->
<c:forEach items="${productList}"  var="product" varStatus="stat">
 <div class="portfolio-modal modal fade" id="portfolioModal${product.no }" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Project Title</h2>
                            <hr class="star-primary">
                        	<%--  <img src="${path }/img/portfolio/${product.mainImg}" class="img-responsive img-centered" alt=""> --%>
                            <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                            <ul class="list-inline item-details">
                                <li>Client:
                                    <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                    </strong>
                                </li>
                                <li>Date:
                                    <strong><a href="http://startbootstrap.com">April 2014</a>
                                    </strong>
                                </li>
                                <li>Service:
                                    <strong><a href="http://startbootstrap.com">Web Development</a>
                                    </strong>
                                </li>
                            </ul>
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 </c:forEach>  
 