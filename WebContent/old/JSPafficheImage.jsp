<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>

<%@include file="head.jsp" %>  

<body>
	
	<%@include file="message.jsp" %>
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
		<legend>Image</legend>
		<ul class="polaroids large-block-grid-4 small-block-grid-2">
			<c:forEach var="item" items="${images}">
				<li>
					<a title="${item.nomImage}">
						<img style="float: left" width="200px" height="200px" alt="${item.nomImage}" src="image/${item.urlImage}"/></img>
					</a>
				</li>
			</c:forEach>
		</ul>
		
	</fieldset>
	
	</body>
	
	<script>
		
	</script>
</html>