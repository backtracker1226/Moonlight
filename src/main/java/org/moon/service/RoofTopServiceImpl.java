package org.moon.service;

import java.util.List;

import javax.inject.Inject;

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
		
		
	}
	
	@Override
	public List<RoofTopVO> allList() throws Exception {
		
		return dao.allList();
	}

	@Override
	public int count() throws Exception {
		
		return dao.totalCount();
	}
	
//	@Override
//	public void registRoofTop(RoofTopVO vo) throws Exception {
//		
//		dao.create(vo);
//
//	}

}
