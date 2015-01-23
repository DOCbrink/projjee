<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">    
	<div id="navfixed" class="navbar-menu-inner-scroll hidden">
		<div style="float:left;">
			<a class="navbar-menu-item active" href="http://www.deviantart.com/today/">Aujourd'hui</a>
			<a class="navbar-menu-item" href="http://www.deviantart.com/browse/all/">Parcourir</a>
			<a class="navbar-menu-item" href="http://www.deviantart.com/browse/whatshot/">What’s Hot</a>
			<a class="navbar-menu-item" href="http://www.deviantart.com/browse/undiscovered/">Undiscovered</a>
			<a class="navbar-menu-item" href="http://www.deviantart.com/dailydeviations/">Daily Deviations</a>
		</div>
		<div class="profilconnected" style="float:right;">
			<div class="jump-to-top" style="display:inline-block;margin-right:10px;">
				<a style="outline:none;" href="" class="jump-to-top-icon"><i style="color:white;" class="fa fa-caret-square-o-up fa-3"></i></a>
			</div>
			<!-- <div style="display:inline-block;"><a href="/id/">Identifiant</a></div> -->
		</div>
	</div>
	
	<nav class="navbar">
		<div id="navtop" class="container">
			<div class="navbar-header">
			  <a class="" href="/"><img alt="JavArt" src="img/logo.png"></a>
			</div>
			<div id="navbar">
				<div class="navbar-left navbar-text">
					<span id="submit"><a href="#" class="navbar-link">Ajouter une image</a></span>
					<span id="shopping"><a href="#" class="navbar-link"><i class="fa fa-shopping-cart"></i>Panier</a></span>
				</div>
				
				<c:choose>
					<c:when test="${statusLogin == 'STATUS_OK'}">
						<form class="profilconnected navbar-right navbar-form" method="POST" action="SRVLTDeconnexion">
							<a style="margin-right:10px;" href="/id/">Identifiant</a>
							<button style="margin-top:3px" type="submit" class="btn btn-success">Déconnexion</button>
						</form>
					</c:when>
				
					<c:otherwise>
						<form id="login" class="navbar-form navbar-right" action="SRVLTConnexion" method="POST">
							<div class="form-group">
								<input type="text" name="login" placeholder="Login" class="form-control">
							</div>
							<div class="form-group">
								<input type="password" name="pwd" placeholder="Password" class="form-control">
							</div>
							<button type="submit" class="btn btn-success">Sign in</button>
						</form>
					</c:otherwise>
				</c:choose>
			
			</div>
        </div>
		<div id="navbottom" class="navbar-menu-inner-scroll">
			<a class="navbar-menu-item active" href="http://www.deviantart.com/today/">Aujourd'hui</a>
			<a class="navbar-menu-item" href="http://www.deviantart.com/browse/all/">Parcourir</a>
			<a class="navbar-menu-item" href="http://www.deviantart.com/browse/whatshot/">What’s Hot</a>
			<a class="navbar-menu-item" href="http://www.deviantart.com/browse/undiscovered/">Undiscovered</a>
			<a class="navbar-menu-item" href="http://www.deviantart.com/dailydeviations/">Daily Deviations</a>
		</div>
    </nav