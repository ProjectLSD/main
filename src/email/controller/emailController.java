package email.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import email.model.emailService;

@Controller
public class emailController {
	@Autowired
	emailService email;
	@Autowired
	JavaMailSender sender;
	
	@RequestMapping("email/findpass.nhn")
	public ModelAndView findPass(String regid,String regname,String sendemail){
		ModelAndView mav = new ModelAndView();
		List list = email.findpass(regid, regname);
		System.out.println(list.size());
		if(list.size()==1){
			SimpleMailMessage mail = new SimpleMailMessage();
			mail.setTo(sendemail);	//받을사람의 주소, String , String[]
			mail.setFrom("admin@group.kr");		//보내는 사람의 주소
			mail.setSubject("비밀번호 찾기 입니다"); 	//제목
			mail.setText(list.toString());	//내용
			mav.setViewName("/member/findPass");
			try{
				sender.send(mail);
				System.out.println("발송성공!");
			}catch(Exception e){
				System.out.println("발송실패!");
				e.printStackTrace();
			}
		}else{
			mav.setViewName("/member/findPassFail");
		}
		return mav;
	}
}
