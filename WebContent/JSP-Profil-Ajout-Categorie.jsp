<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  

<form class="form-horizontal" method="post" action="SRVLTProfilAjoutUneCategorie">
	<fieldset>
	
	<!-- Form Name -->
	<legend>Nouvelle catégorie</legend>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-5 control-label" for="textinput">Nom de la nouvelle catégorie</label>  
	  <div class="col-md-4">
	  	<input id="textinput" name="newCateg" type="text" class="form-control input-md">
	  </div>
	</div>
	
	<!-- Button -->
	<div class="form-group">
	  <div class="col-md-4">
	    <button id="singlebutton" name="singlebutton" class="btn btn-primary" type="submit">Crée la catégorie</button>
	  </div>
	</div>
	
	</fieldset>
</form>
