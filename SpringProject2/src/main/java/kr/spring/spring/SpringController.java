package kr.spring.spring;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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

	@RequestMapping("/ReportCheck.do") public String ReportCheck() { return "ReportCheck"; }
	
	@RequestMapping("/Login.do") public String Login() { return "Login"; }
	  
	@RequestMapping("/Join.do") 
	public String Join(@RequestParam String m_type, Model model) { 
		model.addAttribute("m_type",m_type);
////////확인용
		System.out.println("JoinSelect의 m_type : "+m_type);
		System.out.println("JoinSelect의 m_type : "+m_type.getClass());
		return "Join"; 
	}
	@RequestMapping("/UserSetting.do") public String UserSetting() { return "UserSetting"; }
	 
	@RequestMapping("/JoinSelect.do") public String JoinSelect() { return "JoinSelect"; }
	
	// 설정버튼 누르면 로그인세션과 함께 설정페이지로 이동
	@RequestMapping("/Setting.do") 
	public String Setting(HttpSession session, Member member) { 
		
		Member mvo = (Member) session.getAttribute("mvo");
		
		return "Setting"; 
		}
	
	@RequestMapping("/ReportMap.do")
	public String ReportMap() {
		return "ReportMap";
	}

	@RequestMapping("/Report.do")
	public String Report() {

		return "Report";
	}
//**************************************************************로그인 및 회원가입 메소드
	
	 //회원가입-일반/소방 
	 @RequestMapping("/JoinAll.do") 
	 public String JoinAll(@RequestParam Map<String, Object> map, ModelMap model) {
//////////확인용   
		 model.addAllAttributes(map);
		 System.out.println("JoinAll : "+model);
		 System.out.println("JoinAll : "+model.get("m_type"));

			if (model.get("m_type").equals("U")) {
				service.JoinUser(model);
				return "Main";
			} else {
				service.JoinFire(model);
				return "Main";
			}

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
	  @RequestMapping(value ="/Logout.do" , method = RequestMethod.GET)
	   public String Logout(HttpSession session) {
		  session.invalidate(); 
		  return "redirect:/Main.do";
	  }

//**********************************************************************신고페이지 메소드
	 // ReportMap(신고 시 위치제공페이지)의 좌표 넣기 / re_seq빼내기
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
//		 List<Map> map = service.ReportSelectSeq(m_id);
//		 System.out.println(map);
//		 System.out.println(map.getClass()); 
//		 System.out.println(map.get(map.size() - 1)); 
//		 int re_seq = (int) map.get(map.size() - 1);
		int re_seq = service.ReportSelectSeq(m_id);
		System.out.println(re_seq);
		model.addAttribute("re_seq", re_seq);
		System.out.println("latinsert컨트롤2" + model);
		return "Report";
	}
	
	// Report(신고페이지)의 내용 insert 메소드
		@RequestMapping(value = "/ReportInsert.do", method = RequestMethod.POST)
		public String ReportInsert(@RequestParam String re_type, @RequestParam String re_content, @RequestParam String re_seq, Model model, HttpSession session) {
			
			Member mvo = (Member) session.getAttribute("mvo");
			String m_id = mvo.getM_id();
			
			model.addAttribute("re_type", re_type);
			model.addAttribute("re_content", re_content);
			model.addAttribute("m_id", m_id);
			model.addAttribute("re_seq", re_seq);

//////////확인용   

			System.out.println("신고내용타입 " + re_type);
			System.out.println("신고내용내용 " + re_content);
			System.out.println("신고내용내용 " + re_seq);
			System.out.println("신고내용 " + model);

			service.ReportInsert(model);

			return "ReportCheck";
		}
		
	// Report(신고 페이지)에서 처음으로 버튼을 클릭 했을 때 좌표값 DB에서 지워야함
		@RequestMapping("/ReportlatDelete.do")
		public String ReportlatDelete(@RequestParam String re_seq) {
			
//////////확인용			
			System.out.println("ReportlatDelete.do의 seq값 :"+re_seq);
			service.ReportlatDelete(re_seq);
			
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
