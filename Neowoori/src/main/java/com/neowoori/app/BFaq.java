package com.neowoori.app;

import java.security.Timestamp;

public class BFaq {
	
	int faqnum;
	String faqtitle;
	String faqcontent;
	String faqdate;
	String state;
	String answer;
	String writer;
	
	public BFaq() { //생성자
		
	}
	
	public BFaq(int faqnum, String faqtitle, String faqcontent, String faqdate, String state, String answer,String writer) {
		super();
		this.faqnum = faqnum;
		this.faqtitle = faqtitle;
		this.faqcontent = faqcontent;
		this.faqdate = faqdate;
		this.state = state;
		this.answer = answer;
		this.writer = writer;
	}

	public int getFaqnum() {
		return faqnum;
	}

	public String getFaqtitle() {
		return faqtitle;
	}

	public String getFaqcontent() {
		return faqcontent;
	}

	public String getstate() {
		return state;
	}

	public String getanswer() {
		return answer;
	}
	
	public String getFaqdate() {
		return faqdate;
	}
	
	public String getwriter() {
		return writer;
	}
	
	public void setFaqnum(int faqnum) {
		this.faqnum = faqnum;
	}

	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}

	public void setFaqcontent(String faqcontent) {
		this.faqcontent = faqcontent;
	}

	public void setFaqdate(String faqdate) {
		this.faqdate = faqdate;
	}
	
	public void setstate(String state) {
		this.state = state;
	}
	
	public void setanswer(String answer) {
		this.answer = answer;
	}
	
	public void setwriter(String writer) {
		this.writer = writer;
	}
}
