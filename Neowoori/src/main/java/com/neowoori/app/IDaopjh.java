package com.neowoori.app;

import java.util.ArrayList;

public interface IDaopjh {
	public ArrayList<BDto> pjhListDao();
	public void pjhSignDao(String userid, String name);
	public void pjhBirthDao(String userid, String name);
	public int pjhIdChk(String userud);
	public int pjhNickChk(String unick);
	public void pjhsignup(String id, String name,String pw, String nick, String mobile, String gender, 
							String year, String birthday, String email, String josu, String lati, String longi);
	public int pjhlogin(String id, String pw);
	public int pjhadminlogin(String id, String pw);
}

