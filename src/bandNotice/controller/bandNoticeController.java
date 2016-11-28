package bandNotice.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bandNotice.model.bandNoticeService;

@Controller
public class bandNoticeController {

	@Autowired
	bandNoticeService bnSrv;

	@RequestMapping("bandNotice/notice")
	public String view() {
		return "tm:bandNotice/view";
	}

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
		HashMap map = new HashMap();
		map.put("title", title);
		map.put("text", text);
		map.put("id", id);
		map.put("location", location);
		map.put("px", px);
		map.put("py", py);
		
		String rst = bnSrv.upLoad(map, File);
		if(rst=="true"){
			mav.setViewName("tm:bandNotice/view");
		}else{
			mav.setViewName("tm:bandNotice/fail");
		}
		
		
		
		return mav;
	}

}
