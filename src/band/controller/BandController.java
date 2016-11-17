package band.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import band.model.Band;
import band.model.BandService;
import email.model.emailService;

@Controller
@RequestMapping("/band")
public class BandController {
	@Autowired
	BandService bs;
	@Autowired
	emailService email;
	@Autowired
	JavaMailSender sender;
	
	@RequestMapping("/joinId")
	@ResponseBody
	public String select(String id){
		boolean flag = bs.selectId(id);
		if(flag){
			return "TRUE";
		}else{
			return "FALSE";
		}
	}
	// id �� �ߺ�Ȯ��(ajax)
	
	@RequestMapping("/join")
	public String join(){
		return "/join/bandJoin";
	}
	// band join������ ���
	
		
	@RequestMapping("/input")
	public ModelAndView input(Band b){
		ModelAndView mav = new ModelAndView();
		
		System.out.println(b.getId()+"/"+b.getPass()+"/"+b.getEmail()+"/"+b.getPhonenum1()
							+"/"+b.getPhonenum2()+"/"+b.getPhonenum3()+"/"+b.getName());
		
		int r=0;
		r+=bs.Input(b);
		if(r==1){
			mav.setViewName("tm:login/success");
		}else{
			mav.setViewName("/err.jsp");
		}
		return mav;
	}
	// Band db�� �ֱ�
	@RequestMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(String email){
		System.out.println("controller");
		if(email!=null){
		SimpleMailMessage mail = new SimpleMailMessage();
		String Num = bs.creatRamdomNum();
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
