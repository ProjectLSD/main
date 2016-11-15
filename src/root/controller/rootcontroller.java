package root.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class rootcontroller {
	@RequestMapping("/join")
	public String join(){
		return"t:join";
	}
	
	@RequestMapping("/")
	public String index(){
		return"t:main";
	}
	
	@RequestMapping("fileUp")
	public String fileUp(){
		return "t:fileUp";
	}
	
}
  