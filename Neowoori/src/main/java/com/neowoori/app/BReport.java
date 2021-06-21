package com.neowoori.app;

public class BReport {
	int reportNum;
	String uNum;
	String r_Group;
	int type1;
	int type2;
	int suNum;
	String r_contents;
	String r_date;
	int r_report;
	String reportDate;
	
	
	public BReport() {

	}
	public BReport(int reportNum, String uNum, String r_Group, int type1, int type2, int suNum, String r_contents,
			String r_date, int r_report, String reportDate) {
		//super();
		this.reportNum = reportNum;
		this.uNum = uNum;
		this.r_Group = r_Group;
		this.type1 = type1;
		this.type2 = type2;
		this.suNum = suNum;
		this.r_contents = r_contents;
		this.r_date = r_date;
		this.r_report = r_report;
		this.reportDate = reportDate;
	}
	public int getReportNum() {
		return reportNum;
	}
	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}
	public String getuNum() {
		return uNum;
	}
	public void setuNum(String uNum) {
		this.uNum = uNum;
	}
	public String getR_Group() {
		return r_Group;
	}
	public void setR_Group(String r_Group) {
		this.r_Group = r_Group;
	}
	public int getType1() {
		return type1;
	}
	public void setType1(int type1) {
		this.type1 = type1;
	}
	public int getType2() {
		return type2;
	}
	public void setType2(int type2) {
		this.type2 = type2;
	}
	public int getSuNum() {
		return suNum;
	}
	public void setSuNum(int suNum) {
		this.suNum = suNum;
	}
	public String getR_contents() {
		return r_contents;
	}
	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public int getR_report() {
		return r_report;
	}
	public void setR_report(int r_report) {
		this.r_report = r_report;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	
	}
