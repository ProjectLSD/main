package band.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import band.model.Band;
import band.model.BandService;

@Controller
@RequestMapping("/band")
public class BandController {
	@Autowired
	BandService bs;
	
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
	// id 값 중복확인(ajax)
	
	@RequestMapping("/join")
	public String join(){
		return "tm:join/bandJoin";
	}
	// band join페이지 출력
	
		
	@RequestMapping("/input")
	public ModelAndView input(Band b){
		ModelAndView mav = new ModelAndView();
		
		System.out.println(b.getId()+"/"+b.getPass()+"/"+b.getEmail()+"/"+b.getPhonenum1()
							+"/"+b.getPhonenum2()+"/"+b.getPhonenum3());
		
		int r=0;
		r+=bs.Input(b);
		if(r==1){
			mav.setViewName("t:main");
		}else{
			mav.setViewName("/err.jsp");
		}
		return mav;
	}
	// Band db에 넣기
}
