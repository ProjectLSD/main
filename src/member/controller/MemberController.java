package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import member.model.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService ms;
	
	@RequestMapping("/joinId")
	@ResponseBody
	public String select(String id){
		boolean flag = ms.selectId(id);
		if(flag){
			return "TRUE";
		}else{
			return "FALSE";
		}
	}
	// id 값 중복확인(ajax)
	
	@RequestMapping("/join")
	public String join(){
		return "tm:join/memberJoin";
	}
	// member join페이지 출력
	
		
	@RequestMapping("/input")
	public ModelAndView input(Member m){
		ModelAndView mav = new ModelAndView();
		
		System.out.println(m.getId()+"/"+m.getPass()+"/"+m.getEmail()+"/"+m.getPhonenum1()
							+"/"+m.getPhonenum2()+"/"+m.getPhonenum3()+"/"+m.getName());
		
		int r=0;
		r+=ms.Input(m);
		
		if(r==1){
			mav.setViewName("t:main");
		}else{
			mav.setViewName("/err.jsp");
		}
		return mav;
	}
	// member db에 넣기
}
