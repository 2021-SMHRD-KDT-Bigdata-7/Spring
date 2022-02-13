package kr.spring.spring;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.domain.Report;

@Controller
public class ReportController {

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
}
