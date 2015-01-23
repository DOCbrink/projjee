<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@include file="head.jsp" %>
	</head>
	<body>
	
	<%@include file="header.jsp" %>
	
	<fieldset>
		<legend>Action</legend> 
		
		<div>
			<form style="float: left; margin-right: 20px" action="SRVLTRetourMenuPrincipal" method="POST">
				<button type="submit" >Retour menu principal</button>
			</form>
			
			<form style="float: left; margin-right: 20px" action="SRVLTAfficheCategorie" method="POST">
				<button name="categorie" type="submit" value="categorie">Voir les catégories</button>
			</form>
			
			<form style="float: left; margin-right: 20px" action="SRVLTAfficheImage" method="POST">
				<button name="choosenCategorie" type="submit" value="all">Voir toutes les images</button>
			</form>
		</div>
	
	</fieldset>
	
	<fieldset>
		<legend>Choisir une catégorie</legend>
		<form method="POST" action="SRVLTAfficheImage">
			<select name="choosenCategorie">
				<option value="all">Voir toutes les images</option>
				<c:forEach var="item" items="${categories}">
					<option value="${item.idCategorie}">${item.nomCategorie}</option>
				</c:forEach>
			</select>
			
			<input type="submit" />
		</form>
	</fieldset>
	
	</body>
	
	<script>
		
	</script>
</html>