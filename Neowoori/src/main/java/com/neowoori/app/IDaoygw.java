package com.neowoori.app;

import java.util.ArrayList;

public interface IDaoygw {
	public ArrayList<BAdminPost> listNoticeDao(); //게시물 목록
	public void writeNoticeDao(String title, String content);
}
