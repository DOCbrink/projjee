<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  

<form class="form-horizontal" method="POST" action="SRVLTProfilMajUneImage">
	<fieldset>
		<div class="row">
			<div class="col-md-9">
				<!-- Form Name -->
				<legend>Image - ${img.nomImage}</legend>
				
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">Nom</label>  
					<div class="col-md-4">
						<input id="textinput" name="nomImg" type="text" placeholder="${img.nomImage}" class="form-control input-md"> 
					</div>
				</div>
				
				<!-- Textarea -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textarea">Description</label>
					<div class="col-md-4">                     
						<textarea class="form-control" id="textarea" name="descImg">${img.descriptionImage}</textarea>
					</div>
				</div>
				
				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="selectbasic">Catégorie</label>
					<div class="col-md-4">
						<select id="selectbasic" name="categImg" class="form-control">
							<option value="">Ne pas changer la catégorie</option>
							<c:forEach var="item" items="${categ}">
								<option value="${item.idCategorie}">${item.nomCategorie}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				
				<input name="idImg" value="${img.idImage}" style="display:none;"/>
				
				<!-- Button (Double) -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="button1id"></label>
					<div class="col-md-8">
						<button id="singlebutton" name="singlebutton" class="btn btn-primary" type="submit">Valider les changements</button>
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="tt-a tt-fh tt-boxed">
					<span class="tt-w" style="width: auto; max-width: 18em;">
						<span class="tt-fh-tc" style="width:18em;height:14em;">
							<span class="shadow" style="width:18em;height:14em;">
								<a class="" href="SRVLTAfficheImage?img=${img.idImage}" title="${img.nomImage}">
									<div class="tinythumb scaledown" style="box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.4), 0px 0px 0px 1px rgba(0, 0, 0, 0.15);width: 18em;height: 14em;background-image: url('image/${img.urlImage}');"></div>
								</a>
							</span>
						</span>
						<span class="details">
							<a href="SRVLTAfficheImage?img=${img.idImage}" class="t" title="His Sanctuary by Jon-Lock, Jan 24, 2015">
								<span class="tt-fh-oe">${img.nomImage}</span>
							</a>
							<small>
								<span class="category">
									<span class="age">Ajoutée le : ${img.imageDateAjout}</span>
								</span>
							</small>
						</span>
					</span>
				</div>
			</div>
		</div>
	
	</fieldset>
</form>

<form id="formSuppress" action="SRVLTProfilSupprImage" method="POST">
	<input name="idImg" value="${img.idImage}" style="display:none;"/>
	<input value="Supprimer l'image" class="btn btn-danger" type="submit">
</form>

