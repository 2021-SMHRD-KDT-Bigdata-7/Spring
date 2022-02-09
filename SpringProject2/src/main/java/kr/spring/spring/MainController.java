package kr.spring.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/Main.do")
	public String Main() {
		return "Main";
	}
}
