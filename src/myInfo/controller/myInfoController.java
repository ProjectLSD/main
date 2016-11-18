package myInfo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import myInfo.model.myInfoService;

@Controller
public class myInfoController {

	@Autowired
	myInfoService mySrv;
	
	@RequestMapping("myInfo/info")
	public ModelAndView info(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("userId");
		
		return mav;
		
	}
	
}
