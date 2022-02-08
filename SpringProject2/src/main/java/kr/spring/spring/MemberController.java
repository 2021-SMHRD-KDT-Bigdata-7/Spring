package kr.spring.spring;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.service.MemberService;
import kr.spring.domain.Member;

@Controller
public class MemberController {
	@Autowired
	   MemberService service;

	   //회원테이블조회
	   @RequestMapping("/MemberList.do")
	   public String MemberList(Model model) {
	      List<Member> mlist = service.MemberList();
	      //객체바인딩
	      model.addAttribute("mlist",mlist);
	      return "MemberList";//jsp 이름(jsp*jstl+el)
	   }
	
	
}

