<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%-- type.jsp --%>
<div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                </div>
            </div>
            <div class="row">
				<c:forEach items="${productList}"  var="product" varStatus="stat">
				         <div class="col-sm-4 portfolio-item">
				                    <a href="${path }/mainPage.do?action=mainDetail${product.no}" >
				                        <div class="caption">
				                            <div class="caption-content">
				                                <i class="fa fa-search-plus fa-3x"></i>
				                            </div>
				                        </div>
				                        <img src="${path }/img/${product.mainImg}" class="img-responsive" width="400px" height="300px">
				                    </a>
				           </div>
				</c:forEach>
			</div>
</div>