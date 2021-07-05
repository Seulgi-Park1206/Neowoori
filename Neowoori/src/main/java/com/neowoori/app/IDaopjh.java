package com.neowoori.app;

import java.sql.Date;
import java.util.ArrayList;

public interface IDaopjh {
	
	/*-----유저 정보 IDao (adminpeag)-----*/
	
	public void pjhUserdelete(int usernum); // 게시물 삭제
	
	public ArrayList<BMembers> pjhmemberlist(); //유저 정보 가져오기
	
	public ArrayList<BMembers> pjhmemberlist1(int unum); //유저번호로 유저 정보 가져오기
	
	public ArrayList<BMembersState> pjhStatelist(); //처음 유저상태 정보 가져오기
	
	public ArrayList<BMembersState> pjhpaging(int number); //이후 유저상태 정보 가져오기
	
	public int pjhStateCount(); //유저상태 총 개수
	
	/*-----유저 정보 IDao-----*/
	
	
	/*-----내 스터디 정보 IDao (meetView)-----*/
	
	public void pjhPostdelete(int postnum); // 게시물 삭제
	
	public int pjhstudystate(int uNum, int mNum); // 회원 종류
	
	public int pjhtitlecount(String title, int s_num); // 내 스터디 제목 검색 총 개수
	
	public int pjhwritercount(String unick, int s_num); // 내 스터디 작성자 검색 총 개수
	
	public ArrayList<BStudyPost> pjhwriter(String unick, int s_num, int number); // 작성자 검색
	
	public ArrayList<BStudyPost> pjhtitle(String title, int s_num, int number); // 제목 검색
	
	public ArrayList<BStudyPost> pjhStudyPost(int s_num); // 처음 내 스터디 리스트(공지)
	
	public ArrayList<BStudyPost> pjhStudyPostPaging(int number, int s_num); // 이후 내 스터디 리스트(공지)
	
	public int pjsStudyPostCount(int s_num); // 내 스터디 총 개수
	
	/*-----내 스터디 정보 IDao (meetView)-----*/
	
	/*-----유저 로그인 IDao (login)-----*/
	
	public int pjhlogin(String id, String pw);//유저 로그인
	
	public void pjhstate(String id); // 로그인 시 접속 날짜 업데이트
	
	/*-----유저 로그인 IDao (login)-----*/
	
	
	/*-----회원가입 IDao (signup)-----*/
	
	public void pjhsignup(String id, String name,String pw, String nick, String mobile, String gender, 
							String year, String birthday, String email, String josu, String lati, String longi);
	
	public int pjhIdChk(String userud); // 아이디 중복체크
	
	public int pjhNickChk(String unick); // 닉네임 중복체크
	
	/*-----회원가입 IDao (signup)-----*/
	
	
	/*-----유저 로그인 IDao (login)-----*/
	
	public int pjhadminlogin(String id, String pw); //관리자 로그인
	
	/*-----유저 로그인 IDao (login)-----*/
	
	
	
	/*-----유저 Num찾기 IDao (공통)(세션 사용하기 위해)-----*/
	
	public int pjhusernum(String id); // 유저 아이디로 num 찾기
	
	/*-----유저 Num찾기 IDao (공통)(세션 사용하기 위해)-----*/
	
	
	/*-----글쓰기 IDao (MeetWirte)-----*/
	
	public void pjhMeetWirte(String uid, String  s_id,  String result, String title, String Content); //글쓰기 추가
	
	/*-----글쓰기 IDao (MeetWirte)-----*/
	
	
	/*-----가입&내 스터디 리스트 IDao (MeetList)-----*/
	
	public ArrayList<BMeetingStudy> pjhMeetingStudy(int id); // 내 스터디 리스트 가져오기
	
	/*-----가입&내 스터디 리스트 IDao (MeetList)-----*/
}

