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
		  ArrayList<BAdminPost> noticeData=dao.listNoticeDao();
		  model.addAttribute("noticeData",noticeData);
		  String paging="";
		  float noticecnt=dao.noticepostcount();
		  for(int i=0; i<Math.ceil(noticecnt/10); i++) {
			  paging+="<a href=#"+(i+1)+" name='page' value="+(i+1)+">"+(i+1)+"</a>";
		  }
		  model.addAttribute("paging",paging);
		  model.addAttribute("lastPage",Math.ceil(noticecnt/10));
		  
	      return "ygw_notice";
	   }
	
	/*
	@RequestMapping("/faqserver") //자주 묻는 질문 검색 페이징
	@ResponseBody
	   public void faqserver(String category, String keyword) {
		  //String category=request.getParameter("category");
		  //String keyword=request.getParameter("keyword");
		System.out.println("category : "+category);
		System.out.println("keyword : "+keyword);
		  IDaoygw dao= sqlSession.getMapper(IDaoygw.class);
		  dao.categorySelResultCnt(category,keyword);
	      //return "ygwFaw";
	}*/
	
	@RequestMapping("/notice/{noticepostid}") //자주 묻는 질문
	   public String noticeView(@PathVariable int noticepostid,Model model) {
		  IDaoygw dao= sqlSession.getMapper(IDaoygw.class);
		  BAdminPost viewnotice=dao.viewnotice(noticepostid);
		  model.addAttribute("noticelist",viewnotice);
		  
	      return "ygw_viewNotice";
	}
	
	@RequestMapping("/qnawrite") //자주 묻는 질문
	   public String Qnawrite() {
	      return "ygw_Qnawrite";
	}
	
	@RequestMapping("/qna") //자주 묻는 질문
	   public String faq(Model model) {
		  IDaoygw dao= sqlSession.getMapper(IDaoygw.class);
		  ArrayList<BFaq> faqData=dao.listFaqDao(); //faq의 faqnum,faqtitle,faqcontent,faqdate 정보가져옴
		  model.addAttribute("faqData",faqData);
		  
		  String paging="";
		  float faqcnt=dao.faqpostcount(); //faq 게시글 총갯수 가져옴
		  
		  for(int i=0; i<Math.ceil(faqcnt/10); i++){
			  paging+="<a href=#"+(i+1)+" name='page' value="+(i+1)+">"+(i+1)+"</a>";
		  }
		  
		  model.addAttribute("paging",paging);
		  model.addAttribute("lastPage",Math.ceil(faqcnt/10));
		  
	      return "ygwQna";
	}
	
	@RequestMapping("/qna/{qnapostid}") //qna
	   public String viewQna(@PathVariable int qnapostid,Model model) {
		System.out.println("qnaid 값 : "+qnapostid);
		IDaoygw dao= sqlSession.getMapper(IDaoygw.class);
		BFaq viewqna=dao.viewqna(qnapostid);
		model.addAttribute("qnalist",viewqna);
		
	    return "ygw_viewQna";
	}
	
	// qna 수정
	@RequestMapping("/qnamodify/{qnapostnum}/{qnawriter}")
	public String modify(@PathVariable int qnapostnum,@PathVariable String qnawriter, Model model) {
		IDaoygw dao= sqlSession.getMapper(IDaoygw.class);
		BFaq viewqna=dao.viewqna(qnapostnum);
		model.addAttribute("modifyqna",viewqna);
		
		return "ygwupdateQna";
	}
	
	@RequestMapping(value="/modifyqna",method=RequestMethod.POST)
	public String modifymethod(HttpServletRequest request,Model model) {
		
		int qnapostnum=Integer.parseInt(request.getParameter("qnapostnum"));
		String qnatitle=request.getParameter("qnatitle");
		String qnacontent=request.getParameter("qnacontent");
		IDaoygw dao= sqlSession.getMapper(IDaoygw.class);
		dao.modifyqna(qnatitle,qnacontent,qnapostnum);
		return "redirect:/qna/"+qnapostnum;
	}
	
	
		/*
		@RequestMapping("/modify/{qnapostid}/{id}")
		public String modify(@PathVariable int qnapostid,@PathVariable String id,Model model) {
			IDaoygw dao=sqlSession.getMapper(IDaoygw.class);
			//BDto data=dao.viewDao(bId);
			//model.addAttribute("rec",data);
			return "update";
		}
		*/
	
//	//qna 삭제
	@RequestMapping("/qnadelete/{qnapostnum}") //qna 삭제
	   public String deleteQna(@PathVariable int qnapostnum,Model model) {
		IDaoygw dao= sqlSession.getMapper(IDaoygw.class);
		dao.deleteqna(qnapostnum);
		
	    return "redirect:/qna";
	}
	
	@RequestMapping("/noticedelete/{noticepostnum}") //qna 삭제
	   public String deleteNotice(@PathVariable int noticepostnum,Model model) {
		IDaoygw dao= sqlSession.getMapper(IDaoygw.class);
		dao.deleteNotice(noticepostnum);
		
	    return "redirect:/notice";
	}
	
		@RequestMapping(value="/Qnaserver",method=RequestMethod.POST) //Qna 게시판 글쓰기
		   public String faqserver(HttpServletRequest request,Model model,HttpSession session) {
		      String faqtitle=request.getParameter("faqTitle");
		      String faqcontent=request.getParameter("faqContent");
		      String writer=(String)session.getAttribute("userid");
		      String state="답변대기중";
		      String answer="";
		      IDaoygw dao= sqlSession.getMapper(IDaoygw.class);
		      dao.writefaqDao(faqtitle,faqcontent,state,answer,writer);
			return "redirect:/qna";
		   }
	
/////////////////////////////////////////////검색 페이징///////////////////////////////////////////

			float n = 0;

			@RequestMapping("/faqserver2") // faq 검색 페이징
			@ResponseBody
			public ArrayList<BFaq> faqserver2(Model model, HttpServletRequest request) {
				String category = request.getParameter("category");
				String keyword = request.getParameter("keyword");
				ArrayList<BFaq> faqSelResult = new ArrayList<BFaq>();
				IDaoygw dao = sqlSession.getMapper(IDaoygw.class);

				if (category != null && category != "") {
					System.out.println("카테고리" + category);
					if (keyword != null && keyword != "") {
						System.out.println("키워드" + keyword);
						faqSelResult = dao.categorySelResult(category, keyword);
						System.out.println("사이즈 : " + faqSelResult.size());
					}
				}

				return faqSelResult;
			}
	
			@RequestMapping("/faqserver3") // 자주 묻는 질문
			public String faqserver3() {

				return "ygw_Faq";
			}		
			
			/*
			@ResponseBody // 내 스터디 게시판 count
			@RequestMapping(value="/faqcount.do",method=RequestMethod.POST, produces="application/json")
			public int faq_count(@RequestBody HashMap<String, String> study_count){
				String s_num = String.valueOf(study_count.get("s_num"));
				IDaoygw dao = sqlSession.getMapper(IDaoygw.class);
				int post_count = dao.faqpostcount(Integer.parseInt(s_num));
				return post_count;
			}
			*/
			
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
		
		return Integer.toString(checkNum);	
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
	@RequestMapping("/faq") //자주 묻는 질문 *삭제페이지
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
	@ResponseBody // 관리자 게시판(QnA)
	@RequestMapping(value="/Qnalist.do",method=RequestMethod.POST, produces="application/json")
	public ArrayList<BFaq> QnA_list(){
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		ArrayList<BFaq> qna_list = dao.pjhQnAlist();
		return qna_list;
	}
	
	@ResponseBody // 관리자 게시판(QnA)(페이징)
	@RequestMapping(value="/btnqna.do",method=RequestMethod.POST, produces="application/json")
	public ArrayList<BFaq> btn_qna(HttpServletRequest request){
		int btnvalue = Integer.parseInt(request.getParameter("btnvalue"));
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		ArrayList<BFaq> btn_num = dao.pjhQnAlistnext(btnvalue);
		return btn_num;
	}
	
	@ResponseBody // 관리자 게시판(QnA)(팝업,modal)
	@RequestMapping(value="/Qnamodal.do",method=RequestMethod.POST, produces="application/json")
	public ArrayList<BFaq> qna_modal(HttpServletRequest request){
		int Qnum = Integer.parseInt(request.getParameter("qnanum"));
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		ArrayList<BFaq> Qna_list = dao.pjhQnamodal(Qnum);
		return Qna_list;
	}
	
	@ResponseBody // QnA 답변 (수정)
	@RequestMapping(value="/Qnaanswer.do",method=RequestMethod.POST)
	public String Qna_answer(@RequestBody HashMap<String, String> Qna_answer){
		String Qnaanswer = String.valueOf(Qna_answer.get("answer"));
		String qnanum = String.valueOf(Qna_answer.get("qnanum"));
		System.out.println(Qnaanswer);
		System.out.println(qnanum);
		String state = "답변 완료";
		IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
		dao.pjhQnaanswer(Qnaanswer,state,Integer.parseInt(qnanum));
		
		return "complete";
	}
	
	@ResponseBody // 관리자 QnA 게시물 삭제
	@RequestMapping(value="/pjhqnadelete.do",method=RequestMethod.POST, produces="application/json")
	public int qna_delete(@RequestBody HashMap<String, String> qna_delete) throws Exception{
		int result=1;
            int cnt = Integer.parseInt(String.valueOf(qna_delete.get("cnt")));
            String rprtOdr = String.valueOf(qna_delete.get("arr"));
            String str1 = rprtOdr.replace(" ", ""); // 공백 자르기
            String str2 = str1.substring(1, str1.length()-1 ); // 앞뒤 [] 자르기
            String [] strArray = str2.split(",");
            System.out.println(cnt);
            System.out.println(rprtOdr);
            for(int i=0; i<cnt; i++) {
                int temp = Integer.parseInt((String)strArray[i]);
                IDaopjh dao = sqlSession.getMapper(IDaopjh.class);
                dao.pjhQnAdelete(temp);
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
	@ResponseBody
	@RequestMapping(value="/logout", method=RequestMethod.POST, produces="application/json")
	public void logout(HttpServletRequest request, HttpSession session){
		String state = request.getParameter("state");
		if(state.equals("logout"))	session.invalidate();
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
		session = request.getSession();
		String uid = (String) session.getAttribute("userid");
		String content = hashmap.get("contents");
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
		dao.psgDeleteCmt(pNum, cNum);
		
		return "success";
	}
	// 게시물 수정
	@ResponseBody
	@RequestMapping(value="/updatePost.do", method=RequestMethod.POST)
	public String UpdatePostDo(@RequestBody HashMap<String, String> hashmap) {
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		int pNum = Integer.parseInt(hashmap.get("pNum"));
		dao.psgUpdateStudyPost(pNum, hashmap.get("title"), hashmap.get("contents"));
		
		return "success";
	}
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="/updateCmt.do", method=RequestMethod.POST)
	public String UpdateCmtDo(@RequestBody HashMap<String, String> hashmap) {
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		int pNum = Integer.parseInt(hashmap.get("pNum"));
		int cNum = Integer.parseInt(hashmap.get("cNum"));
		dao.psgUpdateCmt(pNum, cNum, hashmap.get("contents"));
		
		return "success";
	}
	// 대댓글 검색
	@ResponseBody
	@RequestMapping(value="/selectReCmt.do", method=RequestMethod.POST)
	public JSONArray selectReCmtDo(@RequestBody String cmt_num) {
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		int cNum = Integer.parseInt(cmt_num);
		System.out.println(cNum);
		// 해당 댓글의 대댓글 조회
		ArrayList<psgBViewCmt> reCmt = dao.psgSelectReCmt(cNum);
		System.out.println("reCmt.size(): "+reCmt.size());
		JSONArray jarray = new JSONArray();
		for(int i=0; i<reCmt.size();i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("cmtnum",reCmt.get(i).getCmtnum());
			map.put("userid", reCmt.get(i).getUserid());
			map.put("cmtDate", reCmt.get(i).getCmt_date());
			map.put("cmtContents", reCmt.get(i).getCmt_contents());
			JSONObject jo = new JSONObject(map);
			System.out.println("대댓글 조회: "+jo);
			jarray.add(jo);
		}
		
		return jarray;
	}
	// 대댓글 추가
	@ResponseBody
	@RequestMapping(value="/insertReCmt.do", method=RequestMethod.POST)
	public JSONObject insertReCmtDo(@RequestBody HashMap<String, String> hashmap,
			HttpServletRequest request, HttpSession session) {
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		int pNum = Integer.parseInt(hashmap.get("pNum"));
		System.out.println(pNum);
		String uid = (String) session.getAttribute("userid");
		String content = hashmap.get("contents");
		System.out.println(hashmap.get("contents"));
		int parentNum = Integer.parseInt(hashmap.get("parentNum"));
		System.out.println("parentNum"+parentNum);
		// 댓글 추가
		dao.psgInsertReCmt(pNum, uid, content, parentNum);
		// 추가한 댓글 조회
		psgBViewCmt reCmt = dao.psgAddReCmtSelect();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cmtnum",reCmt.getCmtnum());
		map.put("userid", reCmt.getUserid());
		map.put("cmtDate", reCmt.getCmt_date());
		map.put("cmtContents", reCmt.getCmt_contents());
		JSONObject jo = new JSONObject(map);
		System.out.println("jo: "+jo);
		
		return jo;
	}
	// 대댓글 삭제
	
	// 대댓글 수정
	
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
	// 스터디장 페이지(스터디관리)
	@RequestMapping("/meetadmin/{study_id}")
	public String meetAdmin(@PathVariable int study_id, Model model) {
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		System.out.println(study_id);
		model.addAttribute("studyInfo", dao.psgStudyInfo(study_id));
		
		return "psgMeetadmin";
	}
	// 스터디 정보 수정
	@ResponseBody
	@RequestMapping(value="/updateStudyInfo.do", method=RequestMethod.POST)
	public String updateStudyInfoDo(@RequestBody HashMap<String, String> hashmap) {
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		int mNum = Integer.parseInt(hashmap.get("sNum"));
		dao.psgUpdateStudyInfo(mNum, hashmap.get("sWeek"), hashmap.get("sTime"), hashmap.get("pTime"),
				hashmap.get("psn"));
		
		return "success";
	}
	// 스터디 삭제
	@ResponseBody
	@RequestMapping(value="/deleteStudyInfo.do", method=RequestMethod.POST)
	public String deleteStudyDo(@RequestBody String sNum) {
		IDaopsg dao = sqlSession.getMapper(IDaopsg.class);
		int mNum = Integer.parseInt(sNum);
		dao.psgDeleteStudy(mNum);
		
		return "success";
	}
	// 스터디장 페이지(스터디관리)-회원관리
	@RequestMapping("/meetuser/{study_id}")
	public String meetUser(@PathVariable int study_id, Model model) {
		//model.addAttribute("s_id", study_id);
		//study_id사용하면됨
		IDaojsb dao = sqlSession.getMapper(IDaojsb.class);
		ArrayList<jsbBMeetUserList> resp=dao.jsbMeetUserList(study_id);
		model.addAttribute("resp", resp);
		
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
			//session.setAttribute("userid","human1");
			String sessionUserId = String.valueOf(session.getAttribute("userid"));
			BMembers mem = dao.jsbGetUser(sessionUserId);
			int mUserNum = mem.getuNum();
			//System.out.println(mUserNum);
			//System.out.println(mNums);
			return dao.jsbListFindMeetState(mNums,mUserNum);
	   }
	
	@ResponseBody	/*Search study first page*/
	@RequestMapping(value="/jsbSearchPageFirst.do", method=RequestMethod.POST,produces = "application/json")
		public ArrayList<jsbBListStudy> jsbSearchPagefirst(String mNum, HttpServletRequest req,HttpSession session) {
		IDaojsb dao = sqlSession.getMapper(IDaojsb.class);
		ArrayList<jsbBListStudy> list = dao.jsbListTypeOne();
		for (int i=0;i<list.size();i++) {
			String[] tempAddress=list.get(i).getmWhere().split(" ");
			list.get(i).setAdrCounty(tempAddress[0]);
			list.get(i).setAdrCity(tempAddress[1]);
		}
		return list;
	   }
		
	@ResponseBody	/*검색버튼 눌렀다~*/
	@RequestMapping(value="/jsbClickToSearchBtn.do", method=RequestMethod.POST,produces = "application/json")
		public ArrayList<jsbBListStudy> jsbClickToSearchBtn(String menuLink1, String menuLink2, String searchWord, HttpServletRequest req) {
			IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
			String cate1 = req.getParameter("menuLink1");
			String cate2 = req.getParameter("menuLink2");
			String word = req.getParameter("searchWord");
			//System.out.println(word);
			//System.out.println("실행1");
			/*0*/
			if (cate1.equals("") && cate2.equals("") && word.equals("")) {
				//word만 입력시에
					//System.out.println("word");
					ArrayList<jsbBListStudy> list = dao.jsbListTypeOne();
					for (int i=0;i<list.size();i++) {
						String[] tempAddress=list.get(i).getmWhere().split(" ");
						list.get(i).setAdrCounty(tempAddress[0]);
						list.get(i).setAdrCity(tempAddress[1]);
					};
					return list;
				}
			/*1*/
			if (cate1.equals("") && cate2.equals("") && !word.equals("")) {
			//word만 입력시에
				//System.out.println("word");
				ArrayList<jsbBListStudy> list = dao.jsbListTypeTwo(word);
				for (int i=0;i<list.size();i++) {
					String[] tempAddress=list.get(i).getmWhere().split(" ");
					list.get(i).setAdrCounty(tempAddress[0]);
					list.get(i).setAdrCity(tempAddress[1]);
				};
				return list;
			}
			/*2*/
			if (!cate1.equals("") && cate2.equals("") && word.equals("")) {
			//cate1만 입력시에	
				//System.out.println("cate1");
				ArrayList<jsbBListStudy> list = dao.jsbListTypethr(cate1);
				for (int i=0;i<list.size();i++) {
					String[] tempAddress=list.get(i).getmWhere().split(" ");
					list.get(i).setAdrCounty(tempAddress[0]);
					list.get(i).setAdrCity(tempAddress[1]);
				};
				return list;
			}
			/*3*/
			if (!cate1.equals("") && !cate2.equals("") && word.equals("")) {
			//cate1,2만 입력시에
				//System.out.println("cate1,cate2");
				ArrayList<jsbBListStudy> list = dao.jsbListTypefor(cate1,cate2);
				for (int i=0;i<list.size();i++) {
					String[] tempAddress=list.get(i).getmWhere().split(" ");
					list.get(i).setAdrCounty(tempAddress[0]);
					list.get(i).setAdrCity(tempAddress[1]);
				};
				return list;
			}
			/*4*/
			if (!cate1.equals("") && !cate2.equals("") && !word.equals("")) {
			//모두다 입력되었다면
				//System.out.println("all");
				ArrayList<jsbBListStudy> list = dao.jsbListTypefiv(cate1,cate2,word);
				for (int i=0;i<list.size();i++) {
					String[] tempAddress=list.get(i).getmWhere().split(" ");
					list.get(i).setAdrCounty(tempAddress[0]);
					list.get(i).setAdrCity(tempAddress[1]);
				};
				return list;
			}
			return null;
	   }

		@ResponseBody
		@RequestMapping(value="/jsbFindMapInCate.do", method=RequestMethod.POST,produces = "application/json")
			public ArrayList<BJsbStudyInfo> findMapInCate(String cate1, String cate2,HttpServletRequest req) {
				IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
				String one = req.getParameter("cate1");
				String two = req.getParameter("cate2");
				System.out.println(one+","+two);
				if (two.equals("dontSel")) {
					System.out.println("one 실행");
					ArrayList<BJsbStudyInfo> resp=dao.jsbGetStudyInfoInCateONE(one);
					return resp;
				} else {
					System.out.println("ALL 실행");
					ArrayList<BJsbStudyInfo> resp=dao.jsbGetStudyInfoInCate(one,two);
					return resp;
				}
		   }

		@ResponseBody //카테고리 분야 포기 map 리플레쉬하려면 오래걸림
		@RequestMapping(value="/findMap.do", method=RequestMethod.POST,produces = "application/json")
			public ArrayList<jsbBListStudy> reqList(HttpServletRequest req) {
				IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
//				String one = req.getParameter("one");
//				String two = req.getParameter("two");		
//				System.out.println(one+","+two);
				ArrayList<jsbBListStudy> resp=dao.jsbGetStudyInfo();
				return resp;
		   }
			
			@ResponseBody // 받은 쪽지  receiveMsgList
			@RequestMapping(value="/receiveMsgList.do", method=RequestMethod.POST,produces = "application/json")
				public ArrayList<jsbBMsgList> receiveMsgList(HttpServletRequest req,HttpSession session) {
					IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
					
					String sessionUserId = String.valueOf(session.getAttribute("userid"));
					BMembers mem = dao.jsbGetUser(sessionUserId);
					int mUserNum = mem.getuNum();
					
					ArrayList<jsbBMsgList> resp=dao.jsbReceiveMsgList(mUserNum);
					return resp;
			   }
				
				@ResponseBody // 보낸 쪽지  SendMsgList
				@RequestMapping(value="/sendMsgList.do", method=RequestMethod.POST,produces = "application/json")
					public ArrayList<jsbBMsgList> SendMsgList(HttpServletRequest req,HttpSession session) {
						IDaojsb dao=sqlSession.getMapper(IDaojsb.class);
						
						String sessionUserId = String.valueOf(session.getAttribute("userid"));
						BMembers mem = dao.jsbGetUser(sessionUserId);
						int mUserNum = mem.getuNum();
						
						ArrayList<jsbBMsgList> resp=dao.jsbSendMsgList(mUserNum);
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
}
	

