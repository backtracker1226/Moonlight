package org.moon.persistence;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.moon.domain.Criteria;
import org.moon.domain.ReviewBoardReplyVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyReviewBoardDATOImpl implements ReplyReviewBoardDAO {

	@Inject
	private SqlSession sess;
	
	Map<String, Object> paramMap = new HashMap<>();
	
	private static String namespace = "org.moon.mappers.replyReviewBoard";
	
	@Override
	public List<ReviewBoardReplyVO> list(Criteria cri, Integer bno) throws Exception {
		// TODO Auto-generated method stub
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		return sess.selectList(namespace + ".list", paramMap);
	}

	@Override
	public void create(ReviewBoardReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sess.insert(namespace + ".create", reply);

	}

	@Override
	public void update(ReviewBoardReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sess.update(namespace + ".modify", reply);

	}

	@Override
	public void delete(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		sess.delete(namespace + ".delete", rno);

	}

	@Override
	public int cout(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return sess.selectOne(namespace + ".count", bno);
	}

}
