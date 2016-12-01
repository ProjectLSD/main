package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import email.model.emailService;
import member.model.Member;
import member.model.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService ms;
	@Autowired
	emailService email;
	@Autowired
	JavaMailSender sender;
	
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
		return "/join/memberJoin";
	}
	// member join페이지 출력
	
		
	@RequestMapping("/input")
	public ModelAndView input(Member m){
		ModelAndView mav = new ModelAndView();
		if(m.getPass().length()<8){
			mav.setViewName("/err");
		}else{
		int r=0;
		r+=ms.Input(m);
		
		if(r==1){
			mav.setViewName("tm:login/success");
		}else{
			mav.setViewName("/err");
		}
		}
		return mav;
	}
	// member db에 넣기
	
	@RequestMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(String email){
		if(email!=null){
		SimpleMailMessage mail = new SimpleMailMessage();
		String Num = ms.creatRamdomNum();
			mail.setTo(email);	//받을사람의 주소, String , String[]
			mail.setFrom("admin@group.kr");		//보내는 사람의 주소
			mail.setSubject("LSD Music 인증번호 입니다."); 	//제목
			mail.setText(Num);	//내용
			try{
				sender.send(mail);
				System.out.println("발송성공!");
			}catch(Exception e){
				System.out.println("발송실패!");
				e.printStackTrace();
			}
			return Num;
		}else{
			return "이메일을 입력해주세요";
		}
	}
}
