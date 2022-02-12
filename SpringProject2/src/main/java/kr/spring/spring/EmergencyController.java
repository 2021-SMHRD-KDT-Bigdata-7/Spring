package kr.spring.spring;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmergencyController {
	
	@RequestMapping("/EmergencyMap.do")
	public String EmergencyMap() {
		
			return "EmergencyMap";
		}
	
	
}
