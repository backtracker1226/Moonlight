package org.moon.service;

import java.util.List;

import org.moon.domain.RoofTopVO;

public interface RoofTopService {
	
	public void registRoofTop(RoofTopVO vo)throws Exception;
	
	public List<String> getImg(Integer rtid) throws Exception;
	
	public List<String> getHashtag(Integer rtid) throws Exception;
	
	public List<String> getOption(Integer rtid) throws Exception;
	
	public RoofTopVO readRooftop(Integer rtid)throws Exception;
	
	public void modify(RoofTopVO rtvo)throws Exception;
	
	public List<RoofTopVO> allList()throws Exception;
	
	public int count()throws Exception;
}
