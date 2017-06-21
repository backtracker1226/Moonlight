package org.moon.service;

import java.util.List;

import javax.inject.Inject;

import org.moon.domain.BoardVO;
import org.moon.domain.Criteria;
import org.moon.persistence.ReviewBoardDAOImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;


@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {
	
	@Inject
	private ReviewBoardDAOImpl dao;

	@Override
	public void regist(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		dao.create(board);

	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		dao.viewUpdate(bno);
		
		return dao.read(bno);
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		dao.update(board);

	}

	@Override
	public void remove(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);

	}

	@Override
	public List<BoardVO> listAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub dao.list(cri);
		return dao.list(cri);
				
	}

	@Override
	public List<BoardVO> listAll2() throws Exception {
		// TODO Auto-generated method stub
		return dao.list2();
	}

	@Override
	public Integer getCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.getCount(cri);
	}



	

}
