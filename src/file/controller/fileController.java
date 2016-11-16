package file.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import file.model.fileService;

@Controller
public class fileController {

	@Autowired
	fileService fileSrv;
	@RequestMapping("/file")
	public String file(){
		return "t:fileUp";
	}
	
	@RequestMapping("file/upload")
	public  ModelAndView fileUpload(String genre,String album,
			@RequestParam(name="file")MultipartFile file,HttpSession session){
		ModelAndView mav = new ModelAndView();
		String owner = (String)session.getAttribute("userId");
		boolean rst = fileSrv.insertFile(genre,album,file,owner);
		System.out.println(rst);
		if(rst){
				
				mav.setViewName("tm:file/list");
			}else{
				
				mav.setViewName("tm:file/error");
			}
		return mav;
	}
	
	@RequestMapping("file/list")
	public ModelAndView reqResolve(@RequestParam(defaultValue="1")int p) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tm:file/list");
		List li = fileSrv.readSomePage(p);
		mav.addObject("data", li);
		mav.addObject("last",fileSrv.calcLast());
		mav.addObject("size",fileSrv.getTotalCount());
		return mav;
	}
	
	@RequestMapping("/file/down")
	public ModelAndView downReqResolve(int filenum) {

		HashMap map = fileSrv.readDownTarget(filenum);
		ModelAndView mav = new ModelAndView();
		if (map == null) {
			mav.setViewName("file/fail");
		} else {
			mav.setViewName("fileDown");  
			mav.addObject("target", map);
		}
		return mav;
	}

}