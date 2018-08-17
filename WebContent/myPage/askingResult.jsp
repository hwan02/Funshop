<%@page import="com.encore.util.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
[
	<c:forEach	var="asking" items="${list }" varStatus="stat">
		{ 
		  "asking_no" : ${asking.asking_no},
		  "asking_date" : "<fmt:formatDate value='${asking.asking_date }' type='both' dateStyle='short' timeStyle='short'/>",
		  "member_id_from" : "${asking.member_id_from }",
		  "member_id_to" : "${asking.member_id_to }",
		  "asking_content" : "${Util.toJS(asking.asking_content) }",
		  "asking_check" : "${asking.asking_check }"
		}
	<c:if test="${stat.count < list.size() }">,</c:if>
	</c:forEach>
]
