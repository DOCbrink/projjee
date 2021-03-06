package com.projjee;

// Generated 28 janv. 2015 08:09:53 by Hibernate Tools 3.4.0.CR1

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Categorie generated by hbm2java
 */
public class Categorie implements java.io.Serializable {

	private int idCategorie;
	private User user;
	private String nomCategorie;
	private String categDateMaj;
	private String categDateAjout;
	private Set<Image> images = new HashSet<Image>(0);
	
	private DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	private Date today = Calendar.getInstance().getTime();        
	private String reportDate = df.format(today);

	public Categorie() {
	}

	public Categorie(User user, String nomCategorie) {
		this.user = user;
		this.nomCategorie = nomCategorie;
		this.categDateAjout = reportDate;
		this.categDateMaj = reportDate;
	}

	public Categorie(User user, String nomCategorie,
			String categDateMaj, String categDateAjout, Set<Image> images) {
		this.user = user;
		this.nomCategorie = nomCategorie;
		this.categDateAjout = reportDate;
		this.categDateMaj = reportDate;
		this.images = images;
	}

	public int getIdCategorie() {
		return this.idCategorie;
	}

	public void setIdCategorie(int idCategorie) {
		this.idCategorie = idCategorie;
		this.categDateMaj = reportDate;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
		this.categDateMaj = reportDate;
	}

	public String getNomCategorie() {
		return this.nomCategorie;
	}

	public void setNomCategorie(String nomCategorie) {
		this.nomCategorie = nomCategorie;
		this.categDateMaj = reportDate;
	}

	public String getCategDateMaj() {
		return this.categDateMaj;
	}

	public void setCategDateMaj(String categDateMaj) {
		this.categDateMaj = categDateMaj;
	}

	public String getCategDateAjout() {
		return this.categDateAjout;
	}

	public void setCategDateAjout(String categDateAjout) {
		this.categDateAjout = categDateAjout;
		this.categDateMaj = reportDate;
	}

	public Set<Image> getImages() {
		return this.images;
	}

	public void setImages(Set<Image> images) {
		this.images = images;
		this.categDateMaj = reportDate;
	}

}
