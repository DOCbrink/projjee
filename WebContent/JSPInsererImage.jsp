<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/style2.css">
		<title>Insérer une image</title>
	</head>
	<body>
	
	<fieldset>
		<legend>Action</legend> 
		
		<div>
			<form style="float: left; margin-right: 20px" action="SRVLTRetourMenuPrincipal" method="POST">
				<button type="submit" >Retour menu principal</button>
			</form>
		</div>
	
	</fieldset>
	
	<fieldset>
		<legend>Uploader de fichier</legend>
		<form action="SRVLTInsererImage" method="POST" enctype="multipart/form-data">
			<div style="float: left; margin-right: 20px">
				<div>
					<label style="float: left; margin-right: 5px;">Choisir une catégorie</label>
					<select style="float: left; margin-right: 5px; width: 500px"  name="id_categorie">
						<c:forEach var="item" items="${categories}">
							<option value="${item.idCategorie}">${item.nomCategorie}</option>
						</c:forEach>
					</select>
				</div>
				
				<div style="clear: left">
					<label style="float: left; margin-right: 5px;">Titre</label>
					<input type="text" name="nom_image" />
				</div>
				
				<div style="clear: left">
					<label style="float: left; margin-right: 5px;">Description</label>
					<textarea name="desc_image"></textarea>
				</div>
			</div>
			
			<div style="float: left">
				<input type="file" name="file" size="1024" multiple="multiple"/>
				<input type="submit" name="insertimage" value="Upload Fichier" />
			</div>
		</form>
	</fieldset>
	
	</body>
	
	<script>
		
	</script>
</html>