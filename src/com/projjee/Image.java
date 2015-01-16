package com.projjee;

// Generated 9 janv. 2015 15:46:21 by Hibernate Tools 3.4.0.CR1

/**
 * Image generated by hbm2java
 */
public class Image implements java.io.Serializable {

	private int idImage;
	private User user;
	private Categorie categorie;
	private String urlImage;
	private String nomImage;
	private String descriptionImage;

	public Image() {
	}

	public Image(User user, Categorie categorie, String urlImage,
			String nomImage, String descriptionImage) {
		this.user = user;
		this.categorie = categorie;
		this.urlImage = urlImage;
		this.nomImage = nomImage;
		this.descriptionImage = descriptionImage;
	}

	public int getIdImage() {
		return this.idImage;
	}

	public void setIdImage(int idImage) {
		this.idImage = idImage;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Categorie getCategorie() {
		return this.categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}

	public String getUrlImage() {
		return this.urlImage;
	}

	public void setUrlImage(String urlImage) {
		this.urlImage = urlImage;
	}

	public String getNomImage() {
		return this.nomImage;
	}

	public void setNomImage(String nomImage) {
		this.nomImage = nomImage;
	}

	public String getDescriptionImage() {
		return this.descriptionImage;
	}

	public void setDescriptionImage(String descriptionImage) {
		this.descriptionImage = descriptionImage;
	}

}
