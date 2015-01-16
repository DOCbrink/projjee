<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style2.css">
<title>Page d'acceuil</title>
</head>
<body>

	<div>
		<img style="float: left; margin-right: 10px;" src="image/logosite.jpeg" width="500px" height="500px" alt="celui qui lit ça est un con !"></img>
		<div style="width: 700px; float: left; margin-right: 10px; margin-top: 150px">
			<h1>Bienvenue sur JAVART</h1>
		</div>
	</div>

	<fieldset style="clear:left;">
		<legend>Action</legend> 
		
		<div>
			<form style="float: left; margin-right: 20px" action="SRVLTAfficheCategorie" method="POST">
				<button name="categorie" type="submit" value="categorie">Voir les catégories</button>
			</form>
			
			<form style="float: left; margin-right: 20px" action="SRVLTAfficheImage" method="POST">
				<button name="choosenCategorie" type="submit" value="all">Voir toutes les images</button>
			</form>
			
			<form style="float: left; margin-right: 20px" action="SRVLTCreerCategorie" method="POST">
				<button type="submit">Créer une nouvelle catégorie</button>
			</form>
			
			<form style="float: left; margin-right: 20px" action="SRVLTLinkToUploadImage" method="POST">
				<button name="insertimage" value="true" type="submit" >Insérer une nouvelle image</button>
			</form>
		</div>
	
	</fieldset>

</body>
</html>