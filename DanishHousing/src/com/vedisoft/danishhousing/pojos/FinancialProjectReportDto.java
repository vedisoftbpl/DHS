package com.vedisoft.danishhousing.pojos;

import java.io.Serializable;

public class FinancialProjectReportDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private int memberNo;
	private String memberName;
	private String plotNo;
	private String plotSize;
	private double plotCost;
	private double extraWork;
	private double totalCost;
	private double recAmount;
	private double refAmount;
	private double balAmount;

	public FinancialProjectReportDto() {
		super();
	}

	public FinancialProjectReportDto(int memberNo, String memberName, String plotNo, String plotSize, double plotCost,
			double extraWork, double totalCost, double recAmount, double refAmount, double balAmount) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.plotNo = plotNo;
		this.plotSize = plotSize;
		this.plotCost = plotCost;
		this.extraWork = extraWork;
		this.totalCost = totalCost;
		this.recAmount = recAmount;
		this.refAmount = refAmount;
		this.balAmount = balAmount;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPlotNo() {
		return plotNo;
	}

	public void setPlotNo(String plotNo) {
		this.plotNo = plotNo;
	}

	public String getPlotSize() {
		return plotSize;
	}

	public void setPlotSize(String plotSize) {
		this.plotSize = plotSize;
	}

	public double getPlotCost() {
		return plotCost;
	}

	public void setPlotCost(double plotCost) {
		this.plotCost = plotCost;
	}

	public double getExtraWork() {
		return extraWork;
	}

	public void setExtraWork(double extraWork) {
		this.extraWork = extraWork;
	}

	public double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}

	public double getRecAmount() {
		return recAmount;
	}

	public void setRecAmount(double recAmount) {
		this.recAmount = recAmount;
	}

	public double getrefAmount() {
		return refAmount;
	}

	public void setrefAmount(double refAmount) {
		this.refAmount = refAmount;
	}

	public double getBalAmount() {
		return balAmount;
	}

	public void setBalAmount(double balAmount) {
		this.balAmount = balAmount;
	}

	@Override
	public String toString() {
		return "FinancialProjectReportDto [memberNo=" + memberNo + ", memberName=" + memberName + ", plotNo=" + plotNo
				+ ", plotSize=" + plotSize + ", plotCost=" + plotCost + ", extraWork=" + extraWork + ", totalCost="
				+ totalCost + ", recAmount=" + recAmount + ", refAmount=" + refAmount + ", balAmount=" + balAmount
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(balAmount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(extraWork);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((memberName == null) ? 0 : memberName.hashCode());
		result = prime * result + memberNo;
		temp = Double.doubleToLongBits(plotCost);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((plotNo == null) ? 0 : plotNo.hashCode());
		result = prime * result + ((plotSize == null) ? 0 : plotSize.hashCode());
		temp = Double.doubleToLongBits(recAmount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(refAmount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(totalCost);
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
		FinancialProjectReportDto other = (FinancialProjectReportDto) obj;
		if (Double.doubleToLongBits(balAmount) != Double.doubleToLongBits(other.balAmount))
			return false;
		if (Double.doubleToLongBits(extraWork) != Double.doubleToLongBits(other.extraWork))
			return false;
		if (memberName == null) {
			if (other.memberName != null)
				return false;
		} else if (!memberName.equals(other.memberName))
			return false;
		if (memberNo != other.memberNo)
			return false;
		if (Double.doubleToLongBits(plotCost) != Double.doubleToLongBits(other.plotCost))
			return false;
		if (plotNo == null) {
			if (other.plotNo != null)
				return false;
		} else if (!plotNo.equals(other.plotNo))
			return false;
		if (plotSize == null) {
			if (other.plotSize != null)
				return false;
		} else if (!plotSize.equals(other.plotSize))
			return false;
		if (Double.doubleToLongBits(recAmount) != Double.doubleToLongBits(other.recAmount))
			return false;
		if (Double.doubleToLongBits(refAmount) != Double.doubleToLongBits(other.refAmount))
			return false;
		if (Double.doubleToLongBits(totalCost) != Double.doubleToLongBits(other.totalCost))
			return false;
		return true;
	}

}
