package com.neowoori.app;

public class BDto {
	int bId;
	String bName;
	
	BDto(){ // 생성자 꼭필요
		
	}
	public BDto(int bId, String bName) {
	      this.bId = bId;
	      this.bName = bName;
	   }
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
}
