package org.moon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.moon.domain.Criteria;
import org.moon.domain.ReviewBoardReplyVO;
import org.moon.persistence.ReplyReviewBoardDAO;
import org.moon.persistence.ReviewBoardDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReplyReviewBoardServiceImp implements ReplyReviewBoardService {

	@Inject
	private ReplyReviewBoardDAO dao;
	
	@Inject
	private ReviewBoardDAO boardDAO;
	
	@Transactional
	@Override
	public void addReply(ReviewBoardReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.create(reply);
		boardDAO.updateReplyCnt(reply.getBno(), 1);
		
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

	@Transactional
	@Override
	public void deleteReply(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		int bno=dao.getBno(rno);
		dao.delete(rno);
		boardDAO.updateReplyCnt(bno, -1);

	}

	@Override
	public int count(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.cout(bno);
	}

	@Override
	public void replyalldel(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		dao.replyalldel(bno);
		
	}

}
