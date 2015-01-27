<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>

<%@include file="head.jsp" %>  

	<body>
	
		<%@include file="message.jsp" %>
	    <%@include file="header.jsp" %>
	    
		<!-- Main jumbotron for content -->
	    <div class="jumbotron" >
			<div class="today-header">
				<div class="today-date">Vendredi le 1er avril 2022</div>
			</div>
			<div class="shinyheader with-sub">
				<div class="headercontent">
					<ul class="headerlinks"></ul>
					<div class="headlines">
						<h1><i class="fa fa-plus-circle fa-3"></i> Page d'ajout d'image</h1>
						<div class="subtitle">Vous pouvez ci-dessous rajouter une image associée à votre profil.</div>
					</div>
				</div>
			</div>
			<div id="inscription">
				<div class="form">
					<form method="POST" action="SRVLTInsererImage" enctype="multipart/form-data">
						<div class="form-group">
							<label for="name">Nom de l'image</label>
							<input type="text" name="nom_image" class="form-control" id="name" placeholder="Entrez le titre de l'image" required>
						</div>
						<div class="form-group">
							<label for="description">Description de l'image</label>
							<textarea class="form-control" name="desc_image" id="description" placeholder="Décrivez votre image !" required></textarea>
						</div>
						<div class="form-group">
							<label for="cat">Sélectionnez la catégorie</label>
							<select class="form-control" id="cat" name="id_categorie" required>
								<c:forEach var="item" items="${categories}">
									<option value="${item.idCategorie}">${item.nomCategorie}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="file">Sélectionnez le fichier</label>
							<input type="file" id="file" onchange="readURL(this);" name="file" multiple="multiple" required>
						</div>
						<div class="form-group">
							<img style="max-width:200px;max-height:200px;box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.4), 0px 0px 0px 1px rgba(0, 0, 0, 0.15);" id="blah" src="#" alt="Votre image" class="hidden"/>
						</div>
						<button type="submit" name="insertimage" class="btn btn-success">Uploader</button>
					</form>
				</div>
			</div>
	    </div> <!-- /container -->
	
	</body>
</html>