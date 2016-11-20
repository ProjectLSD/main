package board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.model.Board;
import board.model.BoardService;
import board.model.Review;
import board.model.ReviewService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService bs;
	@Autowired
	ReviewService rs;
	
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue="1")int p) {
		ModelAndView mav = new ModelAndView();
		List li = bs.readSomePage(p);
		mav.addObject("data", li);
		System.out.println(li);
		mav.addObject("p",p);
		System.out.println("p="+p);
		mav.addObject("last",bs.calcLast());
		mav.addObject("size",bs.getTotalCount());
		mav.setViewName("tm:board/list");
		return mav;
	}

	@RequestMapping("/register")
	   public ModelAndView register(Board b) {
	      System.out.println(b.getSubject()+" / "+ b.getComments()+" / "+b.getNum());
	      ModelAndView mav = new ModelAndView();
	      if(b!=null){
	    	  mav.addObject("board", b);
	      }
	      mav.setViewName("tm:board/register");
	      return mav;
	   }

	@RequestMapping("/view")
	public ModelAndView view(int num) {
		ModelAndView mav = new ModelAndView();
		Board b = bs.selectNum(num);
		List<Review> lr = rs.getReview(num);
		mav.addObject("board", b);
		mav.addObject("review", lr);
		mav.setViewName("tm:board/view");
		return mav;
	}

	@RequestMapping(value = "/insertin")
	public ModelAndView insertVisit(Board vb, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("userId");

		System.out.println(vb.getComments() + "/" + vb.getLikes() + "/" + vb.getNum() + "/" + vb.getSubject() + "/"
				+ vb.getViewcount() + "/" + vb.getWriter()+ "/" + vb.getType());
		boolean flag = bs.insert(id, vb);
		if (flag) {
			mav.setViewName("board/success");
			System.out.println("성공2");
		} else {
			mav.setViewName("err");
			System.out.println("실패");
		}
		return mav;
	}
	
	@RequestMapping("/update")
	public ModelAndView updateBoard(Board b, HttpSession session){
		ModelAndView mav = new ModelAndView();
		String writer = (String) session.getAttribute("userId");
		b.setWriter(writer);
		System.out.println(b);
		System.out.println("update: "+b.getComments() + "/" + b.getLikes() + "/" + b.getNum() + "/" + b.getSubject() + "/"
				+ b.getViewcount() + "/" + b.getWriter());
		boolean flag = bs.update(b);
		System.out.println(flag);
		mav.setViewName("board/success");
		return mav;
	}
	// 게시판 수정
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteBoard(int num){
		boolean flag = bs.delete(num);
		System.out.println(flag);
		if(flag){
			return "TRUE";
		}else{
			return "FALSE";
		}
		
	}
}
