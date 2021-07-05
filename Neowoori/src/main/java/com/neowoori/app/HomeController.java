package com.neowoori.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	//전역 변수 영역
	//유건우
	
	//박주혁
	
	//박슬기
	
	//전석봉
	
	//--------------------------------------------------------
	public HomeController() {
		//전역변수 선언
		
		
		//
	}
	
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/") //
	public String toIndex() {
		return "redirect:/index";
	}
	
	/*---------------유건우 영역----------------------*/
	@RequestMapping("/index") //인덱스 page
	   public String index() {
	      return "ygwIndex";
	   }
	@RequestMapping("/email") //인덱스 page
	   public String email() {
	      return "email";
	   }
	
	@RequestMapping("/meetwrite") //게시판 글쓰기 //  스터디 아이디 
	   public String meetwrite() {
		return "ygwMeetwrite";
	   }
	
	@RequestMapping("/noticewrite") //공지사항 글쓰기
	   public String noticewrite() {
		
	      return "ygwNoticewrite";
	   }
	
	@RequestMapping(value="/noticeserver",method=RequestMethod.POST) //게시판 글쓰기
	   public String noticeserver(HttpServletRequest request,Model model) {
	      String title=request.getParameter("postTitle");
	      String content=request.getParameter("postContent");
	      IDaoygw dao= sqlSession.getMapper(IDaoygw.class);
	      dao.writeNoticeDao(title,content);
		return "redirect:/notice";
	   }
	
	@RequestMapping("/notice") //공지사항
	   public String notice(Model model) {
		  IDaoygw dao= sqlSession.getMapper(IDaoygw.class);
		  ArrayList<BAdminPost> alData=dao.listNoticeDao();
		  model.addAttribute("alData",alData);
	      return "ygwnoticetest";
	   }
	
	@RequestMapping("/qnawrite") //QnA글쓰기
	   public String qnawrite() {
	      return "ygwQnawrite";
	   }
	
	@RequestMapping("/webstudy") //webRTC
	   public String webstudy() {
	      return "ygwWebstudy";
	   }
	
	@RequestMapping("/findidPopup") //아이디찾기 팝업
	   public String findidPopup() {
	      return "ehsFindid";
	   }
	
	@RequestMapping("/findpwPopup") //아이디찾기 팝업
	   public String findpwPopup() {
	      return "ehsFindpw";
	   }
	
	
	String check_id="";
	@RequestMapping(value="/findidServer", method=RequestMethod.POST) //id찾기 서버
	@ResponseBody
	   public String checkfindidServer(String email,Model model) {
		  System.out.println("email 테스트 : "+email); 
	      IDaoygw dao=sqlSession.getMapper(IDaoygw.class);
	      int check_email=dao.check_email(email);
	      String final_check_email=Integer.toString(check_email);
	      
	      
	      if(final_check_email.equals("1")) {
	    	System.out.println("결과 있음");
	    	check_id= findidServer(email,model);
	    	System.out.println("id는 : "+check_id);
	    	 	 
	      }
	      else {
	    	  System.out.println("check 결과 없음 : "+final_check_email);
	      }
	      
	     return final_check_email;
	   }

	   public String findidServer(String email,Model model) {
	      IDaoygw dao=sqlSession.getMapper(IDaoygw.class);
	      String id=dao.find_id(email);
	    
	      return id;
	   }
	   
	   @RequestMapping("/findidfinal") //아이디찾기 팝업
	   public String findidfinal(Model model) {
		  model.addAttribute("id",check_id);
		  
	      return "ygwFindid_final";
	   }   
	   
	/* 비밀번호 찾기 */
	@RequestMapping(value="/findpwServer", method=RequestMethod.POST)
	@ResponseBody
	public String checkServer(String id,String email) throws Exception{
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		System.out.println(id);
		System.out.println(email);
		//email,id 있는지 체크
		IDaoygw dao=sqlSession.getMapper(IDaoygw.class);
		int count=dao.check_findpw(id,email);
		String check_count=Integer.toString(count);
		System.out.println("count 결과 : "+check_count);
		
		if(check_count.equals("1")) {
			findpwServer(id,email);
		}
		else{
			System.out.println("check 결과 없음");
		}
		
		/* id,email 검색해서 있으면 1, 없으면 0을 반환*/
		return check_count;
		
	}
	
	
	/* 비밀번호 찾기 임시 비밀번호 발송 메소드*/
	public void findpwServer(String id,String email) throws Exception{
		
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		System.out.println(id);
		System.out.println(email);
				
		IDaoygw dao=sqlSession.getMapper(IDaoygw.class);
				
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int tempPassword = random.nextInt(888888) + 111111;
		String password = Integer.toString(tempPassword);
		
		/* 비밀번호 임시비밀번호로 update */
		dao.updatePassword(password,id);
		
		
		/* 이메일 보내기 */
		String setFrom = "brokerdev99@gmail.com";
		String toMail = email;
		String title = "<비밀번호 찾기> 임시 비밀번호 발급 이메일 입니다.";
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." +
				"<br><br>" + 
				"임시 비밀번호는 " + tempPassword + "입니다." + 
				"<br>" + 
				"임시 비밀번호로 로그인하여 주십시오.";		
		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
				
	}
	
	/* 회원가입 이메일 인증 */
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public void mailCheckGET(String email) throws Exception{
		
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		System.out.println(email);
				
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 : "+checkNum);
		
		/* 이메일 보내기 */
		String setFrom = "brokerdev99@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." +
				"<br><br>" + 
				"인증 번호는 " + checkNum + "입니다." + 
				"<br>" + 
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";		
		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
				
	}
	/*---------------------------------------------*/
	
	//#############################################################
	//#############################################################
	//#############################################################
	
	/*---------------박주혁 영역----------------------*/
	@RequestMapping("/signup") //회원가입
	   public String signup() {
	      return "PJH_signup";
	   }
	@RequestMapping("/login") //유저 로그인
	   public String login() {
	      return "PJH_login";
	   }
	@RequestMapping("/adminlogin") //관리자 로그인
	   public String adminlogin() {
	      return "PJH_adminlogin";
	   }
	
	@RequestMapping("/meetView/{s_num}") //내 스터디 모임
	   public String meetView(@PathVariable String s_num, Model model) {
		model.addAttribute("s_num", s_num);
	      return "PJH_meetView";
	  }
	@RequestMapping("/faq") //자주 묻는 질문
	   public String faq() {
	      return "PJH_faq";
	   }
	/*
	@RequestMapping("/notice") //공지사항
	   public String notice() {
	      return "PJH_notice";
	   }
	*/
	@RequestMapping("/CompanyWrite") //회사소개 수정
	   public String CompanyWrite() {
	      return "PJH_CompanyWrite";
	   }
	@RequestMapping("/jusoPopup") //주소 팝업
	   public String jusoPopup() {
	      return "jusoPopup";
	   }
	@RequestMapping("/adminpage") //관리자 페이지
	   public String adminpage() {
	      return "PJH_adminpage";
	   }
	@RequestMapping("/adminpage1") //관리자 페이지
	   public String adminpage1() {
	      return "testadminpage";
	   }

	@ResponseBody /*회원가입 ajax*/
	@RequestMapping(value="/sign.do", method=RequestMethod.POST)
	   public void signup(String uid, String uname,String upw, String unick, String umobile, String ugender, 
			   				 String uyear, String ubirthday, String uemail, String ujuso, String ulati, String ulongi,  HttpServletRequest request) {
			String id = request.getParameter("uid");
			String name = request.getParameter("uname");
			String pw = request.getParameter("upw");
			String nick = request.getParameter("unick");
			String mobile = request.getParameter("umobile");
			String gender = request.getParameter("ugender");
			String year = request.getParameter("uyear");
			String birth = request.getParameter("ubirthday");
			String email = request.getParameter("uemail");
			String juso = request.getParameter("ujuso");
			String lati = request.getParameter("ulati");
			String longi = request.getParameter("ulongi");
			IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
			dao.pjhsignup(id, pw, name, nick, year, birth, gender, mobile, email, juso, lati, longi);
	   }
	
	
	@ResponseBody // 아이디 중복 체크
	@RequestMapping(value="/ID_Check.do",method=RequestMethod.POST, produces="text/plane")
	public String ID_Check(@RequestBody String paramData){
		//클라이언트가 보낸 ID값
		String ID = paramData.trim();
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int dto = dao.pjhIdChk(ID);
		
		if(dto == 1) {//결과 값이 있으면 아이디 존재	
			return "1";
		} else {		//없으면 아이디 존재 X
			return "0";
		}
	}
	
	@ResponseBody // 닉네임 중복 체크
	@RequestMapping(value="/Nick_Check.do",method=RequestMethod.POST, produces="text/plane1")
	public String Nick_Check(@RequestBody String paramData){
		//클라이언트가 보낸 Nick값
		String Nick = paramData.trim();
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int dto = dao.pjhNickChk(Nick);
		
		if(dto == 1) {//결과 값이 있으면 닉네임 존재	
			return "1";
		} else {		//없으면 닉네임 존재 X
			return "0";
		}
	}
	
	@ResponseBody // 로그인 아이디 체크
	@RequestMapping(value="/login.do",method=RequestMethod.POST, produces="application/json")
	public String login_Check(HttpServletRequest request, HttpSession session){
		String ID = request.getParameter("uid");
		String PW = request.getParameter("upw");
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int dto = dao.pjhlogin(ID, PW);
		if(dto == 1) { //결과 값이 있으면 아이디 존재
			dao.pjhstate(ID); // 마지막 접속날짜
			session.setAttribute("userid", ID);
			return "1";
		} else {		//없으면 아이디 존재 X
			return "0";
		}
	}
	
	@ResponseBody // 어드민 로그인 아이디 체크
	@RequestMapping(value="/adminlogin.do",method=RequestMethod.POST, produces="application/json")
	public String adminlogin_Check(String uid, String upw ,HttpServletRequest request, HttpSession session){
		String ID = request.getParameter("uid");
		String PW = request.getParameter("upw");
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int dto = dao.pjhadminlogin(ID, PW);
		
		if(dto == 1) {//결과 값이 있으면 아이디 존재
			session.setAttribute("adminid", ID);
			return "1";
		} else {		//없으면 아이디 존재 X
			return "0";
		}
	}
	
	@ResponseBody // 관리자 게시판(유저관리)
	@RequestMapping(value="/userlist.do",method=RequestMethod.POST, produces="application/json")
	public ArrayList<BMembersState> user_list(){
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		ArrayList<BMembersState> user_list = dao.pjhStatelist();
		return user_list;
	}
	@ResponseBody // 유저수 count
	@RequestMapping(value="/count.do",method=RequestMethod.POST, produces="application/json")
	public int user_count(){
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int user_count = dao.pjhStateCount();
		return user_count;
	}
	
	@ResponseBody // 관리자 게시판(유저관리)(팝업,modal)
	@RequestMapping(value="/usermodal.do",method=RequestMethod.POST, produces="application/json")
	public ArrayList<BMembers> user_modal(HttpServletRequest request){
		int unum = Integer.parseInt(request.getParameter("usernum"));
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		ArrayList<BMembers> user_list = dao.pjhmemberlist1(unum);
		return user_list;
	}
	
	@ResponseBody // 관리자 게시판(유저관리)(페이징)
	@RequestMapping(value="/btnnum.do",method=RequestMethod.POST, produces="application/json")
	public ArrayList<BMembersState> btn_num(HttpServletRequest request){
		int btnvalue = Integer.parseInt(request.getParameter("btnvalue"));
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		ArrayList<BMembersState> btn_num = dao.pjhpaging(btnvalue);
		return btn_num;
	}
	
	@ResponseBody // 관리자 유저관리 게시물 삭제
	@RequestMapping(value="/pjhuserdelete.do",method=RequestMethod.POST, produces="application/json")
	public int user_delete(@RequestBody HashMap<String, String> user_delete) throws Exception{
		int result=1;
            int cnt = Integer.parseInt(String.valueOf(user_delete.get("cnt")));
            String rprtOdr = String.valueOf(user_delete.get("arr"));
            String str1 = rprtOdr.replace(" ", ""); // 공백 자르기
            String str2 = str1.substring(1, str1.length()-1 ); // 앞뒤 [] 자르기
            String [] strArray = str2.split(",");
            System.out.println(cnt);
            System.out.println(rprtOdr);
            for(int i=0; i<cnt; i++) {
                int temp = Integer.parseInt((String)strArray[i]);
                IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
                dao.pjhUserdelete(temp);
            }
        return result;
       }
	
	@ResponseBody // 내 스터디 게시판 (공지타입 불러오기)
	@RequestMapping(value="/studypost",method=RequestMethod.POST, produces="application/json")
	public ArrayList<BStudyPost> study_Post1(@RequestBody HashMap<String, String> study_Post,HttpSession session){
		String s_num = String.valueOf(study_Post.get("s_num"));
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		session.setAttribute("s_num", s_num);
		ArrayList<BStudyPost> study__Post = dao.pjhStudyPost(Integer.parseInt(s_num));
		return study__Post;
	}
	
	@ResponseBody // 내 스터디 게시판 count
	@RequestMapping(value="/postcount.do",method=RequestMethod.POST, produces="application/json")
	public int post_count(@RequestBody HashMap<String, String> study_count){
		String s_num = String.valueOf(study_count.get("s_num"));
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int post_count = dao.pjsStudyPostCount(Integer.parseInt(s_num));
		return post_count;
	}
	
	@ResponseBody // 내 스터디 게시판(페이징)
	@RequestMapping(value="/studypostpaging.do",method=RequestMethod.POST, produces="application/json")
	public ArrayList<BStudyPost> study_Post_Paging(@RequestBody HashMap<String, String> study_paging){
		String s_num = String.valueOf(study_paging.get("s_num"));
		String btnvalue = String.valueOf(study_paging.get("btnvalue"));
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		ArrayList<BStudyPost> study_Post_Paging = dao.pjhStudyPostPaging(Integer.parseInt(s_num),Integer.parseInt(btnvalue));
		return study_Post_Paging;
	}
	@ResponseBody // 내 스터디 게시판 (제목 검색)
	@RequestMapping(value="/pjhtitle.do",method=RequestMethod.POST, produces="application/json")
	public ArrayList<BStudyPost> study_title(@RequestBody HashMap<String, String> title,HttpSession session){
		String post_title = String.valueOf(title.get("title_writer"));
		String post_s_num = String.valueOf(title.get("s_num"));
		String post_btnvalue = String.valueOf(title.get("btnvalue"));
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		ArrayList<BStudyPost> study_title = dao.pjhtitle(post_title,Integer.parseInt(post_s_num),Integer.parseInt(post_btnvalue));
		return study_title;
	}
	
	@ResponseBody // 내 스터디 게시판 (제목 검색)count
	@RequestMapping(value="/pjhtitlecount.do",method=RequestMethod.POST, produces="application/json")
	public int title_count(@RequestBody HashMap<String, String> title_count){
		String count_title = String.valueOf(title_count.get("title_writer"));
		String count_s_num = String.valueOf(title_count.get("s_num"));
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int post_count = dao.pjhtitlecount(count_title,Integer.parseInt(count_s_num));
		return post_count;
	}
	
	@ResponseBody // 내 스터디 게시판 (작성자 검색)
	@RequestMapping(value="/pjhwriter.do",method=RequestMethod.POST, produces="application/json")
	public ArrayList<BStudyPost> study_writer(@RequestBody HashMap<String, String> writer,HttpSession session){
		String post_writer = String.valueOf(writer.get("title_writer"));
		String post_s_num = String.valueOf(writer.get("s_num"));
		String post_btnvalue = String.valueOf(writer.get("btnvalue"));
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		ArrayList<BStudyPost> study_writer = dao.pjhwriter(post_writer,Integer.parseInt(post_s_num),Integer.parseInt(post_btnvalue));
		return study_writer;
	}
	
	@ResponseBody // 내 스터디 게시판 (제목 검색)count
	@RequestMapping(value="/pjhwritercount.do",method=RequestMethod.POST, produces="application/json")
	public int writer_count(@RequestBody HashMap<String, String> writer_count){
		String count_writer = String.valueOf(writer_count.get("title_writer"));
		String count_s_num = String.valueOf(writer_count.get("s_num"));
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int post_count = dao.pjhwritercount(count_writer,Integer.parseInt(count_s_num));
		return post_count;
	}
	
	@ResponseBody /*스터디 게시물 쓰기 ajax*/
	@RequestMapping(value="/MeetWirte", method=RequestMethod.POST)
	   public void MeetWirte(@RequestBody HashMap<String, String> user) {
			String p_uid = String.valueOf(user.get("usernum"));
			String p_sid = String.valueOf(user.get("s_id"));
			String p_title = String.valueOf(user.get("title"));
			String p_Content = String.valueOf(user.get("Content"));
//			String p_today = String.valueOf(user.get("today"));
			String p_result = String.valueOf(user.get("result"));
			IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
			dao.pjhMeetWirte(p_sid, p_uid, p_result, p_title, p_Content);
	   }
	
	@ResponseBody // 유저 num 받아오기
	@RequestMapping(value="/pjhusernum.do",method=RequestMethod.POST, produces="text/plane1")
	public String user_num(@RequestBody String paramData,HttpSession session){
		String uid = paramData.trim();
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int dto = dao.pjhusernum(uid);
		session.setAttribute("u_num", dto);
		return Integer.toString(dto);
	}
	
	@ResponseBody // 스터디장 & 일반회원 확인
	@RequestMapping(value="/studystate",method=RequestMethod.POST, produces="application/json")
	public int study_state(@RequestBody HashMap<String, String> state){
		String u_num = String.valueOf(state.get("u_num"));
		String s_num = String.valueOf(state.get("s_num"));
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int s_state = dao.pjhstudystate(Integer.parseInt(u_num),Integer.parseInt(s_num));
		return s_state;
	}
	
	
	@ResponseBody // 스터디장 게시물 삭제
	@RequestMapping(value="/pjhpostdelete.do",method=RequestMethod.POST, produces="application/json")
	public int post_delete(@RequestBody HashMap<String, String> post_delete) throws Exception{
		int result=1;
            int cnt = Integer.parseInt(String.valueOf(post_delete.get("cnt")));
            String rprtOdr = String.valueOf(post_delete.get("arr"));
            String str1 = rprtOdr.replace(" ", ""); // 공백 자르기
            String str2 = str1.substring(1, str1.length()-1 ); // 앞뒤 [] 자르기
            String [] strArray = str2.split(",");
            System.out.println(cnt);
            System.out.println(rprtOdr);
            for(int i=0; i<cnt; i++) {
                int temp = Integer.parseInt((String)strArray[i]);
                IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
                dao.pjhPostdelete(temp);
            }
        return result;
       }
	
	@ResponseBody // 회사 소개 수정
	@RequestMapping(value="/Company_write.do",method=RequestMethod.POST, produces="application/json")
	public String Company_write(String contents,HttpServletRequest request, HttpSession session){
		
		String Company_write = request.getParameter("contents");
		System.out.println(Company_write);
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		dao.pjhCompany(Company_write);
		
		return "complete";
	}
	
	@ResponseBody // 회사 소개 출력
	@RequestMapping(value="/Company_list.do",method=RequestMethod.POST, produces="application/json")
	public ArrayList<PJH_Company> Company_list(){
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		ArrayList<PJH_Company> Company_list = dao.pjhCompanylist();
		return Company_list;
	}
	
	
	
	/*---------------------------------------------*/
	
	//#############################################################
	//#############################################################
	//#############################################################
	
	/*---------------박슬기 영역----------------------*/
	// 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.POST, produces="application/json")
	public String logout(HttpServletRequest request, HttpSession session){
		String state = request.getParameter("state");
		if(state.equals("logout"))	session.invalidate();
		return "redirect:/index";
	}
	// 내 정보
	@RequestMapping("/mypage")
	public String myPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userid");
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		model.addAttribute("member", dao.psgUserInfo(uid));
		return "psgMypage";
	}
	// 내 정보 중복체크
	@ResponseBody
	@RequestMapping(value="/dup_check.do", method=RequestMethod.POST)
	public String myPageDupCheck(@RequestBody HashMap<String, String> user) {
		String uid = user.get("uid");
		String field = user.get("optype");
		String value = user.get("val");
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		int n = dao.psgDupCheck(uid, field, value);
		
		return Integer.toString(n);
	}
	// 내 정보 변경
	@ResponseBody
	@RequestMapping(value="/update_myInfo.do", method=RequestMethod.POST)
	public String myPageUpdateInfo(@RequestBody HashMap<String, String> user) {
		String uid = user.get("uid");
		String field = user.get("optype");
		String value = user.get("val");
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		dao.psgUpdateInfo(uid, field, value);
		
		return "ok";
	}
	// 스터디 게시판 게시글 및 댓글 보기
	@RequestMapping("/postView/{post_num}")
	public String postView(@PathVariable int post_num, Model model) {
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		model.addAttribute("post", dao.psgSelectStudyPost(post_num));
		model.addAttribute("cmt", dao.psgSelectCmt(post_num));
		return "psgPostView";
	}
	// 댓글 쓰기
	@ResponseBody
	@RequestMapping(value="/insertCmt.do", method=RequestMethod.POST)
	public JSONObject insertCmt(@RequestBody HashMap<String, String> hashmap,
			HttpServletRequest request, HttpSession session) {
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		int pNum = Integer.parseInt(hashmap.get("pNum"));
		System.out.println(pNum);
		session = request.getSession();
		String uid = (String) session.getAttribute("userid");
		System.out.println(uid);
		String content = hashmap.get("contents");
		System.out.println(hashmap.get("contents"));
		// 댓글 추가
		dao.psgInsertCmt(pNum, uid, content);
		// 추가한 댓글 조회
		psgBViewCmt cmt = dao.psgAddCmtSelect();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cmtnum",cmt.getCmtnum());
		map.put("userid", cmt.getUserid());
		map.put("cmtDate", cmt.getCmt_date());
		map.put("cmtContents", cmt.getCmt_contents());
		JSONObject jo = new JSONObject(map);
		System.out.println(jo);
		
		return jo;
	}
	// 게시물 삭제
	@ResponseBody
	@RequestMapping(value="/deletePost.do", method=RequestMethod.POST)
	public String deletePost(@RequestBody String postNum) {
		int pNum = Integer.parseInt(postNum);
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		//System.out.println("--"+pNum+"들어옴");
		dao.psgDeleteStudyPost(pNum);
		
		return "success";
	}
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value="/deleteCmt.do", method=RequestMethod.POST)
	public String deleteComment(@RequestBody HashMap<String, String> hashmap) {
		int pNum = Integer.parseInt(hashmap.get("postNum"));
		int cNum = Integer.parseInt(hashmap.get("coNum"));
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		//System.out.println("--"+pNum+"들어옴");
		//System.out.println("--"+cNum+"들어옴");
		dao.psgDeleteCmt(pNum, cNum);
		
		return "success";
	}
	// 게시물 수정
	@ResponseBody
	@RequestMapping(value="/updatePost.do", method=RequestMethod.POST)
	public String UpdatePostDo(@RequestBody HashMap<String, String> hashmap) {
		//System.out.println("-- 게시물 수정 시작 --");
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		int pNum = Integer.parseInt(hashmap.get("pNum"));
		dao.psgUpdateStudyPost(pNum, hashmap.get("title"), hashmap.get("contents"));
		//System.out.println("-- 수정 완료 --");
		
		return "success";
	}
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="/updateCmt.do", method=RequestMethod.POST)
	public String UpdateCmtDo(@RequestBody HashMap<String, String> hashmap) {
		System.out.println("-- 댓글 수정 시작 --");
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		int pNum = Integer.parseInt(hashmap.get("pNum"));
		int cNum = Integer.parseInt(hashmap.get("cNum"));
		dao.psgUpdateCmt(pNum, cNum, hashmap.get("contents"));
		System.out.println("-- 수정 완료 --");
		
		return "success";
	}
	// 내 스터디 조회 
	@RequestMapping("/meetList/{user_id}")
	public String meetList(@PathVariable String user_id, HttpServletRequest request, HttpSession session) {
	 	
	return "psgMeetList";
	}
	// 내 스터디 목록 검색
	@ResponseBody 
	@RequestMapping(value="/meetList.do",method=RequestMethod.POST,produces="application/json")
	public ArrayList<BMeetingStudy> meetListDo(Model model, HttpServletRequest request, HttpSession session){
		String user_id = request.getParameter("uid");
		System.out.println(user_id);
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int dto = dao.pjhusernum(user_id);
		System.out.println(dto);
		ArrayList<BMeetingStudy> meetingstudy = dao.pjhMeetingStudy(dto);
		//IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		//model.addAttribute("mystudy", dao.psgStudyInfo(user_id));
		//model.addAttribute("data", user_id);
		return meetingstudy;
	}
	// meetadmin
	@RequestMapping("/meetadmin/{study_id}")
	public String meetAdmin(@PathVariable String study_id, Model model) {
		model.addAttribute("s_id", study_id);
		return "psgMeetadmin";
	}
	// meetuser
	@RequestMapping("/meetuser/{study_id}")
	public String meetUser(@PathVariable String study_id, Model model) {
		model.addAttribute("s_id", study_id);
		return "psgMeetuser";
	}
	// 관리자 질문 답변
	@RequestMapping("/admin/{question_id}")
	public String question(@PathVariable String question_id, Model model) {
		model.addAttribute("q_id", question_id);
		return "psgQna";
	}
	/*---------------------------------------------*/
	
	//#############################################################
	//#############################################################
	//#############################################################
	
	/*---------------전석봉 영역----------------------*/
	@RequestMapping("/pop_message") //
	   public String popup_message(Model model, HttpServletRequest req) {
		IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
		model.addAttribute("alData",dao.jsbSelectlocation());
	      return "jsbPopMsg";
	   }
	
	@RequestMapping("/msgGetBox") //
	   public String msgGetBox() {
	      return "jsbMsgGetBox";
	   }
	
	@RequestMapping("/msgSetBox") //
	   public String msgSetBox() {
	      return "jsbMsgSetBox";
	   }
	
	
	@RequestMapping("/msgBox") //get
	   public String messageBox() {
	      return "jsbMsgBox";
	   }
	@RequestMapping("/search") //get
	   public String search(Model model,HttpSession session) {
		IDaojsb dao = sqlSession.getMapper(IDaojsb.class);
		//model.addAttribute("SearchData",dao.jsbListTypeOne());
		//System.out.println(dao.jsbListTypeOne().getClass().getName());
		//System.out.println(dao.jsbListTypeOne());
		ArrayList<jsbBListStudy> list = dao.jsbListTypeOne();
		//System.out.println(list.get(0).getmWhere());
		//System.out.println(list.size());
		//dd
		//session.setAttribute("userid","human1");
		//String sessionUserId = String.valueOf(session.getAttribute("userid"));
		
		//BMembers mem = dao.jsbGetUser(sessionUserId);
		//int mUserNum = mem.getuNum();
		//System.out.println(mUserNum);
		
		for (int i=0;i<list.size();i++) {
			String[] tempAddress=list.get(i).getmWhere().split(" ");
			//String adrCounty=tempAddress[0];
			//String adrCity=tempAddress[1];
			list.get(i).setAdrCounty(tempAddress[0]);
			list.get(i).setAdrCity(tempAddress[1]);
			
			//int meetUser=dao.jsbListFindMeetState(list.get(i).getmNum(), mUserNum);
			//System.out.println(meetUser);
			//list.get(i).setState(meetUser);
			//System.out.println(list.get(i).getCnt());
		}
		model.addAttribute("SearchData",list);
	      return "jsbSearch";
	   }
	
	@RequestMapping("/test") //get
	   public String test() {
	      return "jsbTest";
	   }
	
	@RequestMapping("/testindex") //get
	   public String testIndex() {
		
	      return "jsbTestIndex";
	   }
	
	@ResponseBody /*스터디명 중복찾기*/
	@RequestMapping(value="/jsbfindStudyName.do", method=RequestMethod.POST)
	   public int findStudyNameAjax(String studyName,HttpServletRequest request,Model model) {
			String mName = request.getParameter("studyName");
			IDaojsb dao = sqlSession.getMapper(IDaojsb.class);
			int mem = dao.jsbFindStudyName(mName);
			return mem;
//			System.out.println(mUserNum+","+mName+","+CATEGORY1+","+CATEGORY2+","+mWhere+","+mDay+","+mTime+","+mPtime+","+mLevel+","+mContents+","+mPersonnel+","+lati+","+longi);
	   }
	
	@ResponseBody /*스터디생성 ajax*/
	@RequestMapping(value="/jsbCreate.do", method=RequestMethod.POST)
	   public void createAjax(String studyName,String bigSel,String smSel,String week,
			   String studyTime, String playTime,String lvlSel, String contents,String personnel,
			   String ujso,String ujso2,String ujso3,String ulati,String ulongi,String userId,
			   HttpServletRequest request,Model model) {
			String mName = request.getParameter("studyName");
			String CATEGORY1 = request.getParameter("bigSel");
			String CATEGORY2 = request.getParameter("smSel");
			String mDay = request.getParameter("week");
			String mTime = request.getParameter("studyTime");
			String mPtime = request.getParameter("playTime");
			String mLevel = request.getParameter("lvlSel");
			String mContents = request.getParameter("contents");
			String mPersonnel = request.getParameter("personnel");
			String mWhere = request.getParameter("ujuso");
			String lati = request.getParameter("ulati");
			String longi = request.getParameter("ulongi");
			String loginUId = request.getParameter("userId");
			String mWhere2 = request.getParameter("ujuso2");
			String mWhere3 = request.getParameter("ujuso3");
			IDaojsb dao = sqlSession.getMapper(IDaojsb.class);
			BMembers mem = dao.jsbGetUser(loginUId);
			int mUserNum = mem.getuNum();
//			System.out.println(mUserNum+","+mName+","+CATEGORY1+","+CATEGORY2+","+mWhere+","+mDay+","+mTime+","+mPtime+","+mLevel+","+mContents+","+mPersonnel+","+lati+","+longi);
			dao.jsbCreateStudy(mUserNum,mName,CATEGORY1,CATEGORY2,mWhere,mDay,mTime,mPtime,mLevel,mContents,mPersonnel,lati,longi,mWhere2,mWhere3);
	   }
	
	@ResponseBody /*스터디생성후 meeting 생성 ajax*/
	@RequestMapping(value="/jsbCreateToMeet.do", method=RequestMethod.POST)
	   public void createToMeetAjax(String studyName,String userId,
			   HttpServletRequest request,Model model) {
			String mName = request.getParameter("studyName");
			String loginUId = request.getParameter("userId");
			IDaojsb dao = sqlSession.getMapper(IDaojsb.class);
			BMembers mem = dao.jsbGetUser(loginUId);
			int mUserNum = mem.getuNum();
			int reqMNum = dao.jsbFindStudyMnum(mUserNum,mName);
			int stateNum=30;
//			System.out.println("reqNUM:"+reqMNum);
//			System.out.println(mUserNum+","+reqMNum+","+stateNum);
			if(reqMNum > 1) dao.jsbCreateMeet(mUserNum,reqMNum,stateNum);
			}
	
	@ResponseBody
	@RequestMapping(value="/findMap.do", method=RequestMethod.POST,produces = "application/json")
		public ArrayList<BStudy> reqList(HttpServletRequest req) {
			IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
//			String one = req.getParameter("one");
//			String two = req.getParameter("two");		
//			System.out.println(one+","+two);
			ArrayList<BStudy> resp=dao.jsbGetStudyInfo();
			return resp;
	   }
	
	@ResponseBody	/*가입신청 상태인지 아닌지 확인*/
	@RequestMapping(value="/jsbFindMeetStudy.do", method=RequestMethod.POST,produces = "application/json")
		public int jsbFindMeetStudy(String mNumHid, String userId, HttpServletRequest req) {
			IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
			int mNum = Integer.parseInt(req.getParameter("mNumHid"));
			String uId = req.getParameter("userId");
			BMembers mem = dao.jsbGetUser(uId);
			int uNum = mem.getuNum();
//			System.out.println("unum: "+uNum);
//			System.out.println(mNum+","+mUserNum);
			int signOn=dao.jsbFindStudySignon(mNum, uNum);
			if (signOn==0) {
				return 0;
			}else {
				int state = dao.jsbFindUserStateMeeting(mNum,uNum);
				return state;
			}
	   }
	
	@ResponseBody	/*스터디 가입신청*/
	@RequestMapping(value="/jsbJoinStudy.do", method=RequestMethod.POST,produces = "application/json")
		public void jsbJoinStudy(String mNumHid, String userId, HttpServletRequest req) {
			IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
			int mNum = Integer.parseInt(req.getParameter("mNumHid"));
			String uId = req.getParameter("userId");
			BMembers mem = dao.jsbGetUser(uId);
			int uNum = mem.getuNum();
			dao.jsbJoinStudy(uNum,mNum);
	   }
	
	@ResponseBody	/*스터디 가입취소*/
	@RequestMapping(value="/jsbCancelJoin.do", method=RequestMethod.POST,produces = "application/json")
		public void jsbCancelJoin(String mNumHid, String userId, HttpServletRequest req) {
			IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
			int mNum = Integer.parseInt(req.getParameter("mNumHid"));
			String uId = req.getParameter("userId");
			BMembers mem = dao.jsbGetUser(uId);
			int uNum = mem.getuNum();
			dao.jsbCancelJoin(uNum,mNum);
	   }
	
	@ResponseBody	/*스터디 탈퇴*/
	@RequestMapping(value="/jsbJoinOut.do", method=RequestMethod.POST,produces = "application/json")
		public void jsbJoinOut(String mNumHid, String userId, HttpServletRequest req) {
			IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
			int mNum = Integer.parseInt(req.getParameter("mNumHid"));
			String uId = req.getParameter("userId");
			BMembers mem = dao.jsbGetUser(uId);
			int uNum = mem.getuNum();
			dao.jsbJoinOut(uNum,mNum);
	   }
	
	@ResponseBody	/*Modal Send MSG*/
	@RequestMapping(value="/jsbSendModalMsg.do", method=RequestMethod.POST,produces = "application/json")
		public void jsbSendModalMsg(String userId, String cont, String mAdminNick, HttpServletRequest req) {
			IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
			//int mNum = Integer.parseInt(req.getParameter("mNumHid"));
			String uId = req.getParameter("userId");
			String contents = req.getParameter("cont");
			String adminNick = req.getParameter("mAdminNick");
			BMembers mem1 = dao.jsbGetUser(uId);
			int uNum = mem1.getuNum();
			BMembers mem2 = dao.jsbGetUserNick(adminNick);
			int recNum = mem2.getuNum();
			dao.jsbSendModalMsg(uNum,recNum,contents);
	   }
	
	@ResponseBody	/*Search study btn*/
	@RequestMapping(value="/jsbSearchPageBtn.do", method=RequestMethod.POST,produces = "application/json")
		public int jsbSearchPageBtn(String mNum, HttpServletRequest req,HttpSession session) {
			IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
			int mNums = Integer.parseInt(req.getParameter("mNum"));
			session.setAttribute("userid","human1");
			String sessionUserId = String.valueOf(session.getAttribute("userid"));
			BMembers mem = dao.jsbGetUser(sessionUserId);
			int mUserNum = mem.getuNum();
			//System.out.println(mUserNum);
			//System.out.println(mNums);
			return dao.jsbListFindMeetState(mNums,mUserNum);
	   }
	
	/*---------------------------------------------*/
	
	//#############################################################
	//#############################################################
	//#############################################################
	
	/*---------------엄홍성 영역----------------------*/
	@RequestMapping("/company") //회사소개 페이지 이동
	   public String company() {
	      return "ehsCompany";
	   }
/*
	@RequestMapping("/findid") //아이디찾기
	   public String findid() {
	      return "ehsFindid";
	   }
	@RequestMapping("/findpw") //비밀번호찾기
	   public String findpw() {
	      return "ehsFindpw";
	   }
*/
	
	@RequestMapping("/create") //게시글만들기
	   public String create() {
	      return "ehsCreate";
	   }
	
//	@RequestMapping("/findid") //아이디 찾기
//	   public String findid(HttpServletRequest req, Model model) {
//		HttpSession session = req.getSession();
//		String uName=req.getParameter("getName");
//		int uMobile=Integer.parseInt(req.getParameter("getMobile"));
//	    iDao dao = sqlSession.getMapper(iDao.class);
//	    model.addAttribute("alData", dao.findID(uName,uMobile));
//	    	return "findId";
//	   }
	
	/*---------------------------------------------*/
	
		
		
	/*---------------전석봉 영역----------------------*/

			/*---------------------------------------------
		   @ResponseBody
		   @RequestMapping(value="/post.do", method=RequestMethod.POST,produces = "application/json")
		   public ArrayList<BDto> reqList() {
			   IDao_jsb dao=sqlSession.getMapper(IDao_jsb.class);
			   ArrayList<BDto> alData=dao.getMap();
			   return alData;
		   }
		   */
}
	

