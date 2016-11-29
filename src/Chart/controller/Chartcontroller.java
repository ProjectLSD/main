package Chart.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Chart.model.ChartDataService;

@Controller
public class Chartcontroller {
	@Autowired
	ChartDataService cds;

	@RequestMapping("/chart/all")
	public ModelAndView chartsAA() {
		ModelAndView mav = new ModelAndView();
		List<HashMap> bugs = cds.readBugs();
		List<HashMap> mnet = cds.readMnet();
		mav.addObject("bugs", bugs);
		mav.addObject("mnet", mnet);
		mav.setViewName("tm:chart/Bschart");
		return mav;
	}

	@RequestMapping("/chart/bs")
	public ModelAndView charts() {
		ModelAndView mav = new ModelAndView();
		List<HashMap> bugs = cds.readBugs();
		mav.addObject("bugs", bugs);
		mav.setViewName("tm:chart/Bschart");
		return mav;
	}

	@RequestMapping("/chart/mnet")
	public ModelAndView charts1() {
		ModelAndView mav = new ModelAndView();
		List<HashMap> mnet = cds.readMnet();
		mav.addObject("mnet", mnet);
		mav.setViewName("tm:chart/Bschart");

		return mav;

	}
}
