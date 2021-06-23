package com.neowoori.app;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import org.slf4j.*;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neowoori.app.IDaojsb;
import com.neowoori.app.BDto;
import com.neowoori.app.BStudy;

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
	      return "ygwemail";
	   }
	
	/* 이메일 인증 */
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		
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
		
		String num = Integer.toString(checkNum);
		
		return num;
		
	}
	
	@RequestMapping("/signup")
	   public String checkNum() {
		  
	      return "PJH_signup";
	   }

	@RequestMapping("/signuptest") //인덱스 page
	   public String signuptest() {
	      return "ygwjoin";
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
	
	@RequestMapping("/qnawrite") //QnA글쓰기
	   public String qnawrite() {
	      return "ygwQnawrite";
	   }
	
	@RequestMapping("/webstudy") //webRTC
	   public String webstudy() {
	      return "ygwWebstudy";
	   }
	/*---------------------------------------------*/
	
	//#############################################################
	//#############################################################
	//#############################################################
	
	/*---------------박주혁 영역----------------------*/
	/*@RequestMapping("/signup") //회원가입
	   public String signup(Model model) {
		  model.addAttribute("check",checkNum);
	      return "PJH_signup";
	   }*/
		
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
	/*@RequestMapping("/notice") //공지사항
	   public String notice() {
	      return "ygwNoticetest";
	   }*/
	
	@RequestMapping("/notice") //공지사항
	   public String notice(Model model) {
		  IDaoygw dao= sqlSession.getMapper(IDaoygw.class);
		  ArrayList<BAdminPost> alData=dao.listNoticeDao();
		  model.addAttribute("alData",alData);
	      return "ygwnoticetest";
	   }
	
	@RequestMapping("/jusoPopup") //주소 팝업
	   public String jusoPopup() {
	      return "jusoPopup";
	   }
	
//	@ResponseBody /*AJAX 연동 성공 ( json으로 받아와서 한번에 저장할 예정),(아직 이메일 인증방법 적용 생각못함)*/
//	@RequestMapping(value="/sign.do", method=RequestMethod.POST)
//	   public void signupajax(String uid, String uname, HttpServletRequest request) {
//			String id = request.getParameter("uid");
//			String name = request.getParameter("uname");
//			System.out.println(id);
//			System.out.println(name);
//			IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
//			dao.pjhSignDao(id, name);
//	   }

	@ResponseBody /*생년월일 가능한지 테스트*/
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
			System.out.println(id);
			System.out.println(name);
			System.out.println(pw);
			System.out.println(nick);
			System.out.println(mobile);
			System.out.println(gender);
			System.out.println(year);
			System.out.println(birth);
			System.out.println(email);
			System.out.println(juso);
			System.out.println(lati);
			System.out.println(longi);
			IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
			dao.pjhsignup(id, pw, name, nick, year, ubirthday, gender, mobile, email, juso, lati, longi);
	   }
	
	
	@ResponseBody // 아이디 중복 체크
	@RequestMapping(value="/ID_Check.do",method=RequestMethod.POST, produces="text/plane")
	public String ID_Check(@RequestBody String paramData){
		//클라이언트가 보낸 ID값
		String ID = paramData.trim();
		System.out.println(ID);
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
		System.out.println(Nick);
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		int dto = dao.pjhNickChk(Nick);
		
		if(dto == 1) {//결과 값이 있으면 닉네임 존재	
			return "1";
		} else {		//없으면 닉네임 존재 X
			System.out.println("null");
			return "0";
		}
	}
	
	/*---------------------------------------------*/
	
	//#############################################################
	//#############################################################
	//#############################################################
	
	/*---------------박슬기 영역----------------------*/
	// mypage
	@RequestMapping("/mypage")
    public String myPage(Model model) {
		IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
		model.addAttribute("alData",dao.jsbSelectlocation());
		return "psgMypage";
    }
	@RequestMapping("/meetList/{user_id}")
	public String meetList(@PathVariable String user_id, Model model) {
		model.addAttribute("u_id", user_id);
		return "psgMeetList";
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
	
	@RequestMapping("/test") //get
	   public String test() {
	      return "jsbTest";
	   }
	
	@RequestMapping("/testindex") //get
	   public String testIndex() {
	      return "jsbTestIndex";
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
	@RequestMapping("/findid") //아이디찾기
	   public String companya() {
	      return "ehsFindid";
	   }
	@RequestMapping("/findpw") //비밀번호찾기
	   public String companyaa() {
	      return "ehsFindpw";
	   }
	@RequestMapping("/create") //게시글만들기
	   public String companyaaa() {
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
	@ResponseBody
	   @RequestMapping(value="/findMap.do", method=RequestMethod.POST,produces = "application/json")
	   public ArrayList<BStudy> reqList() {
		   IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
		   ArrayList<BStudy> resp=dao.jsbGetTest();
		   return resp;
	   }
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
	

