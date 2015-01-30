<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="navfixed" class="navbar-menu-inner-scroll hidden">
	<div style="float:left;">
		<a id="today" class="navbar-menu-item active" href="SRVLTLinkToAccueil">Aujourd'hui</a>
		<a id="categ" class="navbar-menu-item" href="SRVLTAfficheCategorie">Parcourir</a>
	</div>
	<div class="profilconnected" style="float:right;">
		<div class="jump-to-top" style="display:inline-block;margin-right:10px;">
			<a style="outline:none;" href="" class="jump-to-top-icon"><i style="color:#98AA96;" class="fa fa-caret-square-o-up fa-3"></i></a>
		</div>
	</div>
</div>

<nav class="navbar">
	<div id="navtop" class="container">
		<div class="navbar-header">
			<a class="" href="SRVLTLinkToAccueil"><img alt="JavArt" src="img/logo.png"></a>
		</div>
		<div id="navbar">
			<div class="navbar-left navbar-text">
				<c:if test="${statusLogin == 'STATUS_OK'}">
					<span id="submit"><a href="SRVLTLinkToUploadImage" class="navbar-link">Ajouter une image</a></span>
				</c:if>
				<span id="shopping"><a href="SRVLTLinkAndCreationPanier" class="navbar-link"><i class="fa fa-shopping-cart"></i>Panier</a></span>
			</div>
			
			
			<c:choose>
				<c:when test="${statusLogin == 'STATUS_OK'}">
					<form class="profilconnected navbar-right navbar-form" method="GET" action="SRVLTDeconnexion">
						<a style="margin-right:10px;" href="SRVLTLinkToRealProfil"><c:out value="${userco.loginUser}"></c:out></a>
						<button style="margin-top:3px" type="submit" class="btn btn-success">Déconnexion</button>
					</form>
				</c:when>
				
				<c:otherwise>
					<form id="login" class="navbar-form navbar-right" method="POST" action="SRVLTConnexion">
						<div class="form-group">
							<input type="text" placeholder="login" class="form-control" name="login">
						</div>
						<div class="form-group">
							<input type="password" placeholder="Password" class="form-control" name="pwd">
						</div>
						<button type="submit" class="btn btn-success">Connexion</button>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
    </div>
	<div id="navbottom" class="navbar-menu-inner-scroll">
		<a id="todaynav" class="navbar-menu-item active" href="SRVLTLinkToAccueil">Aujourd'hui</a>
		<a id="categnav" class="navbar-menu-item" href="SRVLTAfficheCategorie">Parcourir</a>
	</div>
</nav>