package com.yedam.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.domain.BookVO;
import com.yedam.domain.RentVO;
import com.yedam.persistence.BookMapper;
import com.yedam.service.BookService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/book/*")
@Log4j
public class BookController {
	
	@Setter(onMethod_ = @Autowired)
	private BookService bookService;
	
	@GetMapping("index")
	public String main() {
		return "index";
	}
	
	@RequestMapping("list")
	public void list(Model model) {
		log.info("컨트롤...목록");
		List<BookVO> list = bookService.getList();
		model.addAttribute("list", list);
		log.info(list);
	}
	
	
	
	@GetMapping("register")
	public void register(Model model) {
		// 등록화면.
		int bno = bookService.selectBno() + 1;
		model.addAttribute("bno", bno);
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(BookVO book, RedirectAttributes model) {
		log.info("컨트롤... 등록.");
		// 등록 처리 후 목록으로 이동
		bookService.register(book);
		
		model.addFlashAttribute("result", book.getBookNo());
		
		return "redirect:/book/list";
	}
	
	
	@RequestMapping("rent")
	public void rentList(Model model) {
		log.info("컨트롤...대여 목록");
		List<RentVO> list = bookService.rentList();
		model.addAttribute("list", list);
		log.info(list);
	}
	
	
}
