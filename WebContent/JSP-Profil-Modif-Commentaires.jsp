<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  


<form class="form-horizontal" method="POST" action="SRVLTProfilMajUnCommentaire">
	<fieldset>
	
	<!-- Form Name -->
	<legend>Commentaire sur l'image ${coms.image.nomImage}</legend>
	
	<!-- Textarea -->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textarea">Detail</label>
	  <div class="col-md-4">                     
	    <textarea class="form-control" id="textarea" name="newCom">${coms.commentaire}</textarea>
	  </div>
	</div>
	
	<input style="display: none;" value="${coms.idCommentaire}" name="idComs" />
	
	<!-- Button -->
	<div class="form-group">
		<div class="col-md-4">
			<button id="singlebutton" name="singlebutton" class="btn btn-primary" type="submit">Validez le changement</button>
		</div>
	</div>
	
	</fieldset>
</form>

<form id="formSuppress" action="SRVLTProfilSupprComs" method="POST">
	<input name="idComs" value="${coms.idCommentaire}" style="display:none;"/>
	<input value="Supprimer le commentaire" class="btn btn-danger" type="submit">
</form>
