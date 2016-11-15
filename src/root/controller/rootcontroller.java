package root.controller;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import member.model.MemberService;
import root.model.RootService;

@Controller
public class rootcontroller {
	@Autowired
	MemberService ms;
	@Autowired
	RootService rs;
	
	@RequestMapping("/join")
	public String join(){
		return"t:join";
	}
	@RequestMapping("/login")
	public String login(){
		return"tm:login/login";
	}
	
	@RequestMapping("/index")
	public String index(){
		return"t:main";
	}
	@RequestMapping("/home")
	public ModelAndView loginConfirm(String id, String pass , HttpSession session) {
		ModelAndView mav = new ModelAndView("t:main");
		System.out.println(id + " / " + pass);
		if (rs.getAllMember(id, pass) == true) {
			System.out.println("¼º°ø");
			session.setAttribute("userId", id);	
			session.setAttribute("login", "true");
		}

		return mav;
	}
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session){
		ModelAndView mav = new ModelAndView("t:main");
		session.invalidate();
		return mav;
	}
}
