package com.projjee;

// Generated 28 janv. 2015 08:09:53 by Hibernate Tools 3.4.0.CR1

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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
	private String imageDateMaj;
	private String imageDateAjout;
	private Integer imageNbView;
	private Integer imageNbDl;
	private Integer imageSize;
	private String imageDimension;
	private Set<Commentaire> commentaires = new HashSet<Commentaire>(0);
	
	private DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	private Date today = Calendar.getInstance().getTime();        
	private String reportDate = df.format(today);

	public Image() {
	}

	public Image(User user, Categorie categorie, String urlImage) {
		this.user = user;
		this.categorie = categorie;
		this.urlImage = urlImage;
		this.imageDateMaj = reportDate;
		this.imageDateAjout = reportDate;
	}

	public Image(User user, Categorie categorie, String urlImage, String nomImage, String descImage) {
		this.user = user;
		this.categorie = categorie;
		this.urlImage = urlImage;
		this.nomImage = nomImage;
		this.descriptionImage = descImage;
		this.imageDateMaj = reportDate;
		this.imageDateAjout = reportDate;
	}
	
	public Image(User user, Categorie categorie, String urlImage,
			String nomImage, String descriptionImage, String imageDateMaj,
			String imageDateAjout, Integer imageNbView, Integer imageNbDl,
			Integer imageSize, String imageDimension,
			Set<Commentaire> commentaires) {
		this.user = user;
		this.categorie = categorie;
		this.urlImage = urlImage;
		this.nomImage = nomImage;
		this.descriptionImage = descriptionImage;
		this.imageDateMaj = reportDate;
		this.imageDateAjout = reportDate;
		this.imageNbView = imageNbView;
		this.imageNbDl = imageNbDl;
		this.imageSize = imageSize;
		this.imageDimension = imageDimension;
		this.commentaires = commentaires;
	}

	public int getIdImage() {
		return this.idImage;
	}

	public void setIdImage(int idImage) {
		this.idImage = idImage;
		this.imageDateMaj = reportDate;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
		this.imageDateMaj = reportDate;
	}

	public Categorie getCategorie() {
		return this.categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
		this.imageDateMaj = reportDate;
	}

	public String getUrlImage() {
		return this.urlImage;
	}

	public void setUrlImage(String urlImage) {
		this.urlImage = urlImage;
		this.imageDateMaj = reportDate;
	}

	public String getNomImage() {
		return this.nomImage;
	}

	public void setNomImage(String nomImage) {
		this.nomImage = nomImage;
		this.imageDateMaj = reportDate;
	}

	public String getDescriptionImage() {
		return this.descriptionImage;
	}

	public void setDescriptionImage(String descriptionImage) {
		this.descriptionImage = descriptionImage;
		this.imageDateMaj = reportDate;
	}

	public String getImageDateMaj() {
		return this.imageDateMaj;
	}

	public void setImageDateMaj(String imageDateMaj) {
		this.imageDateMaj = imageDateMaj;
	}

	public String getImageDateAjout() {
		return this.imageDateAjout;
	}

	public void setImageDateAjout(String imageDateAjout) {
		this.imageDateAjout = imageDateAjout;
		this.imageDateMaj = reportDate;
	}

	public Integer getImageNbView() {
		return this.imageNbView;
	}

	public void setImageNbView(Integer imageNbView) {
		this.imageNbView = imageNbView;
		this.imageDateMaj = reportDate;
	}

	public Integer getImageNbDl() {
		return this.imageNbDl;
	}

	public void setImageNbDl(Integer imageNbDl) {
		this.imageNbDl = imageNbDl;
		this.imageDateMaj = reportDate;
	}

	public Integer getImageSize() {
		return this.imageSize;
	}

	public void setImageSize(Integer imageSize) {
		this.imageSize = imageSize;
		this.imageDateMaj = reportDate;
	}

	public String getImageDimension() {
		return this.imageDimension;
	}

	public void setImageDimension(String imageDimension) {
		this.imageDimension = imageDimension;
		this.imageDateMaj = reportDate;
	}

	public Set<Commentaire> getCommentaires() {
		return this.commentaires;
	}

	public void setCommentaires(Set<Commentaire> commentaires) {
		this.commentaires = commentaires;
		this.imageDateMaj = reportDate;
	}

}
