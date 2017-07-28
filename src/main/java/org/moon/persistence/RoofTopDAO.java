package org.moon.persistence;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import org.moon.domain.RoofTopSearchCriteria;
import org.moon.domain.RoofTopVO;

public interface RoofTopDAO {
	
	public void create(RoofTopVO vo)throws Exception;
	
	public void addImg(String fullName)throws Exception;
	
	public void addRimg(String rfname)throws Exception;
	
	public void addHashtag(String hashtagname)throws Exception;
	
	public void addOptions(String optionname)throws Exception;
	
	public List<String> getImg(Integer rtid)throws Exception;
	
	public List<String> getHashtag(Integer rtid)throws Exception;
	
	public List<String> getOption(Integer rtid)throws Exception;
	
	public void deleteImg(Integer rtid)throws Exception;
	
	public void replaceImg(String fullName, Integer rtid)throws Exception;
	
	public void deleteRImg(Integer rtid)throws Exception;
	
	public void replaceRImg(String rfname, Integer rtid)throws Exception;
	
	public void deleteHashtag(Integer rtid)throws Exception;
	
	public void replaceHashtag(String hashtagname, Integer rtid)throws Exception;
	
	public void deleteOption(Integer rtid)throws Exception;
	
	public void replaceOption(String optionname, Integer rtid)throws Exception;
	
	public RoofTopVO read(Integer rtid)throws Exception;
	
	public void delete(Integer rtid)throws Exception;
	
	public void update(RoofTopVO rtvo) throws Exception;
	
	public List<RoofTopVO> allList()throws Exception;
	
	public int totalCount()throws Exception;
	
	public List<RoofTopVO> searchList(RoofTopSearchCriteria cri)throws Exception;
	
	public int searchListCount(RoofTopSearchCriteria cri)throws Exception;
	
	
	public List<HashMap<String, BigInteger>> tagcount()throws Exception;
	
	

}
