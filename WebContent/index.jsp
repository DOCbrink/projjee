<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>
	
	<%@include file="head.jsp" %>  

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
						<h1><i class="fa fa-child fa-3"></i> Bienvenue sur JavArt</h1>
						<div class="subtitle">N'hésitez pas à vous inscrire ci-dessous.</div>
					</div>
				</div>
			</div>
			
			<div id="inscription">
				<c:choose>
					<c:when test="${statusLogin == 'STATUS_OK'}">
						<p>Vous êtes déja connecté(e) <c:out value="${userco.loginUser}"></c:out></p>
					</c:when>
					
					<c:otherwise>
						<fieldset>
							<legend>Formulaire d'inscription</legend>
							<div class="form">
								<form method="POST" action="SRVLTInscription" method="POST">
									<div class="form-group">
										<label for="pseudo">Login</label>
										<input type="text" class="form-control" id="pseudo" placeholder="Entrez votre pseudo" name="newLogin" required>
									</div>
									<div class="form-group">
										<label for="password">Password</label>
										<input type="password" class="form-control" id="password" name="newPwd" placeholder="Entrez votre mot de passe" required>
									</div>
									<button type="submit" class="btn btn-success">S'inscrire</button>
								</form>
							</div>	
						</fieldset>
					</c:otherwise>
				</c:choose>

				<div id="visit">
					<a id="bigbutton" href="SRVLTLinkToAccueil" alt="Vers accueil">
						<span>Ou visiter le site !</span>
					</a>
				</div>
			</div>
	    </div> <!-- /container -->
    </body>
</html>