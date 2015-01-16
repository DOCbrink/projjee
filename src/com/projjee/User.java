package com.projjee;

// Generated 9 janv. 2015 15:46:21 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * User generated by hbm2java
 */
public class User implements java.io.Serializable {

	private int idUser;
	private String loginUser;
	private String mdpUser;
	private Set<Image> images = new HashSet<Image>(0);

	public User() {
	}

	public User(int idUser, String loginUser, String mdpUser) {
		this.idUser = idUser;
		this.loginUser = loginUser;
		this.mdpUser = mdpUser;
	}

	public User(int idUser, String loginUser, String mdpUser, Set<Image> images) {
		this.idUser = idUser;
		this.loginUser = loginUser;
		this.mdpUser = mdpUser;
		this.images = images;
	}

	public int getIdUser() {
		return this.idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getLoginUser() {
		return this.loginUser;
	}

	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}

	public String getMdpUser() {
		return this.mdpUser;
	}

	public void setMdpUser(String mdpUser) {
		this.mdpUser = mdpUser;
	}

	public Set<Image> getImages() {
		return this.images;
	}

	public void setImages(Set<Image> images) {
		this.images = images;
	}

}
