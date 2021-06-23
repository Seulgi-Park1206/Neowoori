package com.neowoori.app;

import java.sql.Date;
import java.util.ArrayList;

public interface IDaopjh {
	
	public ArrayList<BMembers> pjhmemberlist(); //유저 정보 가져오기
	public ArrayList<BMembersState> pjhStatelist(); //유저상태 정보 가져오기
	
	public int pjhIdChk(String userud); // 아이디 중복체크
	public int pjhNickChk(String unick); // 닉네임 중복체크
	//회원가입
	public void pjhsignup(String id, String name,String pw, String nick, String mobile, String gender, 
							String year, String birthday, String email, String josu, String lati, String longi);
	public void pjhstate(String lastjoin, String id);
	
	
	public int pjhlogin(String id, String pw);//유저 로그인
	public int pjhadminlogin(String id, String pw); //관리자 로그인
	
}

