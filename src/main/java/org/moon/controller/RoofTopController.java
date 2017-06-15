package org.moon.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.moon.domain.RoofTopVO;
import org.moon.service.RoofTopService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
@RequestMapping("/rooftop")
public class RoofTopController {
	
	private static final Logger logger = Logger.getLogger(RoofTopController.class);
	
	@Inject
	private RoofTopService service;
	
	@GetMapping("/regist")
	public void registGet(RoofTopVO vo, Model model)throws Exception{
		
		logger.info("registGet Start!");
	}
	
	@PostMapping("/regist")
	public String registPost(RoofTopVO vo, Model model, RedirectAttributes rttr)throws Exception{
		
		logger.info("register post....................");
		
		service.registRoofTop(vo);
		
		rttr.addFlashAttribute("msg", "success");
		logger.info(vo);
		
		return "redirect:/";
		
	}
	
	@GetMapping("/read")
	public void readRooftop(@RequestParam("rtid")Integer rtid, Model model)throws Exception{
		
		model.addAttribute("rtvo", service.readRooftop(rtid));
		
	}
	
	@GetMapping("/modify")
	public void modifyGET(Integer rtid, Model model) throws Exception {
		
		logger.info("modify get start");
	    model.addAttribute("rtvo", service.readRooftop(rtid));
	    
	}

	@PostMapping("/modify")
	public String modifyPOST(RoofTopVO rtvo, RedirectAttributes rttr) throws Exception {

	    
	    service.modify(rtvo);

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    logger.info("modify post start");
	    logger.info(rtvo);

	    return "redirect:/";
	}
	
	@GetMapping("/list")
	public void allList(Model model)throws Exception{
		
		logger.info("allList start");
		List<RoofTopVO> list = new ArrayList<>();
		list = service.allList();
		
		model.addAttribute("list", list);
	}
	
	/*@GetMapping("/regist2")
	public void registGet2(RoofTopVO vo, Model model)throws Exception{
		
		logger.info("registGet Start!");
	}
	
	@PostMapping("/regist2")
	public String registPost2(RoofTopVO vo, Model model, RedirectAttributes rttr)throws Exception{
		
		logger.info("register post....................");
		
		service.registRoofTop(vo);
		
		rttr.addFlashAttribute("msg", "success");
		logger.info(vo);
		
		return "redirect:/";
		
	}*/
	
	/*@GetMapping("/list")
	public void list()throws Exception{
		
		logger.info("list page");
	}*/
	
	@RequestMapping("/getImg/{rtid}")
	@ResponseBody
	public List<String> getImg(@PathVariable("rtid") Integer rtid)throws Exception{
		
		return service.getImg(rtid);
		
	}
	
	@RequestMapping("/getHashtag/{rtid}")
	@ResponseBody
	public List<String> getHashtag(@PathVariable("rtid") Integer rtid)throws Exception{
		
		return service.getHashtag(rtid);
		
	}
	
	@RequestMapping("/getOption/{rtid}")
	@ResponseBody
	public List<String> getOption(@PathVariable("rtid") Integer rtid)throws Exception{
		
		return service.getOption(rtid);
		
	}
	

}
