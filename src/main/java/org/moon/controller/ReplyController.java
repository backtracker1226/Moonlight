package org.moon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.moon.domain.Criteria;
import org.moon.domain.PageMaker;
import org.moon.domain.ReviewBoardReplyVO;
import org.moon.service.ReplyReviewBoardService;
import org.moon.service.ReviewBoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/replies")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	public ReplyReviewBoardService service;
	
	@RequestMapping(value="", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReviewBoardReplyVO reply){
		
		ResponseEntity<String> entity = null;
		
		try{
			
			service.addReply(reply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
	}

	
	@RequestMapping(value="/{bno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> list(@PathVariable("bno") Integer bno, @PathVariable("page") Integer page, Model model){
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try{
			Criteria cri = new Criteria();
			cri.setPage(page);
			int replyCount = service.count(bno);
			PageMaker pageMaker = new PageMaker(cri, replyCount);
			
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReviewBoardReplyVO> list = service.listReply(cri, bno);
			
			map.put("list", list);
			
			//int replyCount = service.count(bno);
			//pageMaker.setTotalSize(replyCount);
			
			//pageMaker.setCri(cri);
			
			System.out.println(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			System.out.println("get end:"+pageMaker.getEnd());
			System.out.println("temp end:"+pageMaker.getTempEnd());
			System.out.println("cri getpage"+cri.getPage());
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{rno}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReviewBoardReplyVO reply){
		
		ResponseEntity<String> entity = null;
		
		try{
			System.out.println("확인");
			
			reply.setRno(rno);
			
			service.modifyReply(reply);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rno") Integer rno){
		
		ResponseEntity<String> entity = null;
		
		try{
			
			service.deleteReply(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			
		}
	
		return entity;
		
	}
	


}
