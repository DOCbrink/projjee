<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>
	
	<%@include file="head.jsp" %>  

	<body>
		
		<%@include file="header.jsp" %> 
		
		<%@include file="message.jsp" %> 
		
		<div class="jumbotron" >
			<div class="today-header">
				<div class="today-date">Vendredi le 1er avril 2022</div>
			</div>
			
			<div class="shinyheader with-sub">
				<div class="headercontent">
					<ul class="headerlinks"></ul>
					<div class="headlines">
						<h1><i class="fa fa-fire fa-3"></i> C'est chaud, c'est d'actualité !</h1>
						<div class="subtitle">Venez decouvrir les dernières images ajoutées.</div>
					</div>
				</div>
			</div>
		
			<div class="ppp grid-module grid-feed">
	            <div class="grid-layout grid-layout-16">
	                <div class="grid-layout-inner">
	                    <div class="stream" name="gmi-GridStream" id="gmi-GridStream">
							
							<div class="column double">
								<div class="grid-thumb square xl">
									<div class="tt-crop tt-a thumb">
										<a href="SRVLTAfficheImage?img=${imgList[0].idImage}" class="thumb" title="${imgList[0].nomImage}">        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[0].urlImage}');"></div>
										</a>        
										<div class="overlay">
											<div class="stat comment-stat">
												<span class="icon comment"></span>
												<i>${fn:length(imgList[0].commentaires)}</i> commentaires
											</div>   
										</div>
									</div>
								</div>	
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">       
										<a href="SRVLTAfficheImage?img=${imgList[1].idImage}" class="thumb" title="${imgList[1].nomImage}">
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[1].urlImage}');"></div>
										</a> 
									</div>
								</div>           
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">
										<a href="SRVLTAfficheImage?img=${imgList[2].idImage}" class="thumb" title="${imgList[2].nomImage}" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[2].urlImage}');"></div>
										</a>
									</div>
								</div>
							</div>
							
							<div class="column">
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">                
										<a href="SRVLTAfficheImage?img=${imgList[3].idImage}" class="thumb" title="${imgList[3].nomImage}" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[3].urlImage}');"></div>
										</a>        
									</div>
								</div>
								<div class="grid-thumb square "><div class="tt-crop tt-a thumb" >               
										<a href="SRVLTAfficheImage?img=${imgList[4].idImage}" class="thumb" title="${imgList[4].nomImage}" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[4].urlImage}');"></div>
										</a>        
									</div>
								</div>           
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">               
										<a href="SRVLTAfficheImage?img=${imgList[5].idImage}" class="thumb" title="${imgList[5].nomImage}" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[5].urlImage}');"></div>
										</a>       								
									</div>
								</div> 
							</div>
							
							<div class="column double">
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb hasprint">                
										<a href="SRVLTAfficheImage?img=${imgList[6].idImage}" class="thumb" title="${imgList[6].nomImage}" >     
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[6].urlImage}');"></div>
										</a>       								
									</div>
								</div>           
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">               
										<a href="SRVLTAfficheImage?img=${imgList[7].idImage}" class="thumb" title="${imgList[7].nomImage}" >       
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[7].urlImage}');"></div>
										</a>       
									</div>
								</div>            
								<div class="grid-thumb square xl">
									<div class="tt-crop lit">
										<a href="SRVLTAfficheImage?img=${imgList[8].idImage}" class="thumb" title="${imgList[8].nomImage}" >       
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[8].urlImage}');"></div>
										</a>    
									</div>
								</div>
							</div>
							
							<div class="column">
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">                
										<a href="SRVLTAfficheImage?img=${imgList[9].idImage}" class="thumb" title="${imgList[9].nomImage}" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[9].urlImage}');"></div>
										</a>       
									</div>
								</div>            
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb" >               
										<a href="SRVLTAfficheImage?img=${imgList[10].idImage}" class="thumb" title="${imgList[10].nomImage}" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[10].urlImage}');"></div>
										</a>        
									</div>
								</div>            
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">                
										<a href="SRVLTAfficheImage?img=${imgList[11].idImage}" class="thumb" title="${imgList[11].nomImage}" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[11].urlImage}');"></div>
										</a>        
									</div>
								</div>        
							</div>
							
							<div class="column triple">
								<div class="grid-thumb square xxl">
									<div class="tt-crop tt-a thumb">              
										<a href="SRVLTAfficheImage?img=${imgList[12].idImage}" class="thumb" title="${imgList[12].nomImage}" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[12].urlImage}');"></div>
										</a>        
										<div class="overlay">
											<div class="stat fave-stat">
												<span class="icon comment"></span>
												<i>${fn:length(imgList[12].commentaires)}</i> commentaires
											</div>
										</div>        
									</div>
								</div>        
							</div>
							
							<div class="column last">
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb" collect_rid="1:508884183" data-deviationid="508884183">                
										<a href="SRVLTAfficheImage?img=${imgList[13].idImage}" class="thumb" title="${imgList[13].nomImage}" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[13].urlImage}');"></div>
										</a>        
									</div>
								</div>            
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">              
										<a href="SRVLTAfficheImage?img=${imgList[14].idImage}" class="thumb" title="${imgList[14].nomImage}" >       
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[14].urlImage}');"></div>
										</a>        
									</div>
								</div>            
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb" >                
										<a href="SRVLTAfficheImage?img=${imgList[15].idImage}" class="thumb" title="${imgList[15].nomImage}" >   
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[15].urlImage}');"></div>
										</a>       
									</div>
								</div>       
							</div>
							
						</div>
					</div>
				</div>
			</div>
		
    	</div> <!-- /jumbotron -->
    
	</body>
	<script>
		var today = document.getElementById("today");
		today.className = ""; 
		today.className = "navbar-menu-item active";
		var categ = document.getElementById("categ");
		categ.className = "";
		categ.className = "navbar-menu-item";
		var todaynav = document.getElementById("todaynav");
		todaynav.className = ""; 
		todaynav.className = "navbar-menu-item active";
		var categnav = document.getElementById("categnav");
		categnav.className = "";
		categnav.className = "navbar-menu-item";
	</script>
</html>