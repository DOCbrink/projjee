<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  

<form class="form-horizontal" method="POST" action="SRVLTProfilMAJUser">
	<fieldset>
					
		<!-- Form Name -->
		<legend>Mon profil</legend>
		
		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="textinput">Nom</label>  
			<div class="col-md-4">
				<input id="textinput" name="nom" type="text" placeholder="${userInfo.userNom}" class="form-control input-md">  
			</div>
		</div>
					
		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="textinput">Prenom</label>  
			<div class="col-md-4">
				<input id="textinput" name="prenom" type="text" placeholder="${userInfo.userPrenom}" class="form-control input-md"> 
			</div>
		</div>
					
		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="textinput">Pseudo</label>  
			<div class="col-md-4">
				<input id="textinput" name="login" type="text" placeholder="${userInfo.loginUser}" class="form-control input-md"> 
			</div>
		</div>
					
		<!-- Password input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="passwordinput">Nouveau mot de passe</label>
			<div class="col-md-4">
				<input id="passwordinput" name="pwd" type="password" class="form-control input-md">
				<span class="help-block">laissez vide si pas de changement</span>
			</div>
		</div>
		
		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" ></label>
			<div class="col-md-4">
		    	<button id="singlebutton" name="singlebutton" class="btn btn-primary" type="submit">Valider les changements</button>
			</div>
		</div>
					
	</fieldset>
</form>