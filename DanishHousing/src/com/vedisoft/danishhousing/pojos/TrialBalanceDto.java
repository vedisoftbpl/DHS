package com.vedisoft.danishhousing.pojos;

import java.util.Comparator;

public class TrialBalanceDto  {
	private double recAmount;
	private double payAmount;
	private String acCode;
	private String acName;
	public TrialBalanceDto() {
		super();
	}
	public TrialBalanceDto(double recAmount, double payAmount, String acCode, String acName) {
		super();
		this.recAmount = recAmount;
		this.payAmount = payAmount;
		this.acCode = acCode;
		this.acName = acName;
	}
	public double getRecAmount() {
		return recAmount;
	}
	public void setRecAmount(double recAmount) {
		this.recAmount = recAmount;
	}
	public double getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(double payAmount) {
		this.payAmount = payAmount;
	}
	public String getAcCode() {
		return acCode;
	}
	public void setAcCode(String acCode) {
		this.acCode = acCode;
	}
	public String getAcName() {
		return acName;
	}
	public void setAcName(String acName) {
		this.acName = acName;
	}
	
	
	 public static Comparator<TrialBalanceDto> AcCodeComparator = new Comparator<TrialBalanceDto>() {

			public int compare(TrialBalanceDto s1, TrialBalanceDto s2) {
			   String AcCode1 = s1.getAcCode().toUpperCase();
			   String  AcCode2 = s2.getAcCode().toUpperCase();

			   System.out.println("Comparing....");
			   //ascending order
			   return AcCode1.compareTo(AcCode2);

			   //descending order
			   //return StudentName2.compareTo(StudentName1);
		    }};
	@Override
	public String toString() {
		return "TrialBalanceDto [recAmount=" + recAmount + ", payAmount=" + payAmount + ", acCode=" + acCode
				+ ", acName=" + acName + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((acCode == null) ? 0 : acCode.hashCode());
		result = prime * result + ((acName == null) ? 0 : acName.hashCode());
		long temp;
		temp = Double.doubleToLongBits(payAmount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(recAmount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		TrialBalanceDto other = (TrialBalanceDto) obj;
		if (acCode == null) {
			if (other.acCode != null)
				return false;
		} else if (!acCode.equals(other.acCode))
			return false;
		if (acName == null) {
			if (other.acName != null)
				return false;
		} else if (!acName.equals(other.acName))
			return false;
		if (Double.doubleToLongBits(payAmount) != Double.doubleToLongBits(other.payAmount))
			return false;
		if (Double.doubleToLongBits(recAmount) != Double.doubleToLongBits(other.recAmount))
			return false;
		return true;
	}

}
