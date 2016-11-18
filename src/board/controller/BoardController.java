package board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	   public ModelAndView register(String subject, String comments) {
	      System.out.println(subject+" / "+ comments);
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("subject", subject);
	      mav.addObject("comments", comments);
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
				+ vb.getViewcount() + "/" + vb.getWriter());
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
}
