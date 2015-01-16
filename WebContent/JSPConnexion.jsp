<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/style2.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<title>Connexion</title>
	</head>
	<body>

	<fieldset style="width: 540px; margin-left: auto; margin-right: auto">
		<legend>Connexion</legend>
		<form class="formconnexion" action="SRVLTConnexion" method="POST" >
			<div>
				<label>Pseudo</label>
				<input style="width:500px;" type="text" name="login" />
			</div>
			
			<div>
				<label>Mot de passe</label>
				<input style="width:500px;" type="password" name="pwd" />
			</div>
			
			<input type="submit">
		</form>
		
		<form action="SRVLTInscription" method="POST">
			<label>Pas de compte ? </label>
			<input type="submit" value="Inscrivez vous !" />
		</form>
	</fieldset>

	<img src="image/engrenage-1024x1024.png"></img>

	</body>
</html>