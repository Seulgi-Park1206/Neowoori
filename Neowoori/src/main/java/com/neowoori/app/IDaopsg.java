package com.neowoori.app;

import java.util.ArrayList;

public interface IDaopsg { // DB 데이터 이용 관련 함수 작성
	// mypage
	public BMembers psgUserInfo(String uid);	// Select mypage_userInfo
	public void psgUpdateInfo(String id, String field, String value);	// Update mypage
	public int psgDupCheck(String id, String field, String value);	// Check Dup
	
	// study post
	public psgBViewPost psgSelectStudyPost(int pNum);	// Select Study Post
	public void psgUpdateStudyPost(int pNum, String title, String contents);	// Update Study Post
	public void psgDeleteStudyPost(int pNum);	// Delete Study Post
	
	// cmt of study post
	public ArrayList<psgBViewCmt> psgSelectCmt(int pNum);	// Select cmt of Study Post
	public void psgInsertCmt(int pNum, String id, String contents);	// Insert cmt
	public psgBViewCmt psgAddCmtSelect();	// Recent comments added
	public void psgDeleteCmt(int pNum, int cNum);	// Delete cmt of Study Post
	public void psgUpdateCmt(int pNum, int cNum, String contents);	// Update cmt
	
	// reCmt of study post
	public ArrayList<psgBViewCmt> psgSelectReCmt(int parentCnum);	// Select reCmt of Study Post
	public void psgInsertReCmt(int pNum, String id, String contents, int parentCnum);	// Insert ReCmt
	public psgBViewCmt psgAddReCmtSelect();	// Recent Recomments added
	public void psgDeleteReCmt(int pNum, int cNum);	// Delete ReCmt of Study post
	public void psgUpdateReCmt(int pNum, int cNum, String contents);	// Update ReCmt
	
	// study management
	public psgBStudyInfoView psgStudyInfo(int mnum);	// Select study information
	public void psgUpdateStudyInfo(int mNum, String mDay, String mTime,
			String mPTime, String mPersonnel);	// Update Study Info
	public void psgDeleteStudy(int mNum);	// Delete Study
}
