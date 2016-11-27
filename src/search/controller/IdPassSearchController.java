package search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import band.model.Band;
import member.model.Member;
import search.model.IdPassSearchService;

@Controller
public class IdPassSearchController {
	@Autowired
	IdPassSearchService idpss;

	@RequestMapping("/bandsearchIdResult")
	@ResponseBody
	public String bandsearchId(String email, String phone1, String phone2, String phone3) {
		List<Band> idList = idpss.bandsearchId(email, phone1, phone2, phone3);
		String str = null;
		str = "[";
		for (int i = 0; i < idList.size(); i++) {
			str += "\"" + idList.get(i).getId() + "\"";
			if (idList.size() < idList.size() - 1) {
				str += ",";
			}
		}
		str += "]";
		return str;
	}

	@RequestMapping("/bandsearchPwResult")
	public String bandsearchPw(String id, String email) {
		boolean r = idpss.bandsearchPw(id, email);
		if (r) {
			return "tm:email/sendEmail";
		} else {
			return "tm:Erorr/emailErr";
		}
	}
	
	@RequestMapping("/membersearchIdResult")
	@ResponseBody
	public String membersearchId(String email, String phone1, String phone2, String phone3) {
		List<Member> idList = idpss.membersearchId(email, phone1, phone2, phone3);
		String str = null;
		str = "[";
		for (int i = 0; i < idList.size(); i++) {
			str += "\"" + idList.get(i).getId() + "\"";
			if (idList.size() < idList.size() - 1) {
				str += ",";
			}
		}
		str += "]";
		return str;
	}

}
