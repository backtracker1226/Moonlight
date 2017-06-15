package org.moon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.moon.domain.Criteria;
import org.moon.domain.ReviewBoardReplyVO;
import org.moon.persistence.ReplyReviewBoardDAO;
import org.springframework.stereotype.Service;

@Service
public class ReplyReviewBoardServiceImp implements ReplyReviewBoardService {

	@Inject
	private ReplyReviewBoardDAO dao;
	
	@Override
	public void addReply(ReviewBoardReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.create(reply);
		
	}

	@Override
	public List<ReviewBoardReplyVO> listReply(Criteria cri,Integer bno) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.list(cri, bno);
	}

	@Override
	public void modifyReply(ReviewBoardReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.update(reply);

	}

	@Override
	public void deleteReply(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(rno);

	}

	@Override
	public int count(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.cout(bno);
	}

}
