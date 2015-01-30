<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>
	
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" type="image/png" href="img/favicon.png" />
		<title>JavArt for life</title>
		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/font-awesome.min.css" rel="stylesheet">
		<link href="css/menu.css" rel="stylesheet">
		<link href="css/core.css" rel="stylesheet">
		<link href="css/deviantgallery.css" rel="stylesheet">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/header.js"></script>
	</head>

	<body>
		
		<%@include file="header.jsp" %> 
		<%@include file="message.jsp" %> 
		
		<!-- Main jumbotron for content -->
		<div class="jumbotron" style="">
			<div class="browse-container match-body-height newbrowse">
				<div id="browse-sidemenu" class="browse-left-bar ">
					<div style="" class="browse-left-bar-inner">
						<div class="browse-facet browse-facet-search">
							<div class="noncollapseHeader">Rechercher</div>
							<form id="browse-search-box" class="" method="get" action="SRVLTAfficheImageParTrie">
								<div id="browse-search-ctrl">
									<div class="browse-search-container">
										<input style="position: static; width: 100%; height: 100%; font-size: 12px;" class="browse-search-input" id="searchInput" name="categ" type="text">
									</div>
								</div>
							</form>
						</div>
						<div class="browse-facet browse-facet-order">
							<div class="noncollapseHeader">Option</div>
							<ul>
								<li class="">
									<a href="SRVLTLinkToRealProfil?parametre=profil" class="selected">Mon profil - ${userInfo.loginUser}</a><!-- c'est un magnifique get xD -->
								</li>
								<li class="">
									<a href="SRVLTLinkToRealProfil?parametre=images" class="">Mes images</a>
								</li>
								<li class="">
									<a href="SRVLTLinkToRealProfil?parametre=categories" class="">Mes catégories</a>
								</li>
								<li class="">
									<a href="SRVLTLinkToRealProfil?parametre=commentaires" class="">Mes commentaires</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="browse-content with-sidemenu" style="margin-top:10px;">
					<div class="container">
						<c:out value="${parametre}"></c:out>
						
						<c:if test="${parametre == 'profil'}">
							<%@include file="JSP-Profil-Options.jsp" %> 
						</c:if>
						
						<c:if test="${parametre == 'images'}">
							<%@include file="JSP-Profil-Images.jsp" %> 	
						</c:if>
						
						<c:if test="${parametre == 'imagesModif'}">
							<%@include file="JSP-Profil-Modif-Images.jsp" %> 	
						</c:if>
						
						<c:if test="${parametre == 'categories'}">
							<%@include file="JSP-Profil-Categories.jsp" %>
						</c:if>
						
						<c:if test="${parametre == 'categoriesModif'}">
							<%@include file="JSP-Profil-Modif-Categories.jsp" %>
						</c:if>
			
						<c:if test="${parametre == 'commentaires'}">
							<%@include file="JSP-Profil-Commentaires.jsp" %>
						</c:if>
						
						<c:if test="${parametre == 'commentairesModif'}">
							<%@include file="JSP-Profil-Modif-Commentaires.jsp" %>
						</c:if>
					</div>
				</div>
			</div>
		</div>
							

				
	</body>
 	<script>
    	var today = document.getElementById("today");
		today.className = ""; 
		today.className = "navbar-menu-item";
		var categ = document.getElementById("categ");
		categ.className = "";
		categ.className = "navbar-menu-item";
		var todaynav = document.getElementById("todaynav");
		todaynav.className = ""; 
		todaynav.className = "navbar-menu-item";
		var categnav = document.getElementById("categnav");
		categnav.className = "";
		categnav.className = "navbar-menu-item";
	</script>
</html>