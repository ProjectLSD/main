package image.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import image.model.imageService;

@Controller
public class imageController {

	@Autowired
	imageService imgSrv;
	
	@RequestMapping("/image/uploadView")
	public String view(){
		return "tm:image/image";
	}
	
	@RequestMapping("/image/upload")
	public ModelAndView imgUpload(@RequestParam(name = "file") MultipartFile file,HttpSession session){
		ModelAndView mav = new ModelAndView();
		String owner = (String) session.getAttribute("userId");
		System.out.println(file + "/" + owner);
		boolean rst = imgSrv.insertImg(file, owner);
		System.out.println(rst);
		if (rst) {

			mav.setViewName("tm:file/redirect");
		} else {

			mav.setViewName("tm:file/error");
		}
		return mav;
	}

}
