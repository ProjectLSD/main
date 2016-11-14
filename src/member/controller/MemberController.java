package member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import member.model.MemberService;


@Controller
public class MemberController {
	@Autowired
	MemberService memberService;

	@RequestMapping("/home.it")
	public ModelAndView login(Member m, HttpSession session) {
		ModelAndView mav = new ModelAndView("t:main");
		/*
		System.out.println(m.getId() + " / " + m.getPass());
		if (memberService.getAllMember(m.getId(), m.getPass()) == true) {
			session.setAttribute("userId", m.getId());	
			session.setAttribute("login", "true");
		}
		*/
		return mav;
	}
}
