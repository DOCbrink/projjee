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
			<div id="output">
				<div id="gmi-Gruser" name="gmi-Gruser">
					<div class="catbar" style="height: 65px;">
						
						<img style="margin-left:20px;vertical-align: inherit !important;" class="avatar float-left" src="img/userco.png">
						<a style="padding-left: 5px;outline:none;font: bold 18pt Trebuchet MS,sans-serif;letter-spacing: -1px;color:#121516 !important;" class="u regular username" href="http://alicecarrollart.deviantart.com">
							Profile de : ${userprofile.loginUser}
						</a>
						<h1 style="bottom:15px;left:45%;position:absolute;text-align:center;font-size:30px;">Gallerie</h1>
					</div>
					
					
					<div style="margin-top:20px;background-color:#D4DFD0;">
						<div class="container">
							<c:if test="${fn:length(imgUser) > 0}">
								<div class="row">
									<div class="col-md-3">
										<div class="tt-a tt-fh tt-boxed">
											<span class="tt-w" style="width: auto; max-width: 18em;">
												<span class="tt-fh-tc" style="width:18em;height:14em;">
													<span class="shadow" style="width:18em;height:14em;">
														<a class="" href="SRVLTAfficheImage?img=${imgUser[0].idImage}" title="${imgUser[0].urlImage}">
															<div class="tinythumb scaledown" style="box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.4), 0px 0px 0px 1px rgba(0, 0, 0, 0.15);width: 18em;height: 14em;background-image: url('image/${imgUser[0].urlImage}');"></div>
														</a>
													</span>
												</span>
												<span class="details">
													<a href="SRVLTAfficheImage?img=${imgUser[0].idImage}" class="t" title="${imgUser[0].nomImage} par ${imgUser[0].user.loginUser}, ${imgUser[0].imageDateAjout}">
														<span class="tt-fh-oe">${imgUser[0].nomImage}</span>
													</a>
													<small>
														<span class="category">
															<span class="age">${imgUser[0].imageDateAjout}</span>
														</span>
														<div class="commentcount">
															<a href="SRVLTAfficheImage?img=${imgUser[0].idImage}">${fn:length(imgUser[0].commentaires)} Commentaires</a>
														</div>
													</small>
												</span>
											</span>
										</div>
									</div>
							</c:if>
						
							<c:if test="${fn:length(imgUser) > 0}">
								<c:forEach begin="1" end="${fn:length(imgUser)-1}" varStatus="loop">
								    <c:choose>
										<c:when test="${loop.current % 4 == 0}">
											</div>
											<div class="row">
												<div class="col-md-3">
													<div class="tt-a tt-fh tt-boxed">
														<span class="tt-w" style="width: auto; max-width: 18em;">
															<span class="tt-fh-tc" style="width:18em;height:14em;">
																<span class="shadow" style="width:18em;height:14em;">
																	<a class="" href="SRVLTAfficheImage?img=${imgUser[loop.current].idImage}" title="${imgUser[loop.current].urlImage}">
																		<div class="tinythumb scaledown" style="box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.4), 0px 0px 0px 1px rgba(0, 0, 0, 0.15);width: 18em;height: 14em;background-image: url('image/${imgUser[loop.current].urlImage}');"></div>
																	</a>
																</span>
															</span>
															<span class="details">
																<a href="SRVLTAfficheImage?img=${imgUser[loop.current].idImage}" class="t" title="${imgUser[loop.current].nomImage} par ${imgUser[loop.current].user.loginUser}, ${imgUser[loop.current].imageDateAjout}">
																	<span class="tt-fh-oe">${imgUser[loop.current].nomImage}</span>
																</a>
																<small>
																	<span class="category">
																		<span class="age">${imgUser[loop.current].imageDateAjout}</span>
																	</span>
																	<div class="commentcount">
																		<a href="SRVLTAfficheImage?img=${imgUser[loop.current].idImage}">${fn:length(imgUser[loop.current].commentaires)} Commentaires</a>
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
																	<a class="" href="SRVLTAfficheImage?img=${imgUser[loop.current].idImage}" title="${imgUser[loop.current].urlImage}">
																		<div class="tinythumb scaledown" style="box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.4), 0px 0px 0px 1px rgba(0, 0, 0, 0.15);width: 18em;height: 14em;background-image: url('image/${imgUser[loop.current].urlImage}');"></div>
																	</a>
																</span>
															</span>
															<span class="details">
																<a href="SRVLTAfficheImage?img=${imgUser[loop.current].idImage}" class="t" title="${imgUser[loop.current].nomImage} par ${imgUser[loop.current].user.loginUser}, ${imgUser[loop.current].imageDateAjout}">
																	<span class="tt-fh-oe">${imgUser[loop.current].nomImage}</span>
																</a>
																<small>
																	<span class="category">
																		<span class="age">${imgUser[loop.current].imageDateAjout}</span>
																	</span>
																	<div class="commentcount">
																		<a href="SRVLTAfficheImage?img=${imgUser[loop.current].idImage}">${fn:length(imgUser[loop.current].commentaires)} Commentaires</a>
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