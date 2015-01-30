<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  


<form class="form-horizontal" method="POST" action="SRVLTProfilMajUneCategorie">
	<fieldset>
	
	<!-- Form Name -->
	<legend>Categorie - ${categ.nomCategorie}</legend>
	
	<!-- Text input-->
	<div class="form-group">
		<label class="col-md-4 control-label" for="textinput">Nom de la catégorie</label>  
		<div class="col-md-4">
			<input id="textinput" name="nomCateg" type="text" placeholder="${categ.nomCategorie}" class="form-control input-md">  
		</div>
	</div>
	
	<input style="display: none;" value="${categ.idCategorie}" name="idCateg" />
	
	<!-- Button -->
	<div class="form-group">
		<label class="col-md-4 control-label" for="singlebutton">Single Button</label>
		<div class="col-md-4">
			<button id="singlebutton" name="singlebutton" class="btn btn-primary" type="submit">Validez le changement</button>
		</div>
	</div>
	
	</fieldset>
</form>
