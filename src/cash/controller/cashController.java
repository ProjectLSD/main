package cash.controller;

import javax.xml.crypto.dsig.keyinfo.RetrievalMethod;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class cashController {

	@RequestMapping("/cash/controller")
	public String page(){
		return "/cash/cash";
	}
}
