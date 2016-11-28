package cash.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cash.model.cashService;

@Controller
public class cashController {

	@Autowired
	cashService cashSrv;
	@RequestMapping("cash/controller")
	public ModelAndView page(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("userId");
		String point = cashSrv.point(id);
		
		mav.addObject("point",point);
		mav.setViewName("tmmm:basic/menu");
		
		return mav;
	}
	
	@RequestMapping("cash/chargePoint")
	public ModelAndView chargePoint(int point,HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("userId");
		String result = cashSrv.chargeResult(point, id);
		if(result=="true"){
			mav.setViewName("/cash/success");
		}else{
			mav.setViewName("cash/fail");
		}
		return mav;
	}
}
  