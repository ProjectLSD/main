package member.controller;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import email.model.emailService;

@Controller
public class FindController {
	
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	emailService email;
	@Autowired
	JavaMailSender sender;
	
	@RequestMapping("/findId")
	public ModelAndView findId(String email){
		SqlSession sql = fac.openSession();
		String rst = sql.selectOne("member.findEmail",email);
		System.out.println(rst);
		ModelAndView mav = new ModelAndView();
		if(rst !=null){
			mav.setViewName("/login/idFind_success");
			mav.addObject("id",rst);
		}else{
			mav.setViewName("/login/idFind_fail");
		}
		return mav;
	}
	
	@RequestMapping("findPass")
	public ModelAndView findPass(String id,String emali){
		ModelAndView mav = new ModelAndView();
			
		
		return mav;
	}
}
