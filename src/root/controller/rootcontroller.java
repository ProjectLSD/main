package root.controller;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cash.model.cashService;
import file.model.fileService;
import member.model.Member;
import member.model.MemberService;
import myInfo.model.myInfoService;
import root.model.RootService;

@Controller
public class rootcontroller {
	@Autowired
	MemberService ms;
	@Autowired
	RootService rs;
	@Autowired
	fileService fileSrv;
	
	@Autowired
	myInfoService mySrv;
	@Autowired
	cashService cashSrv;
	
	
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
	public ModelAndView index(HttpSession session){
		List<HashMap> map = fileSrv.readApproval();
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
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
			session.setAttribute("check", check);
			List li = mySrv.info(id);
			String point = cashSrv.point(session.getAttribute("userId").toString());
			mav.addObject("data",li);
			session.setAttribute("data",li);
			session.setAttribute("point",point);
		}

		return mav; 
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		System.out.println(session.getAttribute("userId"));
		session.removeAttribute("userId");
		
		return "tm:login/success";
	}
	
	@RequestMapping("/intro/intro")
	public String intro(){
		return "tm:introduce/introduce";
	}
}
