package org.moon.controller;



import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.moon.domain.BoardVO;
import org.moon.domain.Criteria;
import org.moon.domain.PageMaker;
import org.moon.service.ReviewBoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private ReviewBoardService service;
	
	//파일 업로드
	@GetMapping("/image")
	public void image() {
		// image.jsp 연결만 해주는 메소드.
	}
	
	@GetMapping("/file")
	public void file() {
		// file.jsp 연결만 해주는 메소드.
	}

	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGet(BoardVO board, Model model)throws Exception{
		
		logger.info("register get !!");
	}

	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String registerPost(BoardVO board, Model model, RedirectAttributes rttr)throws Exception{
		service.regist(board);
		
		model.addAttribute("result", "success");
		
		return "redirect:/board";
	}
	
	    

	@RequestMapping(value="/board", method=RequestMethod.GET)
	public void listAll(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		List<BoardVO> list = new ArrayList<>();
		
		int totalSize = service.getCount(cri);
		
		PageMaker pager = new PageMaker(cri, totalSize);
		
		list = service.listAll(cri);
		
		model.addAttribute("list", service.listAll(cri));
		model.addAttribute("pager", pager);
		
		logger.info("show list");
		
	}
	
	@RequestMapping(value ="/view", method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, Model model, @ModelAttribute("cri")Criteria cri)throws Exception{
		BoardVO board = new BoardVO();

		int totalSize = service.getCount(cri);

		PageMaker pager = new PageMaker(cri, totalSize);

		board = service.read(bno);		

		model.addAttribute("boardVO", board);
		model.addAttribute("pager", pager);
		
		
	}
	@PostMapping("/delete")
	public String delete(@RequestParam("bno") Integer bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception {

		service.remove(bno);
		

		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board";
	}
	
	@GetMapping("/modify")
	public void modify(@ModelAttribute("cri") Criteria cri, Integer pno, Model model) throws Exception {
/*		model.addAttribute("boardVO", service.(pno));
		List<String> list = new ArrayList<>();
		service.findfileByPno(pno).forEach(fvo -> {
			list.add(fvo.getFname());
		});
		model.addAttribute("files", list);*/
	}

	@PostMapping("/modify")
	public String modifyPost(BoardVO board, String files, RedirectAttributes reAttr) {

/*		try {
			log.info("modifyPost....and: " + vo.getPno());
			service.modify(vo, files.split(","));
			reAttr.addFlashAttribute("msg", "modS");
		} catch (Exception e) {
			reAttr.addFlashAttribute("msg", "modF");
		}
		reAttr.addAttribute("pno", vo.getPno());*/
		return "redirect:/board";
	}
	

	
}
