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
	// id �� �ߺ�Ȯ��(ajax)
	
	@RequestMapping("/join")
	public String join(){
		return "/join/memberJoin";
	}
	// member join������ ���
	
		
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
	// member db�� �ֱ�
	
	@RequestMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(String email){
		if(email!=null){
		SimpleMailMessage mail = new SimpleMailMessage();
		String Num = ms.creatRamdomNum();
			mail.setTo(email);	//��������� �ּ�, String , String[]
			mail.setFrom("admin@group.kr");		//������ ����� �ּ�
			mail.setSubject("LSD Music ������ȣ �Դϴ�."); 	//����
			mail.setText(Num);	//����
			try{
				sender.send(mail);
				System.out.println("�߼ۼ���!");
			}catch(Exception e){
				System.out.println("�߼۽���!");
				e.printStackTrace();
			}
			return Num;
		}else{
			return "�̸����� �Է����ּ���";
		}
	}
}
