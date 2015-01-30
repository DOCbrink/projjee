<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  

<c:if test="${fn:length(userInfo.images) == 0}">
	<p>Vous n'avez pas encore ajouté d'images !</p>
</c:if>

<div class="row">
	<c:forEach var="item" items="${userInfo.images}">
		<div class="col-md-3">
			<div class="tt-a tt-fh tt-boxed">
				<span class="tt-w" style="width: auto; max-width: 18em;">
					<span class="tt-fh-tc" style="width:18em;height:14em;">
						<span class="shadow" style="width:18em;height:14em;">
							<a class="" href="SRVLTLinkToRealProfil?parametre=ImagesModif&imgModif=${item.idImage}" title="${item.nomImage}">
								<div class="tinythumb scaledown" style="box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.4), 0px 0px 0px 1px rgba(0, 0, 0, 0.15);width: 18em;height: 14em;background-image: url('image/${item.urlImage}');"></div>
							</a>
						</span>
					</span>
					<span class="details">
						<a href="SRVLTAfficheImage?img=${item.idImage}" class="t" title="His Sanctuary by Jon-Lock, Jan 24, 2015">
							<span class="tt-fh-oe">${item.nomImage}</span>
						</a>
						<small>
							<span class="category">
								<span class="age">Ajoutée le : ${item.imageDateAjout}</span>
							</span>
						</small>
					</span>
				</span>
			</div>
		</div>
	</c:forEach>
</div>