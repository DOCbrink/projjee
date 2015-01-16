package com.projjee;

// Generated 9 janv. 2015 15:46:21 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * Categorie generated by hbm2java
 */
public class Categorie implements java.io.Serializable {

	private int idCategorie;
	private String nomCategorie;
	private Set<Image> images = new HashSet<Image>(0);

	public Categorie() {
	}

	public Categorie(String nomCategorie) {
		this.nomCategorie = nomCategorie;
	}

	public Categorie(String nomCategorie, Set<Image> images) {
		this.nomCategorie = nomCategorie;
		this.images = images;
	}

	public int getIdCategorie() {
		return this.idCategorie;
	}

	public void setIdCategorie(int idCategorie) {
		this.idCategorie = idCategorie;
	}

	public String getNomCategorie() {
		return this.nomCategorie;
	}

	public void setNomCategorie(String nomCategorie) {
		this.nomCategorie = nomCategorie;
	}

	public Set<Image> getImages() {
		return this.images;
	}

	public void setImages(Set<Image> images) {
		this.images = images;
	}

}
