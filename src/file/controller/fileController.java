package file.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import file.model.fileService;

@Controller
public class fileController {

	private static final int HashMap = 0;
	private static final int List = 0;
	@Autowired
	fileService fileSrv;

	@RequestMapping("/file")
	public String file() {
		return "t:fileUp";
	}

	@RequestMapping("file/upload")
	public ModelAndView fileUpload(String genre, String album, @RequestParam(name = "file") MultipartFile file,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String owner = (String) session.getAttribute("userId");
		System.out.println(genre + "/" + album + "/" + file + "/" + owner);
		boolean rst = fileSrv.insertFile(genre, album, file, owner);
		System.out.println(rst);
		if (rst) {

			mav.setViewName("tm:file/redirect");
		} else {

			mav.setViewName("tm:file/error");
		}
		return mav;
	}

	@RequestMapping("file/list")
	public ModelAndView reqResolve(@RequestParam(defaultValue = "1") int p) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tm:file/list");
		List li = fileSrv.readSomePage(p);
		mav.addObject("data", li);
		mav.addObject("p", p);
		mav.addObject("last", fileSrv.calcLast());
		mav.addObject("size", fileSrv.getTotalCount());
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

	@RequestMapping("/file/Approval1")
	public ModelAndView ModelApproval1(int filenum) {
		System.out.println(filenum);
		List<HashMap> map = fileSrv.readApproval1(filenum);
		ModelAndView mav = new ModelAndView();
		if (map != null) {
			mav.addObject("map", map);
			mav.setViewName("tm:file/redirect");
		} else {
			mav.setViewName("fileDown");
		}
		return mav;
	}

	// 음원 정보창 으로 데이터 이동
	@RequestMapping("/file/Album1")
	public ModelAndView ModelAlbum(String owner, String album) {
		System.out.println(owner);
		System.out.println(album);
		List<HashMap> mp = fileSrv.readAlbum(owner, album);
		ModelAndView mav = new ModelAndView();
		System.out.println("넘어왔다~!!");
		if (mp != null) {
			mav.addObject("own",owner);
			mav.addObject("alb",album);
			mav.addObject("album", mp);
			mav.setViewName("tm:file/album");
		} else {
			mav.setViewName("file/error");

		}
		return mav;

	}
	//플레이 리스트 세션 에 데이터 넣어서 출력
	@RequestMapping("/file/one")
	@ResponseBody
	public String deleteBoard1(int filenum, HttpSession session ){
		System.out.println("filenum: " + filenum);
		boolean flag;
		flag = fileSrv.findMusic(filenum, session);
		System.out.println("session 넘어가라~!!");
		if(flag){
			return "TRUE";
		}else{
			return "FALSE";
		}
		}
	@RequestMapping("/file/remove")
	@ResponseBody
	public String Sessionremove(HttpSession session ){
	      session.removeAttribute("PlayList");
	      if(session.getAttribute("PlayList")==null){
	    	  System.out.println("세션 지움");
	    	  return "TRUE";
	      }else{
	    	  System.out.println("세션 안지움");
	    	  return "FALSE";
	      }
	}		
}


