<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  

<c:if test="${not empty status}">
	<c:choose>
		<c:when test="${status == 'SUCCESS'}">
			<div class="alert alert-success alert-dismissible fade in message sucessMessage" role="alert">
		</c:when>
	
		<c:otherwise>
			<div class="alert alert-warning alert-dismissible fade in message failMessage" role="alert">	
		</c:otherwise>
	</c:choose>
	
				<c:out value="${message}"></c:out>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
</c:if>