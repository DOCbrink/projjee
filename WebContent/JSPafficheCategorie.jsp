<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<div class="jumbotron">
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
							<div class="noncollapseHeader">Trier</div>
							<ul>
								<li class="">
									<a href="SRVLTAfficheImageParTrie?categ=new" class="selected">Nouveauté</a><!-- c'est un magnifique get xD -->
								</li>
								<li class="">
									<a href="SRVLTAfficheImageParTrie?categ=nom" class="">Nom</a>
								</li>
								<li class="">
									<a href="SRVLTAfficheImageParTrie?categ=taille" class="">Taille</a>
								</li>
							</ul>
						</div>
						<div class="browse-facet browse-facet-category">
							<div class="noncollapseHeader">Catégories</div>
							<ul>
								<c:forEach var="item" items="${categories}">
									<li class="">
										<a class="cat-depth-0" href="SRVLTAfficheImageParTrie?categ=${item.idCategorie}">${item.nomCategorie}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="browse-content with-sidemenu" style="margin-top:10px;">
					<div class="container">
						<c:if test="${fn:length(images) > 0}">
							<div class="row">
								<div class="col-md-3">
									<div class="tt-a tt-fh tt-boxed">
										<span class="tt-w" style="width: auto; max-width: 18em;">
											<span class="tt-fh-tc" style="width:18em;height:14em;">
												<span class="shadow" style="width:18em;height:14em;">
													<a class="" href="SRVLTAfficheImage?img=${images[0].idImage}" title="${images[0].nomImage}">
														<div class="tinythumb scaledown" style="box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.4), 0px 0px 0px 1px rgba(0, 0, 0, 0.15);width: 18em;height: 14em;background-image: url('image/${images[0].urlImage}');"></div>
													</a>
												</span>
											</span>
											<span class="details">
												<a href="SRVLTAfficheImage?img=${images[0].idImage}" class="t" title="His Sanctuary by Jon-Lock, Jan 24, 2015">
													<span class="tt-fh-oe">${images[0].nomImage}</span>
												</a>
												<small>
													<span class="category">
														<span class="age">Ajoutée le : ${images[0].imageDateAjout}</span>
													</span>
													<div class="commentcount">
														<a href="SRVLTLinkToProfile?idUser=${images[0].user.idUser}">auteur : ${images[0].user.loginUser}</a>
													</div>
												</small>
											</span>
										</span>
									</div>
								</div>
						</c:if>
						
						<c:if test="${fn:length(images) > 0}">
							<c:forEach begin="1" end="${fn:length(images)-1}" varStatus="loop">
							    <c:choose>
									<c:when test="${loop.current % 4 == 0}">
										</div>
										<div class="row">
											<div class="col-md-3">
												<div class="tt-a tt-fh tt-boxed">
													<span class="tt-w" style="width: auto; max-width: 18em;">
														<span class="tt-fh-tc" style="width:18em;height:14em;">
															<span class="shadow" style="width:18em;height:14em;">
																<a class="" href="SRVLTAfficheImage?img=${images[loop.current].idImage}" title="${images[loop.current].nomImage}">
																	<div class="tinythumb scaledown" style="box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.4), 0px 0px 0px 1px rgba(0, 0, 0, 0.15);width: 18em;height: 14em;background-image: url('image/${images[loop.current].urlImage}');"></div>
																</a>
															</span>
														</span>
														<span class="details">
															<a href="SRVLTAfficheImage?img=${images[loop.current].idImage}" class="t" title="His Sanctuary by Jon-Lock, Jan 24, 2015">
																<span class="tt-fh-oe">${images[loop.current].nomImage}</span>
															</a>
															<small>
																<span class="category">
																	<span class="age">Ajoutée le : ${images[loop.current].imageDateAjout}</span>
																</span>
																<div class="commentcount">
																	<a href="SRVLTLinkToProfile?idUser=${images[loop.current].user.idUser}">auteur : ${images[loop.current].user.loginUser}</a>
																</div>
															</small>
														</span>
													</span>
												</div>
											</div>
									</c:when>
									
									<c:otherwise>
										<div class="col-md-3">
											<div class="tt-a tt-fh tt-boxed">
												<span class="tt-w" style="width: auto; max-width: 18em;">
													<span class="tt-fh-tc" style="width:18em;height:14em;">
														<span class="shadow" style="width:18em;height:14em;">
															<a class="" href="SRVLTAfficheImage?img=${images[loop.current].idImage}" title="${images[loop.current].nomImage}">
																<div class="tinythumb scaledown" style="box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.4), 0px 0px 0px 1px rgba(0, 0, 0, 0.15);width: 18em;height: 14em;background-image: url('image/${images[loop.current].urlImage}');"></div>
															</a>
														</span>
													</span>
													<span class="details">
														<a href="SRVLTAfficheImage?img=${images[loop.current].idImage}" class="t" title="His Sanctuary by Jon-Lock, Jan 24, 2015">
															<span class="tt-fh-oe">${images[loop.current].nomImage}</span>
														</a>
														<small>
															<span class="category">
																<span class="age">Ajoutée le : ${images[loop.current].imageDateAjout}</span>
															</span>
															<div class="commentcount">
																<a href="SRVLTLinkToProfile?idUser=${images[loop.current].user.idUser}">auteur : ${images[loop.current].user.loginUser}</a>
															</div>
														</small>
													</span>
												</span>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
						<c:if test="${fn:length(images) % 4 != 0}">
							</div>
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
		categ.className = "navbar-menu-item active";
		var todaynav = document.getElementById("todaynav");
		todaynav.className = ""; 
		todaynav.className = "navbar-menu-item";
		var categnav = document.getElementById("categnav");
		categnav.className = "";
		categnav.className = "navbar-menu-item active";
	</script>
</html>