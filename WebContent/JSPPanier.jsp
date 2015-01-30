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
	    <div class="jumbotron" >
			<div class="today-header">
				<div class="today-date">Vendredi le 1er avril 2022</div>
			</div>
			<div class="shinyheader with-sub">
				<div class="headercontent">
					<ul class="headerlinks"></ul>
					<div class="headlines">
						<h1><i class="fa fa-shopping-cart fa-3"></i> Panier</h1>
						<div class="subtitle">Finalisez votre panier ci-dessous.</div>
					</div>
				</div>
			</div>
									
			<div id="download">
				<div class="form">
					<div class="row">
						<c:choose>
							<c:when test="${fn:length(imgchoosen) != 0}">
								<c:forEach var="item" items="${imgchoosen}">							
									<div class="col-md-4">
										<a href="SRVLTRemoveImagePanier?idImg=${item.idImage}">
											<button class="deletebutton" type="button"><span style="color:red" class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
										</a>
										<div class="tt-a tt-fh tt-boxed">
											<span class="tt-w" style="width: auto; max-width: 8em;">
												<span class="tt-fh-tc" style="width:8em;height:6em;">
													<span class="shadow" style="width:8em;height:6em;">
														<a class="" href="SRVLTAfficheImage?img=${item.idImage}" title="${item.nomImage}">
															<div class="tinythumb scaledown" style="box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.4), 0px 0px 0px 1px rgba(0, 0, 0, 0.15);width: 8em;height: 6em;background-image: url('image/${item.urlImage}');"></div>
														</a>
													</span>
												</span>
												<span class="details" style="text-align: center;">
													<a href="SRVLTAfficheImage?img=${item.idImage}" class="t" title="${item.nomImage} by ${item.user.loginUser}, ${item.imageDateAjout}">
														<span class="tt-fh-oe">${item.nomImage} <a href="SRVLTLinkToProfile?idUser=${item.user.idUser}">by ${item.user.loginUser}</a></span>
													</a>
												</span>
											</span>
										</div>
									</div>
								</c:forEach>
								<a href="download/${link}" download="download/${link}">Télécharger le panier</a>
							</c:when>
							
							<c:otherwise>
								<img width="90%" height='90%' src="img/troll_pas_image.png"></img>
								<p>Vous n'avez pas d'images dans le panier, aller vite en <a href="SRVLTLinkToAccueil">chercher</a></p>
							</c:otherwise>
						</c:choose>
						
					</div>
					
				</div>
			</div>
	    </div> <!-- /container -->
	
	</body>
 </html>