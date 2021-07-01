package com.neowoori.app;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DataVo {
	@JsonFormat(pattern="yyyy-MM-dd'T'hh:mm",timezone = "Asia/Seoul")
	private Timestamp time;

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}
	
	
}
