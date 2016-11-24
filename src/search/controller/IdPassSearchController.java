package search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import member.model.Member;
import search.model.IdPassSearchService;

@Controller
@RequestMapping("/idpasssearch")
public class IdPassSearchController {
	@Autowired
	IdPassSearchService idpss;
	@RequestMapping("/searchIdResult")
	   @ResponseBody
	   public String searchId(Member dto){
	      List<Member> idList = idpss.searchId(dto);
	      String str = null;      
	         str="[";
	         for(int i=0; i<idList.size(); i++){
	            str+=" \" " + idList.get(i).getId() + " \" ";
	            if(idList.size()<idList.size()-1){
	               str+=",";
	            }
	         }
	         str+="]";         
	      return str;      
	   }
	   
	   @RequestMapping("/searchPwResult")
	   public String searchPw(String id, String email){
	      boolean r = idpss.searchPw(id, email);
	      if(r){
	         return "tw:email/sendEmail";
	      }else{
	         return "tw:Error/emailErr";
	      }
	   }
}
