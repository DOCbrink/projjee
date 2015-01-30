<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  

<c:if test="${fn:length(userInfo.categories) == 0}">
	<p>Vous n'avez pas encore ajouté de catégories !</p>
</c:if>


<div class="form-horizontal">
	<fieldset>
		<legend>Liste de vos catégories</legend>
		<c:forEach var="item" items="${userInfo.categories}">
			<!-- Button -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="singlebutton">Modifer la catégorie : </label>
			  <div class="col-md-4">
			    <a href="SRVLTLinkToRealProfil?parametre=CategoriesModif&categModif=${item.idCategorie}"><button id="singlebutton" name="singlebutton" class="btn btn-primary">${item.nomCategorie}</button></a>
			  </div>
			</div>
		</c:forEach>
	</fieldset>
</div>