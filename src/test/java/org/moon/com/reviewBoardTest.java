package org.moon.com;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.moon.domain.ReviewBoardReplyVO;
import org.moon.persistence.ReplyReviewBoardDAO;
import org.moon.persistence.ReviewBoardDAO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
@WebAppConfiguration
public class reviewBoardTest {
	
	@Inject
	DataSource ds;
	
	@Inject
	ReviewBoardDAO dao;
	

	@Inject
	ReplyReviewBoardDAO reply;

	@Test
	public void oracleConTest(){
		
		try {
			Connection con = ds.getConnection();
			System.out.println(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

	@Test
	public void replyInsert()throws Exception{
		
		ReviewBoardReplyVO vo = new ReviewBoardReplyVO();
		
		vo.setBno(3230);
		vo.setUname("쏘야");
		vo.setReplytext("쏘세지ㅣ 야채 볶음!!");
		
		reply.create(vo);
		
	}
	
	@Test
	public void deleteTEST()throws Exception{
		
		reply.delete(3);
		
	}
	
	@Test
	public void updateTest()throws Exception{
		
		ReviewBoardReplyVO vo = new ReviewBoardReplyVO();
		
		vo.setReplytext("대게 먹고 싶은 가봐요?");
		vo.setRno(1);
		
		reply.update(vo);
		
	}

}
