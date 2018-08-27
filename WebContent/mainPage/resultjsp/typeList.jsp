<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%-- typeList.jsp --%>
<%-- ${detailType} --%>
<c:forEach items="${typeList}" var="type">
	<c:choose>
		<c:when test="${detailType==type}">
			<option selected>${type}</option>
		</c:when>
		<c:otherwise>
			<option>${type}</option>
		</c:otherwise>
	</c:choose>
</c:forEach>
