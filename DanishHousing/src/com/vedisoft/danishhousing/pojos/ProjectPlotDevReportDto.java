package com.vedisoft.danishhousing.pojos;

public class ProjectPlotDevReportDto {
	private int membNo;
	private String membName;
	private double plotCost;
	private double plotRefund;
	private double devCost;
	private double devRefund;
	private double total;
	private String plotNo;
	private String plotSize;
	public ProjectPlotDevReportDto() {
		super();
	}
	
	public ProjectPlotDevReportDto(int membNo, String membName, double plotCost, double plotRefund, double devCost,
			double devRefund, double total, String plotNo, String plotSize) {
		super();
		this.membNo = membNo;
		this.membName = membName;
		this.plotCost = plotCost;
		this.plotRefund = plotRefund;
		this.devCost = devCost;
		this.devRefund = devRefund;
		this.total = total;
		this.plotNo = plotNo;
		this.plotSize = plotSize;
	}

	
	public double getPlotRefund() {
		return plotRefund;
	}

	public void setPlotRefund(double plotRefund) {
		this.plotRefund = plotRefund;
	}

	public double getDevRefund() {
		return devRefund;
	}

	public void setDevRefund(double devRefund) {
		this.devRefund = devRefund;
	}

	public int getMembNo() {
		return membNo;
	}
	public void setMembNo(int membNo) {
		this.membNo = membNo;
	}
	public String getMembName() {
		return membName;
	}
	public void setMembName(String membName) {
		this.membName = membName;
	}
	public double getPlotCost() {
		return plotCost;
	}
	public void setPlotCost(double plotCost) {
		this.plotCost = plotCost;
	}
	public double getDevCost() {
		return devCost;
	}
	public void setDevCost(double devCost) {
		this.devCost = devCost;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
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

	@Override
	public String toString() {
		return "ProjectPlotDevReportDto [membNo=" + membNo + ", membName=" + membName + ", plotCost=" + plotCost
				+ ", plotRefund=" + plotRefund + ", devCost=" + devCost + ", devRefund=" + devRefund + ", total="
				+ total + ", plotNo=" + plotNo + ", plotSize=" + plotSize + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(devCost);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(devRefund);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((membName == null) ? 0 : membName.hashCode());
		result = prime * result + membNo;
		temp = Double.doubleToLongBits(plotCost);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((plotNo == null) ? 0 : plotNo.hashCode());
		temp = Double.doubleToLongBits(plotRefund);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((plotSize == null) ? 0 : plotSize.hashCode());
		temp = Double.doubleToLongBits(total);
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
		ProjectPlotDevReportDto other = (ProjectPlotDevReportDto) obj;
		if (Double.doubleToLongBits(devCost) != Double.doubleToLongBits(other.devCost))
			return false;
		if (Double.doubleToLongBits(devRefund) != Double.doubleToLongBits(other.devRefund))
			return false;
		if (membName == null) {
			if (other.membName != null)
				return false;
		} else if (!membName.equals(other.membName))
			return false;
		if (membNo != other.membNo)
			return false;
		if (Double.doubleToLongBits(plotCost) != Double.doubleToLongBits(other.plotCost))
			return false;
		if (plotNo == null) {
			if (other.plotNo != null)
				return false;
		} else if (!plotNo.equals(other.plotNo))
			return false;
		if (Double.doubleToLongBits(plotRefund) != Double.doubleToLongBits(other.plotRefund))
			return false;
		if (plotSize == null) {
			if (other.plotSize != null)
				return false;
		} else if (!plotSize.equals(other.plotSize))
			return false;
		if (Double.doubleToLongBits(total) != Double.doubleToLongBits(other.total))
			return false;
		return true;
	}
	
	
}
