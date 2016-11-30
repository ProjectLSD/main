package search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import search.model.searchService;

@Controller
public class searchController {

	@Autowired
	searchService searchSrv;
	
	@RequestMapping("/file/search")
	public ModelAndView srchResolve(String q) {
		ModelAndView mav = new ModelAndView();
		List li = searchSrv.readSomeContain(q);
		mav.setViewName("tm:chart/chart");
		mav.addObject("top", li);
		mav.addObject("size", li.size());
		return mav;
	}
}
