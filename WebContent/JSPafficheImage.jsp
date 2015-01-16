<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" type="text/css" href="css/style2.css">
		<title>Catégorie</title>
	</head>
	
	<body>
	
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
						<img alt="${item.nomImage}" src="image/${item.urlImage}"/></img>
					</a>
				</li>
			</c:forEach>
		</ul>
		
	</fieldset>
	
	</body>
	
	<script>
		
	</script>
</html>