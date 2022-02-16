package kr.spring.spring;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.domain.Member;
import kr.spring.service.SpringService;
import kr.spring.domain.Report;



@Controller
public class SpringController {

	@Autowired
	SpringService service;
	

	@RequestMapping("/Main.do")
	public String Main() {
		return "Main";
	}

	
//	@RequestMapping("/Login.do") public String Login() { return "Login"; }
	  
	@RequestMapping("/Join.do") public String Join() { return "Join"; }
	@RequestMapping("/UserSetting.do") public String UserSetting() { return "UserSetting"; }
	 
	@RequestMapping("/JoinSelect.do") public String JoinSelect() { return "JoinSelect"; }
	
	@RequestMapping("/ReportMap.do")
	public String ReportMap() {
		return "ReportMap";
	}

	@RequestMapping("/Report.do")
	public String Report() {

		return "Report";
	}
//**************************************************************로그인 및 회원가입 메소드
	 //회원가입-일반사용자
	 @RequestMapping(value = "/JoinUser.do", method = RequestMethod.POST) public
	 String JoinUser(Member member) {
//////////확인용   
		 System.out.println("JoinUser con "+member);
		 
		 service.JoinUser(member); 
		 return "Main"; 
		 }
	 
	//회원가입-소방서
	@RequestMapping(value = "/JoinFire.do", method = RequestMethod.POST)
	public String JoinFire(Member member) {
		service.JoinFire(member);
		return "Main";
	}
	
	//로그인
	 @RequestMapping(value = "/Login.do", method = RequestMethod.POST)
	  public String Login(Member member, HttpServletRequest request)  { 
			
		Member mvo = service.Login(member);
		HttpSession session = request.getSession();
		session.setAttribute("mvo", mvo);
		System.out.println("컨트롤러 세션 "+session);
		
		return "redirect:/Main.do";
	  }

	  // 로그아웃
	  @RequestMapping("/Logout.do")
	   public String Logout(HttpSession session) {
		  session.invalidate(); 
		  return "Logout";
	  }

//**********************************************************************신고페이지 메소드
	 // ReportMap(신고 시 위치제공페이지)에서 받아온 좌표를 insert하기 위한 메소드
	@RequestMapping(value = "/ReportlatInsert.do", method = RequestMethod.POST)
	public String ReportlatInsert(@RequestParam double re_latitude, @RequestParam double re_longitude,
			@RequestParam String re_loc, Model model, HttpSession session) {
		
		Member mvo = (Member) session.getAttribute("mvo");
		String m_id = mvo.getM_id();
		
		model.addAttribute("re_latitude", re_latitude);
		model.addAttribute("re_longitude", re_longitude);
		model.addAttribute("re_loc", re_loc);
		model.addAttribute("m_id", m_id);

//////////확인용   
		System.out.println("ReportlatInsert.do컨트롤러의 세션값 : "+mvo);
		System.out.println("ReportlatInsert컨트롤러 위도 : " + re_latitude);
		System.out.println("ReportlatInsert컨트롤러 경도 : " + re_longitude);
		System.out.println("ReportlatInsert컨트롤러 주소  : " + re_loc);
		System.out.println("ReportlatInsert컨트롤러 세션m_id : " +m_id);
		System.out.println("latinsert컨트롤" + model);

		service.ReportlatInsert(model);

		return "Report";
	}
	
	// Report(신고페이지)의 내용 insert 메소드
		@RequestMapping(value = "/ReportInsert.do", method = RequestMethod.POST)
		public String ReportInsert(@RequestParam String re_type, @RequestParam String re_content, Model model) {
			
			model.addAttribute("re_type", re_type);
			model.addAttribute("re_content", re_content);
			
//////////확인용   
			
			System.out.println("신고내용타입 "+ re_type);
			System.out.println("신고내용내용 "+ re_content);
			System.out.println("신고내용 "+model);
			
			service.ReportInsert(model);
			
			return "Main";
		}
		
	// Report(신고 페이지)에서 처음으로 버튼을 클릭 했을 때 좌표값 DB에서 지워야함
		@RequestMapping("/ReportlatDelete.do")
		public String ReportlatDelete(HttpSession session) {
			
			Member mvo = (Member)session.getAttribute("mvo");
			String m_id = mvo.getM_id();
//////////확인용			
			System.out.println("ReportlatDelete.do의 세션값 :"+mvo);
			service.ReportlatDelete(m_id);
			return "redirect:/Main.do";
		}
		
//*****************************************************************신고접수페이지 메소드
	// ReportTaking(신고접수페이지)에 나올 ReportList 메소드
	@RequestMapping("/ReportTaking.do")
	public String ReportTaking(Model model){
		List<Report> rlist = service.ReportTaking();
//////확인용
		System.out.println("ReportTaking컨트롤러 서비스에서 받아온거  "+rlist);
		
		model.addAttribute("rlist", rlist);
//////확인용
		System.out.println("ReportTaking컨트롤러 model에 넣은거 "+rlist);

		return "ReportTaking";
	}
	
	// ReportTaking(신고접수페이지)에서 버튼 클릭 시 세부정보 출력
	@RequestMapping("/ReportDetail.do")
	public String ReportDetail(@RequestParam int re_seq, Model model){
		
		Report rvo = service.ReportDetail(re_seq);
//////확인용
		System.out.println("ReportDetail컨트롤러 "+ rvo);
		System.out.println("ReportDetail컨트롤러 re_sqe : "+ re_seq);
		model.addAttribute("rvo", rvo);
		
		return "ReportDetail";
		
	}
	
	
}
