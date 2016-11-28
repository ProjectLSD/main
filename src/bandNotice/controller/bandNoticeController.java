package bandNotice.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bandNotice.model.bandNoticeService;
import board.model.Board;
import board.model.BoardService;
import board.model.Review;

@Controller
public class bandNoticeController {

	@Autowired
	bandNoticeService bnSrv;


	@RequestMapping("/baneNotice/write")
	public String write() {
		return "tm:bandNotice/write";
	}

	@RequestMapping("bandNotice/reg")
	public ModelAndView write(String title, String text, HttpSession session,
			@RequestParam(name = "file") MultipartFile File, String location, String px, String py) throws IOException {
		System.out.println(title+"/"+text+"/"+File+"/"+location+"/"+px+"/"+py);
		
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("userId");
		System.out.println(id);
		if(id==null){
			mav.setViewName("tm:bandNotice/fail");
			return mav;
		}
		HashMap map = new HashMap();
		map.put("title", title);
		map.put("text", text);
		map.put("id", id);
		map.put("location", location);
		map.put("px", px);
		map.put("py", py);
		
		String rst = bnSrv.upLoad(map, File);
		if(rst=="true"){
			mav.addObject("data",map);
			mav.setViewName("tm:bandNotice/success");
		}
		return mav;
	}
	
	@RequestMapping("bandNotice/notice")
	   public ModelAndView list(@RequestParam(defaultValue="1")int p) {
	      ModelAndView mav = new ModelAndView();
	      List li = bnSrv.readSomePage(p);
	      mav.addObject("data", li);
	      System.out.println(li);
	      mav.addObject("p",p);
	      System.out.println("p="+p);
	      mav.addObject("last",bnSrv.calcLast());
	      mav.addObject("size",bnSrv.getTotalCount());
	      mav.setViewName("tm:bandNotice/list");
	      return mav;
	   }
	
	@RequestMapping("/board/view")
	   public ModelAndView view(int num) {
		System.out.println(num);
	      ModelAndView mav = new ModelAndView();
	      HashMap map = bnSrv.selectNum(num);
	      mav.addObject("notice", map);
	      mav.setViewName("tm:bandNotice/view");
	      return mav;
	   }

}
