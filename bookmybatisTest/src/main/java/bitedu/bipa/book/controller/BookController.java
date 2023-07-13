package bitedu.bipa.book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bitedu.bipa.book.service.BookService;
import bitedu.bipa.book.vo.BookCopy;
import bitedu.bipa.book.vo.UserCopy;

@Controller("bookController")
@RequestMapping("mybatisdb")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView firstView() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("./member/user_regist");
		return mav;
	}

	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView list() {
		
		ModelAndView mav = new ModelAndView();
		ArrayList<BookCopy> list = bookService.selectBookAll();
		mav.addObject("list",list);
		mav.setViewName("./manager/book_list");
		return mav;
	}
	
	@RequestMapping(value="/userRegist.do", method=RequestMethod.POST)
	public ModelAndView userRegist(@ModelAttribute("User") UserCopy copy) {
		ModelAndView mav = new ModelAndView();
		System.out.println(copy);
		System.out.println(copy.getUserId());
		bookService.registUser(copy);
		System.out.println("userRegist");
		
		ArrayList<BookCopy> list = bookService.selectBookAll();
		mav.addObject("list",list);
		
		mav.setViewName("redirect:list.do");
		return mav;
	}

	
	@RequestMapping(value="/view_regist.do", method=RequestMethod.GET)
	public ModelAndView viewRegist() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("./manager/book_regist");
		return mav;
	}
	
	@RequestMapping(value="/view_detail.do", method=RequestMethod.GET)
	public ModelAndView viewDetail(@RequestParam("bookSeq") String bookSeq) {
		ModelAndView mav = new ModelAndView();
		BookCopy copy = bookService.findBook(bookSeq);
		mav.addObject("copy",copy);
		mav.setViewName("./manager/book_detail");
		return mav;
	}
	
	@RequestMapping(value="/view_update.do", method=RequestMethod.POST)
	public ModelAndView viewUpdate(@RequestParam("bookSeq") String bookSeq) {
		ModelAndView mav = new ModelAndView();
		BookCopy copy = bookService.findBook(bookSeq);
		mav.addObject("copy",copy);
		mav.setViewName("./manager/book_update");
		return mav;
	}
	
	@RequestMapping(value="/remove.do", method=RequestMethod.GET)
	public ModelAndView remove(@RequestParam("bookSeq") String bookSeq) {
		ModelAndView mav = new ModelAndView();
		boolean flag = bookService.removeBook(bookSeq);
		
		mav.setViewName("redirect:list.do?flag=true");
		return mav;
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("book") BookCopy copy) {
		ModelAndView mav = new ModelAndView();

		boolean flag = bookService.modifyBook(copy);
		System.out.println("regist");
		mav.setViewName("redirect:list.do");
		return mav;
	}
	
	@RequestMapping(value="/regist.do", method=RequestMethod.POST)
	public ModelAndView regist(@ModelAttribute("book") BookCopy copy) {
		ModelAndView mav = new ModelAndView();
		System.out.println(copy);
		bookService.registBook(copy);
		System.out.println("regist");
		mav.setViewName("redirect:list.do");
		return mav;
	}

	@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
	public void searchBoard(@RequestParam("userId") String userId, HttpServletResponse response) throws IOException {

		int checkId = bookService.checkId(userId);
		
		System.out.println("checkId : " + checkId);
	    
		PrintWriter out = response.getWriter(); 
		out.println(checkId);
		out.close();

	}
	
	
	
	
}
