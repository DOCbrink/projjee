<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
										<a href="" class="thumb" title="Nom de l'image">        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[0].urlImage}');"></div>
										</a>        
										<div class="overlay">
											<div class="stat comment-stat">
												<span class="icon comment"></span>
												<i>417</i> commentaires
											</div>   
										</div>
									</div>
								</div>	
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">       
										<a href="http://yuumei.deviantart.com/art/With-You-509076769" class="thumb" title="With You by yuumei, Jan 23, 2015">
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[1].urlImage}');"></div>
										</a> 
									</div>
								</div>           
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">
										<a href="http://artgerm.deviantart.com/art/Juri-Han-508985524" class="thumb" title="Juri Han by Artgerm, Jan 23, 2015" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[2].urlImage}');"></div>
										</a>
									</div>
								</div>
							</div>
							
							<div class="column">
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">                
										<a href="http://viria13.deviantart.com/art/Wise-girl-508987808" class="thumb" title="Wise girl by viria13, Jan 23, 2015" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[3].urlImage}');"></div>
										</a>        
									</div>
								</div>
								<div class="grid-thumb square "><div class="tt-crop tt-a thumb" >               
										<a href="http://sakimichan.deviantart.com/art/Medusa-s-sorrow-508916430" class="thumb" title="Medusa's sorrow by sakimichan, Jan 22, 2015" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[4].urlImage}');"></div>
										</a>        
									</div>
								</div>           
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">               
										<a href="http://ganassa.deviantart.com/art/Tauriel-The-Magic-of-the-Ring-508812224" class="thumb" title="Tauriel + The Magic of the Ring by Ganassa, Jan 22, 2015" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[5].urlImage}');"></div>
										</a>       								
									</div>
								</div> 
							</div>
							
							<div class="column double">
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb hasprint">                
										<a href="http://piratebutl23.deviantart.com/art/Fight-Club-509009735" class="thumb" title="Fight Club by piratebutl23, Jan 23, 2015" >     
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[6].urlImage}');"></div>
										</a>       								
									</div>
								</div>           
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">               
										<a href="http://fukari.deviantart.com/art/tiny-tiny-steps-508792380" class="thumb" title="tiny tiny steps by Fukari, Jan 22, 2015" >       
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[7].urlImage}');"></div>
										</a>       
									</div>
								</div>            
								<div class="grid-thumb square xl">
									<div class="tt-crop lit">
										<a href="http://fukari.deviantart.com/art/tiny-tiny-steps-508792380" class="thumb" title="tiny tiny steps by Fukari, Jan 22, 2015" >       
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[8].urlImage}');"></div>
										</a>    
									</div>
								</div>
							</div>
							
							<div class="column">
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">                
										<a href="http://enigma-fotos.deviantart.com/art/Sarah-508405833" class="thumb" title="Sarah by Enigma-Fotos, Jan 20, 2015" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[9].urlImage}');"></div>
										</a>       
									</div>
								</div>            
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb" >               
										<a href="http://kr0npr1nz.deviantart.com/art/Re-L-Mayer-508971191" class="thumb" title="Re-L Mayer by KR0NPR1NZ, Jan 22, 2015" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[10].urlImage}');"></div>
										</a>        
									</div>
								</div>            
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">                
										<a href="http://adriandadich.deviantart.com/art/Tora-Portrait-508455919" class="thumb" title="Tora Portrait by AdrianDadich, Jan 21, 2015" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[11].urlImage}');"></div>
										</a>        
									</div>
								</div>        
							</div>
							
							<div class="column triple">
								<div class="grid-thumb square xxl">
									<div class="tt-crop tt-a thumb">              
										<a href="http://zombiesmile.deviantart.com/art/Cat-Attack-508815460" class="thumb" title="Cat Attack by Zombiesmile, Jan 22, 2015" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[12].urlImage}');"></div>
										</a>        
										<div class="overlay">
											<div class="stat fave-stat">
												<span class="icon comment"></span>
												<i>787</i> commentaires
											</div>
										</div>        
									</div>
								</div>        
							</div>
							
							<div class="column last">
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb" collect_rid="1:508884183" data-deviationid="508884183">                
										<a href="http://tsaoshin.deviantart.com/art/TsaoShin-Full-Brushes-Set-508884183" class="thumb" title="TsaoShin Full Brushes Set by TsaoShin, Jan 22, 2015" >        
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[13].urlImage}');"></div>
										</a>        
									</div>
								</div>            
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb">              
										<a href="http://beethy.deviantart.com/art/Assassin-s-Creed-China-Chronicles-Shao-Jun-02-508403509" class="thumb" title="Assassin's Creed: China Chronicles - Shao Jun -02- by beethy, Jan 20, 2015" >       
											<div class="tinythumb scaledown" style="background-image: url('image/${imgList[14].urlImage}');"></div>
										</a>        
									</div>
								</div>            
								<div class="grid-thumb square ">
									<div class="tt-crop tt-a thumb" >                
										<a href="http://naschi.deviantart.com/art/Sugar-Cupcake-Witch-509024129" class="thumb" title="Sugar Cupcake Witch ^_^ by Naschi, Jan 23, 2015" >   
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
</html>