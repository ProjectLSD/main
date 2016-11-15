package file.controller;


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
	
	@RequestMapping("file/upload")
	public  ModelAndView fileUpload(String genre,String album,@RequestParam(name="image") MultipartFile image,
			@RequestParam(name="file")MultipartFile file,HttpSession session){
		System.out.println("c1");
		ModelAndView mav = new ModelAndView();
		System.out.println("c2");
		String owner = (String)session.getAttribute("userId");
		System.out.println("c3");
		boolean rst = fileSrv.insertFile(genre,album,image,file,owner);
		System.out.println("c4");
		if(rst){
				
				mav.setViewName("file/list");
			}else{
				
				mav.setViewName("file/error");
			}
		return mav;
	}
}
