<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  

<c:if test="${fn:length(userInfo.commentaires) == 0}">
	<p>Vous n'avez pas encore ajouté de commentaires !</p>
</c:if>

<div class="form-horizontal">
	<fieldset>
		<legend>Liste de vos commentaires</legend>
		<c:forEach var="item" items="${userInfo.commentaires}">
			<div class="row" style="border: 1px dashed white; margin: 0 0 5px 0; padding: 5px 0 0 0">
				<div class="col-md-6">
					<!-- Button -->
					<div class="form-group">
					  <label class="col-md-5 control-label" for="singlebutton">Modifer le commentaires : </label>
					  <div class="col-md-4">
						<c:set var="shortDesc" value="${fn:substring(item.commentaire, 0, 30)}" />
					    <a href="SRVLTLinkToRealProfil?parametre=CommentairesModif&comModif=${item.idCommentaire}"><button id="singlebutton" name="singlebutton" class="btn btn-primary">${shortDesc}</button></a>
					  </div>
					</div>
				</div>				
				<div class="col-md-6">
					<div class="tt-a tt-fh tt-boxed">
						<span class="tt-w" style="width: auto; max-width: 18em;">
							<span class="tt-fh-tc" style="width:18em;height:14em;">
								<span class="shadow" style="width:18em;height:14em;">
									<a class="" href="SRVLTLinkToRealProfil?parametre=ImagesModif&imgModif=${item.image.idImage}" title="${item.image.nomImage}">
										<div class="tinythumb scaledown" style="box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.4), 0px 0px 0px 1px rgba(0, 0, 0, 0.15);width: 18em;height: 14em;background-image: url('image/${item.image.urlImage}');"></div>
									</a>
								</span>
							</span>
							<span class="details">
								<a href="SRVLTAfficheImage?img=${item.image.idImage}" class="t" title="His Sanctuary by Jon-Lock, Jan 24, 2015">
									<span class="tt-fh-oe">${item.image.nomImage}</span>
								</a>
								<small>
									<span class="category">
										<span class="age">Ajoutée le : ${item.image.imageDateAjout}</span>
									</span>
								</small>
							</span>
						</span>
					</div>
				</div>	
			</div>
		</c:forEach>
	</fieldset>
</div>