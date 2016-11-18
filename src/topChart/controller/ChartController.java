package topChart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import topChart.model.ChartService;

@Controller
public class ChartController {
	@Autowired
	ChartService CSrv;
	
	@RequestMapping("/top/chart")
	public ModelAndView reqResolve() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tm:file/list");
		mav.addObject("top", CSrv.readTopChart());
		return mav;
	}
	
}
