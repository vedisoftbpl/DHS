package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class Users {

	private int userId;
	private String name;
	private String email;
	private String password;
	private String designation;
	private String mobile;
	private String status;
	private Date doj;
	private Date dob;
	private String address;
	private String photo;
	private String createdBy;
	private String userType;

	public Users() {
		super();
	}

	public Users(String name, String email, String password, String designation, String mobile, String status, Date doj,
			Date dob, String address, String photo, String createdBy, String userType) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.designation = designation;
		this.mobile = mobile;
		this.status = status;
		this.doj = doj;
		this.dob = dob;
		this.address = address;
		this.photo = photo;
		this.createdBy = createdBy;
		this.userType = userType;
	}

	public Users(int userId, String name, String email, String password, String designation, String mobile,
			String status, Date doj, Date dob, String address, String photo, String createdBy, String userType) {
		super();
		this.userId = userId;
		this.name = name;
		this.email = email;
		this.password = password;
		this.designation = designation;
		this.mobile = mobile;
		this.status = status;
		this.doj = doj;
		this.dob = dob;
		this.address = address;
		this.photo = photo;
		this.createdBy = createdBy;
		this.userType = userType;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDoj() {
		return doj;
	}

	public void setDoj(Date doj) {
		this.doj = doj;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "Users [userId=" + userId + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", designation=" + designation + ", mobile=" + mobile + ", status=" + status + ", doj=" + doj
				+ ", dob=" + dob + ", address=" + address + ", photo=" + photo + ", createdBy=" + createdBy
				+ ", userType=" + userType + "]";
	}

}
