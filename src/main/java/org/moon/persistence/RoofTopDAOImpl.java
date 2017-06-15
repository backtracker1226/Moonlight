package org.moon.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.moon.domain.RoofTopVO;
import org.springframework.stereotype.Repository;

@Repository
public class RoofTopDAOImpl implements RoofTopDAO {
	
	private static String namespace = "org.moon.mappers.roofTopMapper";
	
	@Inject
	private SqlSession sess;

	@Override
	public void create(RoofTopVO vo) throws Exception {
		
		sess.insert(namespace+".create", vo);

	}

	@Override
	public void addImg(String fullName) throws Exception {
		
		sess.insert(namespace+".addImg", fullName);
		
	}

	@Override
	public void addHashtag(String hashtagname) throws Exception {
		
		sess.insert(namespace+".addHashtag", hashtagname);
		
	}

	@Override
	public void addOptions(String optionname) throws Exception {
		
		sess.insert(namespace+".addOptions", optionname);
		
	}

	@Override
	public List<String> getImg(Integer rtid) throws Exception {
		
		return sess.selectList(namespace+".getImg", rtid);
	}

	@Override
	public RoofTopVO read(Integer rtid) throws Exception {
		
		return sess.selectOne(namespace+".read", rtid);
	}

	@Override
	public List<String> getHashtag(Integer rtid) throws Exception {
		
		return sess.selectList(namespace+".getHashtag", rtid);
	}

	@Override
	public List<String> getOption(Integer rtid) throws Exception {
		
		return sess.selectList(namespace+".getOption", rtid);
	}

	@Override
	public void deleteImg(Integer rtid) throws Exception {
		
		sess.delete(namespace+".deleteImg", rtid);
		
	}

	@Override
	public void replaceImg(String fullName, Integer rtid) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("rtid", rtid);
		paramMap.put("fullName", fullName);
		
		sess.insert(namespace+".replaceImg", paramMap);
		
	}

	@Override
	public void deleteHashtag(Integer rtid) throws Exception {

		sess.delete(namespace+".deleteHashtag", rtid);
		
	}

	@Override
	public void replaceHashtag(String hashtagname, Integer rtid) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("rtid", rtid);
		paramMap.put("hashtagname", hashtagname);
		
		sess.insert(namespace+".replaceHashtag", paramMap);
		
	}

	@Override
	public void deleteOption(Integer rtid) throws Exception {
		
		sess.delete(namespace+".deleteOption", rtid);
		
	}

	@Override
	public void replaceOption(String optionname, Integer rtid) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("rtid", rtid);
		paramMap.put("optionname", optionname);
		
		sess.insert(namespace+".replaceOption", paramMap);
		
	}

	@Override
	public void update(RoofTopVO rtvo) throws Exception {
		
		sess.update(namespace+".update", rtvo);
		
	}
	
	@Override
	public List<RoofTopVO> allList() throws Exception {
		
		return sess.selectList(namespace+".allList");
	}

	@Override
	public int totalCount() throws Exception {
		
		return sess.selectOne(namespace+".count");
	}

}
