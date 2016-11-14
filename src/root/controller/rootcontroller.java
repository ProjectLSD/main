package root.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class rootcontroller {
	@RequestMapping("/join")
	public String join(){
		return"t:join";
	}
	
	@RequestMapping("/index")
	public String index(){
		return"t:main";
	}
	
}
  