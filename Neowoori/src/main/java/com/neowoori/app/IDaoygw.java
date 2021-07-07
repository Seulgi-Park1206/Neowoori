package com.neowoori.app;

import java.sql.Timestamp;
import java.util.ArrayList;

public interface IDaoygw {
	public ArrayList<BAdminPost> listNoticeDao(); //게시물 목록
	public void writeNoticeDao(String title, String content);
	public String find_id(String uMail);
	public void updatePassword(String uPw,String userId);
	public int check_findpw(String userId,String uMail);
	public int check_email(String uMail);
	public void writefaqDao(String faqtitle, String faqcontent,String state, String answer, String writer);
	public ArrayList<BFaq> listFaqDao();
	public float faqpostcount();
	public float noticepostcount();
	public ArrayList<BFaq> categorySelResult(String category,String keyword);
	public float categorySelResultCnt(String category,String keyword);
	public BFaq viewqna(int postnumber);
	public void deleteqna(int qnapostnumber);
	public void modifyqna(String qnatitle, String qnacontent,int qnapostnumber);
	
}
