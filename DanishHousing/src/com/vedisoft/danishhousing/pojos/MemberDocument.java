package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class MemberDocument {

	int memberDocumentId;
	String memberDocumentTitle;
	String memberDocumentDetails;
	String memberDocumentFile;
	Date lastUpdate;
	int userId;

	public MemberDocument() {
		super();
	}

	public MemberDocument(int memberDocumentId, String memberDocumentTitle, String memberDocumentDetails,
			String memberDocumentFile, Date lastUpdate, int userId) {
		super();
		this.memberDocumentId = memberDocumentId;
		this.memberDocumentTitle = memberDocumentTitle;
		this.memberDocumentDetails = memberDocumentDetails;
		this.memberDocumentFile = memberDocumentFile;
		this.lastUpdate = lastUpdate;
		this.userId = userId;
	}

	public MemberDocument(String memberDocumentTitle, String memberDocumentDetails, String memberDocumentFile,
			Date lastUpdate, int userId) {
		super();
		this.memberDocumentTitle = memberDocumentTitle;
		this.memberDocumentDetails = memberDocumentDetails;
		this.memberDocumentFile = memberDocumentFile;
		this.lastUpdate = lastUpdate;
		this.userId = userId;
	}

	public int getMemberDocumentId() {
		return memberDocumentId;
	}

	public void setMemberDocumentId(int memberDocumentId) {
		this.memberDocumentId = memberDocumentId;
	}

	public String getMemberDocumentTitle() {
		return memberDocumentTitle;
	}

	public void setMemberDocumentTitle(String memberDocumentTitle) {
		this.memberDocumentTitle = memberDocumentTitle;
	}

	public String getMemberDocumentDetails() {
		return memberDocumentDetails;
	}

	public void setMemberDocumentDetails(String memberDocumentDetails) {
		this.memberDocumentDetails = memberDocumentDetails;
	}

	public String getMemberDocumentFile() {
		return memberDocumentFile;
	}

	public void setMemberDocumentFile(String memberDocumentFile) {
		this.memberDocumentFile = memberDocumentFile;
	}

	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "MemberDocument [memberDocumentId=" + memberDocumentId + ", memberDocumentTitle=" + memberDocumentTitle
				+ ", memberDocumentDetails=" + memberDocumentDetails + ", memberDocumentFile=" + memberDocumentFile
				+ ", lastUpdate=" + lastUpdate + ", userId=" + userId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((lastUpdate == null) ? 0 : lastUpdate.hashCode());
		result = prime * result + ((memberDocumentDetails == null) ? 0 : memberDocumentDetails.hashCode());
		result = prime * result + ((memberDocumentFile == null) ? 0 : memberDocumentFile.hashCode());
		result = prime * result + memberDocumentId;
		result = prime * result + ((memberDocumentTitle == null) ? 0 : memberDocumentTitle.hashCode());
		result = prime * result + userId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberDocument other = (MemberDocument) obj;
		if (lastUpdate == null) {
			if (other.lastUpdate != null)
				return false;
		} else if (!lastUpdate.equals(other.lastUpdate))
			return false;
		if (memberDocumentDetails == null) {
			if (other.memberDocumentDetails != null)
				return false;
		} else if (!memberDocumentDetails.equals(other.memberDocumentDetails))
			return false;
		if (memberDocumentFile == null) {
			if (other.memberDocumentFile != null)
				return false;
		} else if (!memberDocumentFile.equals(other.memberDocumentFile))
			return false;
		if (memberDocumentId != other.memberDocumentId)
			return false;
		if (memberDocumentTitle == null) {
			if (other.memberDocumentTitle != null)
				return false;
		} else if (!memberDocumentTitle.equals(other.memberDocumentTitle))
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}

}
