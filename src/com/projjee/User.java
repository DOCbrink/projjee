package com.projjee;

// Generated 28 janv. 2015 08:09:53 by Hibernate Tools 3.4.0.CR1

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * User generated by hbm2java
 */
public class User implements java.io.Serializable {

	private int idUser;
	private String loginUser;
	private String mdpUser;
	private String userDateMaj;
	private String userDateAjout;
	private String userPrenom;
	private String userNom;
	private Set<Categorie> categories = new HashSet<Categorie>(0);
	private Set<Image> images = new HashSet<Image>(0);
	private Set<Commentaire> commentaires = new HashSet<Commentaire>(0);
	
	private DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	private Date today = Calendar.getInstance().getTime();        
	private String reportDate = df.format(today);

	public User() {
	}

	public User(String loginUser, String mdpUser) {
		this.loginUser = loginUser;
		this.mdpUser = mdpUser;
		this.userDateMaj = reportDate;
		this.userDateAjout = reportDate;
	}

	public User(String loginUser, String mdpUser,
			String userDateMaj, String userDateAjout, String userPrenom,
			String userNom, Set<Categorie> categories, Set<Image> images,
			Set<Commentaire> commentaires) {
		this.loginUser = loginUser;
		this.mdpUser = mdpUser;
		this.userDateMaj = reportDate;
		this.userDateAjout = reportDate;
		this.userPrenom = userPrenom;
		this.userNom = userNom;
		this.categories = categories;
		this.images = images;
		this.commentaires = commentaires;
	}

	public int getIdUser() {
		return this.idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
		this.userDateMaj = reportDate;
	}

	public String getLoginUser() {
		return this.loginUser;
	}

	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
		this.userDateMaj = reportDate;
	}

	public String getMdpUser() {
		return this.mdpUser;
	}

	public void setMdpUser(String mdpUser) {
		this.mdpUser = mdpUser;
		this.userDateMaj = reportDate;
	}

	public String getUserDateMaj() {
		return this.userDateMaj;
	}

	public void setUserDateMaj(String userDateMaj) {
		this.userDateMaj = userDateMaj;
	}

	public String getUserDateAjout() {
		return this.userDateAjout;
	}

	public void setUserDateAjout(String userDateAjout) {
		this.userDateAjout = userDateAjout;
		this.userDateMaj = reportDate;
	}

	public String getUserPrenom() {
		return this.userPrenom;
	}

	public void setUserPrenom(String userPrenom) {
		this.userPrenom = userPrenom;
		this.userDateMaj = reportDate;
	}

	public String getUserNom() {
		return this.userNom;
	}

	public void setUserNom(String userNom) {
		this.userNom = userNom;
		this.userDateMaj = reportDate;
	}

	public Set<Categorie> getCategories() {
		return this.categories;
	}

	public void setCategories(Set<Categorie> categories) {
		this.categories = categories;
		this.userDateMaj = reportDate;
	}

	public Set<Image> getImages() {
		return this.images;
	}

	public void setImages(Set<Image> images) {
		this.images = images;
		this.userDateMaj = reportDate;
	}

	public Set<Commentaire> getCommentaires() {
		return this.commentaires;
	}

	public void setCommentaires(Set<Commentaire> commentaires) {
		this.commentaires = commentaires;
		this.userDateMaj = reportDate;
	}

}
