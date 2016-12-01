package myInfo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import band.model.Band;
import member.model.Member;
import myInfo.model.myInfoService;

@Controller
@RequestMapping("/myInfo")
public class myInfoController {

	@Autowired
	myInfoService mySrv;
	
	@RequestMapping("/inputPass")
	public String inputPass(){
		return "tm:info/inputPass";
	}
	
	@RequestMapping("/checkPass")
	@ResponseBody
	public String checkPass(String pass, HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("userId");
		String rst=null;
				
		boolean result = mySrv.checkPass(pass, id);
		System.out.println(result);
		if(result){
			rst="TRUE";
		}else{
			rst="FALSE";
		}
			
		return rst;
	}
	
	@RequestMapping("/changeInfoView")
	public String changeInfo(){
		return "/info/changeInfo";
	}
	
	
	@RequestMapping("/change")
	public ModelAndView input(String pass,String email,String phonenum1,String phonenum2,String phonenum3,String name,HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("userId");
		int r=0;
		r+=mySrv.Input(pass,email,phonenum1,phonenum2,phonenum3,name,id);
		
		if(r==1){
			mav.setViewName("tm:login/success");
		}else{
			mav.setViewName("/err");
		}
		return mav;
	}
}
  