package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.model.Review;
import board.model.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService rs;
	@RequestMapping("/review")
	@ResponseBody
	public String review(Review r, HttpSession hs){
		String writer = (String) hs.getAttribute("userId");
		r.setWriter(writer);
		System.out.println(r.getBoardnum()+" / "+r.getWriter()+" / "+ r.getComments());
		boolean flag = rs.register(r);
		System.out.println(flag);
		if(flag){
			return "TRUE";
		}else{
			return "FALSE";
		}
	}
	@RequestMapping("/review/delete")
	@ResponseBody
	public String delete(Review r, HttpSession hs){
		String writer = (String) hs.getAttribute("userId");
		r.setWriter(writer);
		System.out.println("delete : "+r.getBoardnum()+" / "+r.getWriter()+" / "+r.getUuid());
		boolean flag = rs.delete(r);
		System.out.println(flag);
		if(flag){
			return "TRUE";
		}else{
			return "FALSE";
		}
	}
}
