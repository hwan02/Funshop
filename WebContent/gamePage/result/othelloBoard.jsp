<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
[
	<c:forEach var="pos" items="${posList }" varStatus="stat">
		"${pos }"		
	<c:if test="${stat.count < posList.size()}">,</c:if>
	</c:forEach>
]