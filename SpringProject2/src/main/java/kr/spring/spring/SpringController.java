package kr.spring.spring;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.domain.Member;
import kr.spring.domain.Report;
import kr.spring.service.SpringService;

@Controller
public class SpringController {
	
	@Autowired
	   SpringService service;
	
	@RequestMapping("/Main.do")
	public String Main() {
		return "Main";
	}
	
	@RequestMapping("/ReportMap.do")
	public String ReportMap() {

		return "ReportMap";
	}

	@RequestMapping("/Report.do")
	public String Report() {

		return "Report";
	}

	// ReportMap에서 받아온 위치좌표를 insert하기 위한 메소드
	@RequestMapping(value = "/ReportlatInsert.do", method = RequestMethod.POST)
	public String ReportlatInsert(Report rvo) {
		
		System.out.println(rvo);
		
		return "Report";
	}
	
	//회원테이블조회
	   @RequestMapping("/MemberList.do")
	   public String MemberList(Model model) {
	      List<Member> mlist = service.MemberList();
	      //객체바인딩
	      model.addAttribute("mlist",mlist);
	      return "MemberList";//jsp 이름(jsp*jstl+el)
	   }
	
	
}
