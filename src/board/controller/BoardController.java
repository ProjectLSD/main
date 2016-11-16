package board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.model.Board;
import board.model.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService bs;

	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<Board> bl = bs.getAll();
		mav.addObject("board", bl);
		mav.setViewName("tm:board/list");
		return mav;
	}

	@RequestMapping("/register")
	public String register() {
		return "tm:board/register";
	}

	@RequestMapping("/view")
	public ModelAndView view(int num) {
		ModelAndView mav = new ModelAndView();
		Board b = bs.selectNum(num);
		mav.addObject("board", b);
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
