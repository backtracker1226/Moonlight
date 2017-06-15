package org.moon.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.moon.domain.BoardVO;
import org.moon.domain.Criteria;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewBoardDAOImpl implements ReviewBoardDAO {
	
	static final String namespace = "org.moon.mappers.reviewBoardMapper";

	@Inject
	SqlSession ses;
	
	
	@Override
	public void create(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		ses.insert(namespace +".create", vo);

	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace + ".read", bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		ses.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		ses.delete(namespace + ".delete" , bno);
	}

	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectList(namespace + ".list", cri);
		
	}

	@Override
	public Integer getCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace + ".totalSize", cri);
	}

	@Override
	public List<BoardVO> list2() throws Exception {
		// TODO Auto-generated method stub
		return ses.selectList(namespace + ".list2");
	}

}
