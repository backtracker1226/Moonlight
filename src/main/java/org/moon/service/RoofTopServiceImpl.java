package org.moon.service;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.moon.domain.RoofTopSearchCriteria;
import org.moon.domain.RoofTopVO;
import org.moon.persistence.RoofTopDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RoofTopServiceImpl implements RoofTopService {
	
	@Inject
	private RoofTopDAO dao;

	@Transactional
	@Override
	public void registRoofTop(RoofTopVO vo) throws Exception {
		
		dao.create(vo);
		
		String[] files = vo.getFiles();
		String[] hashtags = vo.getHashtags();
		String[] options = vo.getOptions();
		//String rfname = files[0];
		
		if(files==null){ 
			
			return;
			
		}else{
			
			for (String fileName : files) {
				dao.addImg(fileName);
			}
			
		}
		
		if(options==null){ 
			
			return;
			
		}else{
			
			for (String optionname : options) {
				dao.addOptions(optionname);
			}
			
		}

		if(hashtags==null){
			return;
		}else{
			
			for (String hashtagname : hashtags) {
				dao.addHashtag(hashtagname);
			}
		}
		String rfname = files[0];
		dao.addRimg(rfname);
		

	}

	@Override
	public List<String> getImg(Integer rtid) throws Exception {
		
		return dao.getImg(rtid);
	}

	@Override
	public RoofTopVO readRooftop(Integer rtid) throws Exception {
		
		return dao.read(rtid);
	}

	@Override
	public List<String> getHashtag(Integer rtid) throws Exception {
		
		return dao.getHashtag(rtid);
	}

	@Override
	public List<String> getOption(Integer rtid) throws Exception {
		
		return dao.getOption(rtid);
	}
	
	@Transactional
	@Override
	public void modify(RoofTopVO rtvo) throws Exception {
		
		dao.update(rtvo);
		
		Integer rtid = rtvo.getRtid();
		
		dao.deleteImg(rtid);
		dao.deleteHashtag(rtid);
		dao.deleteOption(rtid);
		dao.deleteRImg(rtid);
		
		String[] files = rtvo.getFiles();
		String[] hashtags = rtvo.getHashtags();
		String[] options = rtvo.getOptions();
				
		if(files==null){ 
			
			return;
			
		}else{
			
			for (String fileName : files) {
				dao.replaceImg(fileName, rtid);
			}
			
		}
		
		if(options==null){ 
			
			return;
			
		}else{
			
			for (String optionname : options) {
				dao.replaceOption(optionname, rtid);
			}
			
		}

		if(hashtags==null){
			return;
		}else{
			
			for (String hashtagname : hashtags) {
				dao.replaceHashtag(hashtagname, rtid);
			}
		}
//		String rfname = files[0];
//		dao.replaceRImg(rfname, rtid);
		
		
	}
	
	@Override
	public List<RoofTopVO> allList() throws Exception {
		
		return dao.allList();
	}

	@Override
	public int count() throws Exception {
		
		return dao.totalCount();
	}

	@Override
	public List<RoofTopVO> searchList(RoofTopSearchCriteria cri) throws Exception {
		
		return dao.searchList(cri);
	}

	@Override
	public int searchCount(RoofTopSearchCriteria cri) throws Exception {
		
		return dao.searchListCount(cri);
	}

	@Transactional
	@Override
	public void remove(Integer rtid) throws Exception {
		dao.deleteImg(rtid);
		dao.deleteHashtag(rtid);
		dao.deleteOption(rtid);
		dao.deleteRImg(rtid);
		dao.delete(rtid);
		
	}

	@Override
	public List<HashMap<String, BigInteger>> tagcount() throws Exception {
		
		return dao.tagcount();
	}
	
//	@Override
//	public void registRoofTop(RoofTopVO vo) throws Exception {
//		
//		dao.create(vo);
//
//	}

}
