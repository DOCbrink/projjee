<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>
	
	<%@include file="head.jsp" %>  
	<link href="css/deviantgallery.css" rel="stylesheet">
	<body>
		
		<%@include file="header.jsp" %> 
		<%@include file="message.jsp" %> 
		
		<!-- Main jumbotron for content -->
		<div class="jumbotron">
			<div id="output">
				<div class="dev-page-container bubbleview" style="min-height: 524px;">
					<div class="dev-page-view view-mode-normal cursor-zoom-in">
						<div class="dev-view-meta">
							<div class="dev-view-meta-content">
								<div class="dev-meta-actions" style="margin-top:10px;">
									<a class="dev-page-button dev-page-button-with-text dev-page-download" href="SRVLTAjoutImagePanier?idImg=${img.idImage}">
										<i class="glyphicon glyphicon-download-alt" style="padding-left: 5px;"></i>
										<span class="panierlabel">Ajouter au panier</span>
										<span class="text">${img.imageDimension }</span>
									</a>
								</div>
								<h3 class="dev-right-bar-title dev-metainfo-title dev-metainfo-details">Détails</h3>
								<div class="dev-right-bar-content dev-metainfo-content dev-metainfo-details ">
									<dl>
										<dt>Ajoutée le </dt>
										<dd><span title="${img.imageDateAjout }">${img.imageDateAjout }</span></dd>
										<dt>Taille de l'image</dt>
										<dd>${size}</dd>
										<dt>Auteur</dt>
										<dd><a href="SRVLTLinkToProfile?idUser=${img.user.idUser}">${img.user.loginUser}</a></dd>
									</dl>            
								</div>
								<hr class="fade-highlight-bar"></hr>
								<h3 class="dev-right-bar-title dev-metainfo-title dev-metainfo-stats">Stats</h3>
								<div class="dev-right-bar-content dev-metainfo-content dev-metainfo-stats">
									<dl>
										<dt>Vue</dt>
										<dd>${img.imageNbView}</dd>
										<dt>Commentaire</dt>
										<dd>${nbComm}</dd>
										<dt>Téléchargée</dt>
										<dd>${img.imageNbDl}</dd>
									</dl>
								</div>
							</div>
						</div>
						<div class="dev-view-deviation">	
							<img style="max-width: 55em; height: auto; top: 0px;" src="image/${img.urlImage}" alt="" class="dev-content-normal">
						</div>
						<div class="dev-view-about">
							<div class="dev-view-about-content">
								<div class="dev-title-container">
									<span class="dev-title-avatar">
										<a target="_self" href="http://alicecarrollart.deviantart.com/">
											<img class="avatar" src="img/userco.png" alt=":iconalicecarrollart:" title="AliceCarrollArt">
										</a>
									</span>
									<h1>
										<a href="#">${img.nomImage } / ${img.descriptionImage } / ${img.imageDimension }</a>
										<small>
											<span style="font-weight: bold;color: #414D4C;" class="by">by</span>
											<span class="username-with-symbol u">
												<a style="font-weight: bold;" class="u regular username" href="SRVLTLinkToProfile?idUser=${img.user.idUser}">${img.user.loginUser}</a>
												<span class="user-symbol regular"></span>
											</span>
										</small>
									</h1>
								</div>
								<div class="dev-page-below-tabs">
									<c:choose>
										<c:when test="${statusLogin == 'STATUS_OK'}">
											<div id="gmi-CCommentMaster" class="talk-tower tower-commentcontrol" name="gmi-CCommentMaster">
												<form id="cooler-comment-submit" class="f" method="POST" action="SRVLTAjoutCommentaire">
													<div id="gmi-TalkPostWrapper" class="ccomment-form" name="gmi-TalkPostWrapper" style="padding-bottom:0">
														<a href="#" target="_self">
															<img class="avatar" title="" alt="" height="50" width="50" src="img/default.gif"></img>
														</a>
														<div class="h cc-without-moods">
															<div class="ccname">
																<span class="ccusername"></span>
																<span class="cclabel">Ajouter un commentaire :</span>
															</div>
															<div class="cctextarea">
																<div class="cctextarea-ctrl">
																	<textarea id="commentbody" class="text writeranywhere " cols="60" rows="15" name="com" placeholder="" tabindex="1"></textarea>
																</div>
																<input style="display: none" value="${img.idImage}" name="image"/>
																<i class="l"></i>
															</div>
														</div>
													</div>
													<div class="inputs" style="position: relative; text-align: right; display: block;">
														<a class="smbutton smbutton-green smbutton-big comment-submit" tabindex="2" href="#" onClick="document.forms['cooler-comment-submit'].submit();">
															<span style="color:#515C5A;font: bold 14px Trebuchet,'Trebuchet MS',sans-serif;padding: 12px 20px;text-shadow: 0px 1px 0px rgba(255, 255, 255, 0.65);" class="post">Commenter</span>
														</a>
													</div>
												</form>
											</div>
										</c:when>
										<c:otherwise>
											<div id="gmi-TalkPostWrapper" class="ccomment-form" name="gmi-TalkPostWrapper" style="padding-bottom:0">
												<div class="h cc-without-moods">
													<div class="ccname">
														<span class="ccusername"></span>
														<span class="cclabel">Vous devez être connecté(e) pour pouvoir ajouter un commentaire. Pas de compte ? <a href="index.jsp">Inscrivez-vous</a></span>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
									<br />
									<div id="gmi-CCommentMaster" class="talk-tower tower-commentcontrol" name="gmi-CCommentMaster">
										<div id="gmi-CCommentThread" class="ccomment-thread " name="gmi-CCommentThread">
											
											<c:forEach var="item" items="${com}">
												<div id="gmi-CComment" class="ccomment ch " name="gmi-CComment"><!-- commentaire numero 1 -->
													<div class="ch-ctrl">
														<i class="l"></i>
														<span class="cc-avatar">
															<a href="http://tommycranham.deviantart.com/" target="_self">
																<img class="avatar" width="50" height="50" title="TommyCranham" alt=":icontommycranham:" src="img/default.gif"></img>
															</a>
														</span>
														<div class="ctext ch">
															<div class="ch-ctrl cc-in">
																<div class="cc-meta">
																	<span class="cc-name">
																		<span class="username-with-symbol u">
																			<a class="u premium username" href="">${item.user.loginUser}</a>
																		</span>
																	</span>
																	<span class="cc-time">
																		<a title="${item.comDateAjout}" href="">${item.comDateAjout}</a>
																	</span>
																</div>
																<div class="text text-ii">
																	${item.commentaire}
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
											
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="dev-right-col-bg"></div>
						<div style="clear:both;"></div>
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