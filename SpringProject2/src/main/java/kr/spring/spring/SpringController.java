package kr.spring.spring;

import java.util.List;

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

	@RequestMapping("/Login.do")
	public String Login() {
		return "Login";
	}
	
	@RequestMapping("/Join.do")
	public String Join() {
		return "Join";
	}
	
	@RequestMapping("/ReportMap.do")
	public String ReportMap() {
		return "ReportMap";
	}

	@RequestMapping("/Report.do")
	public String Report() {

		return "Report";
	}

	
	 //회원가입-일반사용자
	 
	 @RequestMapping(value = "/JoinUser.do", method = RequestMethod.POST) public
	 String JoinUser(Member member) {
		 System.out.println("con"+member);
		 service.JoinUser(member); 
		 return "Main"; }
	
	
	//회원가입-소방서
	@RequestMapping(value = "/JoinFire.do", method = RequestMethod.POST)
	public String JoinFire(Member member) {
		service.JoinFire(member);
		return "Main";
	}
	

	// 회원테이블조회
	@RequestMapping("/MemberList.do")
	public String MemberList(Model model) {
		List<Member> mlist = service.MemberList();
		// 객체바인딩
		model.addAttribute("mlist", mlist);
		return "MemberList";// jsp 이름(jsp*jstl+el)
	}

	// Report의 내용 insert 메소드
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
		
	   
	 // ReportMap에서 받아온 위치좌표를 insert하기 위한 메소드
	@RequestMapping(value = "/ReportlatInsert.do", method = RequestMethod.POST)
	public String ReportlatInsert(@RequestParam double re_latitude, @RequestParam double re_longitude,
			@RequestParam String re_loc, Model model) {

		model.addAttribute("re_latitude", re_latitude);
		model.addAttribute("re_longitude", re_longitude);
		model.addAttribute("re_loc", re_loc);

//////////확인용   
		System.out.println("컨트롤러에 위도 " + re_latitude);
		System.out.println("컨트롤러에 경도 " + re_longitude);
		System.out.println("컨트롤러에 주소 " + re_loc);
		System.out.println("latinsert컨트롤" + model);

		service.ReportlatInsert(model);

		return "Report";
	}
	
	// ReportTaking페이지에 나올 ReportList 메소드
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
}
