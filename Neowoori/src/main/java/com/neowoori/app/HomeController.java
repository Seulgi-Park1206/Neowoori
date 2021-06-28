package com.neowoori.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
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
	
	@RequestMapping("/meetwrite") //게시판 글쓰기
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
	@RequestMapping("/meetView") //내 스터디 모임
	   public String meetView() {
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
	@RequestMapping("/jusoPopup") //주소 팝업
	   public String jusoPopup() {
	      return "jusoPopup";
	   }
	@RequestMapping("/adminpage") //관리자 페이지
	   public String adminpage() {
	      return "PJH_adminpage";
	   }


	@ResponseBody /*회원가입 ajax*/
	@RequestMapping(value="/sign.do", method=RequestMethod.POST)
	   public void birthajax(String uid, String uname,String upw, String unick, String umobile, String ugender, 
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
			System.out.println("null");
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
			System.out.println("null");
			return "0";
		}
	}
	
	@ResponseBody // 로그인 아이디 체크
	@RequestMapping(value="/login.do",method=RequestMethod.POST, produces="application/json")
	public String login_Check(HttpServletRequest request, HttpSession session){
		String ID = request.getParameter("uid");
		String PW = request.getParameter("upw");
		String today = request.getParameter("today");
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int dto = dao.pjhlogin(ID, PW);
		if(dto == 1) { //결과 값이 있으면 아이디 존재
			dao.pjhstate(today,ID); // 마지막 접속날짜
			session.setAttribute("userid", ID);
			return "1";
		} else {		//없으면 아이디 존재 X
			System.out.println("null");
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
			System.out.println("null");
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
	
	@ResponseBody // 내 스터디 게시판 (공지타입 불러오기)
	@RequestMapping(value="/studypost",method=RequestMethod.POST, produces="application/json")
	public ArrayList<BStudyPost> study_Post1(HttpServletRequest request){
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		ArrayList<BStudyPost> study_Post = dao.pjhStudyPost();
		return study_Post;
	}
	
	@ResponseBody // 내 스터디 게시판 count
	@RequestMapping(value="/postcount.do",method=RequestMethod.POST, produces="application/json")
	public int post_count(){
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int post_count = dao.pjsStudyPostCount();
		return post_count;
	}
	
	@ResponseBody // 내 스터디 게시판(페이징)
	@RequestMapping(value="/studypostpaging.do",method=RequestMethod.POST, produces="application/json")
	public ArrayList<BStudyPost> study_Post_Paging(HttpServletRequest request){
		int studypostpaging = Integer.parseInt(request.getParameter("btnvalue"));
		System.out.println(studypostpaging);
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		ArrayList<BStudyPost> study_Post_Paging = dao.pjhStudyPostPaging(studypostpaging);
		return study_Post_Paging;
	}
	
	/*---------------------------------------------*/
	
	//#############################################################
	//#############################################################
	//#############################################################
	
	/*---------------박슬기 영역----------------------*/
	// 로그아웃
	@ResponseBody
	@RequestMapping(value="/logout", method=RequestMethod.POST, produces="application/json")
	public void logout(HttpServletRequest request, HttpSession session){
		String state = request.getParameter("state");
		if(state.equals("logout"))	session.invalidate();
	}
	// 내 정보
	@RequestMapping("/mypage")
	public String myPage() {
		return "psgMypage";
	}
	// 내 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/mypage.do", method=RequestMethod.POST, produces="application/json")
    public JSONObject myPageLoad(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		String uid = (String) session.getAttribute("userid");
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		BMembers member = dao.psgUserInfo(uid);
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("userid", member.getUserId());
		hashmap.put("unick", member.getuNick());
		hashmap.put("uname", member.getuName());
		hashmap.put("uyear", member.getuYear());
		hashmap.put("ubirthday", member.getuBirthday());
		hashmap.put("ugender", member.getuGender());
		hashmap.put("umobile", member.getuMobile());
		hashmap.put("umail", member.getuMail());
		JSONObject jo = new JSONObject(hashmap);
		
		return jo;
    }
	// 내 정보 중복체크
	@ResponseBody
	@RequestMapping(value="/dup_check.do", method=RequestMethod.POST)
	public String myPageDupCheck(@RequestBody HashMap<String, String> user) {
		String uid = user.get("uid");
		String field = user.get("optype");
		String value = user.get("val");
		//System.out.println("uid: "+uid);
		//System.out.println("field: "+field);
		//System.out.println("value: "+value);
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
		//System.out.println("uid: "+uid);
		//System.out.println("field: "+field);
		//System.out.println("value: "+value);
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		dao.psgUpdateInfo(uid, field, value);
		
		return "ok";
	}
	// 스터디 게시판 글 보기
	@RequestMapping("/postView/{study_num}/{post_num}")
	public String postView(@PathVariable String study_num, @PathVariable String post_num,
			HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		// session_usid 가져오기
		String uid = (String) session.getAttribute("userid");
		
		// DB에서 해당 유저의 스터디 목록 조회
		//IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		
		return "psgPostView";
	}
	// 내 스터디 조회
	@RequestMapping("/meetList/{user_id}")
	public String meetList(@PathVariable String user_id, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		// session_usid 가져오기
		String uid = (String) session.getAttribute("userid");
		
		// DB에서 해당 유저의 스터디 목록 조회
		//IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		
		return "psgMeetList";
	}
	@ResponseBody // 내 스터디 목록 검색
	@RequestMapping(value="/meetList.do",method=RequestMethod.POST, produces="application/json")
	public String meetListDo(Model model, HttpServletRequest request, HttpSession session){
		String user_id = request.getParameter("uid");
		//IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		//model.addAttribute("mystudy", dao.psgStudyInfo(user_id));
		model.addAttribute("data", user_id);
		return "psgmeetList";
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
	   public String search() {
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
	
	@ResponseBody /*스터디생성 ajax*/
	@RequestMapping(value="/jsbCreate.do", method=RequestMethod.POST)
	   public void createAjax(String studyName,String bigSel,String smSel,String week,
			   String studyTime, String playTime,String lvlSel, String contents,String personnel,
			   String mwhere,String ulati,String ulongi,String userId,HttpServletRequest request,Model model) {
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
			IDaojsb dao = sqlSession.getMapper(IDaojsb.class);
			BMembers mem = dao.jsbGetUser(loginUId);
			int mUserNum = mem.getuNum();
//			System.out.println(mUserNum+","+mName+","+CATEGORY1+","+CATEGORY2+","+mWhere+","+mDay+","+mTime+","+mPtime+","+mLevel+","+mContents+","+mPersonnel+","+lati+","+longi);
			dao.jsbCreateStudy(mUserNum,mName,CATEGORY1,CATEGORY2,mWhere,mDay,mTime,mPtime,mLevel,mContents,mPersonnel,lati,longi);
	   }
	
	@ResponseBody
	@RequestMapping(value="/findMap.do", method=RequestMethod.POST,produces = "application/json")
		public ArrayList<BStudy> reqList(HttpServletRequest req) {
			IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
			String one = req.getParameter("one");
			String two = req.getParameter("two");
			System.out.println(one+","+two);
			ArrayList<BStudy> resp=dao.jsbGetTest();
			return resp;
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
	

