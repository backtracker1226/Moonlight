package org.moon.service;

import java.util.List;

import org.moon.domain.Criteria;
import org.moon.domain.ReviewBoardReplyVO;

public interface ReplyReviewBoardService {
	
	public void addReply(ReviewBoardReplyVO reply)throws Exception;
	
	public List<ReviewBoardReplyVO> listReply(Criteria cri, Integer bno)throws Exception;
	
	public void modifyReply(ReviewBoardReplyVO reply)throws Exception;
	
	public void deleteReply(Integer rno)throws Exception;
	
	public int count(Integer bno)throws Exception;
		
	
}
