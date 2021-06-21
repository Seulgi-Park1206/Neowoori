package com.neowoori.app;

import java.util.ArrayList;

public interface IDaopjh {
	public ArrayList<BDto> pjhListDao();
	public void pjhSignDao(String userid, String name);
	public void pjhBirthDao(String userid, String name);
	public int pjhIdChk(String userud);
	public int pjhNickChk(String unick);
}
