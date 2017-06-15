package org.moon.persistence;

import java.util.List;

import org.moon.domain.Criteria;
import org.moon.domain.ReviewBoardReplyVO;

public interface ReplyReviewBoardDAO {
	
	public List<ReviewBoardReplyVO> list(Criteria cri,Integer bno)throws Exception;
	
	public void create(ReviewBoardReplyVO reply)throws Exception;
	
	public void update(ReviewBoardReplyVO reply)throws Exception;
	
	public void delete(Integer rno)throws Exception;
	
	public int cout(Integer bno)throws Exception;
	

}
