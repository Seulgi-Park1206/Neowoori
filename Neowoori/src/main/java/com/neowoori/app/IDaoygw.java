package com.neowoori.app;

import java.util.ArrayList;

public interface IDaoygw {
	public ArrayList<BAdminPost> listNoticeDao(); //게시물 목록
	public void writeNoticeDao(String title, String content);
	public String find_id(String uMail);
	public void updatePassword(String uPw,String userId);
	public int check_findpw(String userId,String uMail);
	public int check_email(String uMail);
}
