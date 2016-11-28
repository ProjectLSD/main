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
		mav.setViewName("tm:chart/chart");
		mav.addObject("top", CSrv.readTopChart());
		mav.addObject("pop", CSrv.readTopPop());
		mav.addObject("lock", CSrv.readTopLock());
		mav.addObject("jazz", CSrv.readTopJazz());
		mav.addObject("hiphop", CSrv.readTopHiphop());
		mav.addObject("country", CSrv.readTopCountry());
		mav.addObject("electronic", CSrv.readTopElectronic());

		return mav;
	}
	
}
