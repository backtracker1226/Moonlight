package org.moon.persistence;

import java.util.List;

import org.moon.domain.BoardVO;
import org.moon.domain.Criteria;

public interface ReviewBoardDAO {
	
	//CRUD + list
	//create, read, update, delete, list
	
	public void create(BoardVO vo)throws Exception;
	
	public BoardVO read(Integer bno)throws Exception;
	
	public void update(BoardVO vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public List<BoardVO> list(Criteria cri)throws Exception;
	
	public List<BoardVO> list2()throws Exception;
	
	public Integer getCount(Criteria cri)throws Exception;
	
}
