package root.controller;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import file.model.fileService;
import member.model.Member;
import member.model.MemberService;
import root.model.RootService;

@Controller
public class rootcontroller {
	@Autowired
	MemberService ms;
	@Autowired
	RootService rs;
	@Autowired
	fileService fileSrv;
	
	@RequestMapping("/join")
	public String join(){
		return"/join/memOrBand";
	}
	@RequestMapping("/login")
	public String login(){
		return"login/login";
	}
	@RequestMapping("/datasearch")
	public String pwsearch(){
		return"join/datasearch";
	}
	@RequestMapping({"/index","/"})
	public ModelAndView index(){
		List<HashMap> map = fileSrv.readApproval();
		ModelAndView mav = new ModelAndView();
		if (map != null) {
			mav.addObject("map", map);
			mav.setViewName("t:main");
		} else {
			mav.setViewName("file/error");  
			
		}
		return mav;
	}
	@RequestMapping("/home")
	public ModelAndView loginConfirm(String id, String pass , String check, HttpSession session) {
		ModelAndView mav = new ModelAndView("tm:login/success");
		System.out.println("id: "+ id + " pass: "+pass+ " check: "+check);
		if (rs.getAllMember(id, pass, check, session) == true) {
			session.setAttribute("userId", id);	
			session.setAttribute("login", "true");
		}

		return mav; 
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "t:main";
	}
}
