package kr.co.jhta.soop.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestContoller {
	
	@GetMapping("/test")
	public String test() {
		return "test";
	}

}
