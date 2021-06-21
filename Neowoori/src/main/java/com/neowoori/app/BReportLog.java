package com.neowoori.app;

public class BReportLog {
	int uNum;
	int reportNum;
	String r_report;
	String startDate;
	String endDate;
	
	public BReportLog() {

	}
	public BReportLog(int uNum, int reportNum, String r_report, String startDate, String endDate) {
		//super();
		this.uNum = uNum;
		this.reportNum = reportNum;
		this.r_report = r_report;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public int getuNum() {
		return uNum;
	}
	public void setuNum(int uNum) {
		this.uNum = uNum;
	}
	public int getReportNum() {
		return reportNum;
	}
	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}
	public String getR_report() {
		return r_report;
	}
	public void setR_report(String r_report) {
		this.r_report = r_report;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
}
