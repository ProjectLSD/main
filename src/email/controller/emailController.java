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
			mail.setTo(sendemail);	//��������� �ּ�, String , String[]
			mail.setFrom("admin@group.kr");		//������ ����� �ּ�
			mail.setSubject("��й�ȣ ã�� �Դϴ�"); 	//����
			mail.setText(list.toString());	//����
			mav.setViewName("/member/findPass");
			try{
				sender.send(mail);
				System.out.println("�߼ۼ���!");
			}catch(Exception e){
				System.out.println("�߼۽���!");
				e.printStackTrace();
			}
		}else{
			mav.setViewName("/member/findPassFail");
		}
		return mav;
	}
}
