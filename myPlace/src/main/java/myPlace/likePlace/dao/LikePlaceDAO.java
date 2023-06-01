package myPlace.likePlace.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import myPlace.common.dao.AbstractDAO;

@Repository("likePlaceDAO")
public class LikePlaceDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLikePlaceList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("likePlace.selectLikePlaceList", map);
	}
		
	public void insertLikePlace(Map<String, Object> map) throws Exception {
		insert("likePlace.insertLikePlace", map);
	}
	
	public void disLikePlace(Map<String, Object> map) throws Exception {
		delete("likePlace.disLikePlace", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIdInLikePlace(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("likePlace.selectIdInLikePlace", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLikePlace(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("likePlace.selectLikePlace", map);
	}
	
	public void insertTempPlace(Map<String, Object> map) throws Exception {
		insert("likePlace.insertTempPlace", map);
	}
	
	public void deleteTempPlace(Map<String, Object> map) throws Exception {
		delete("likePlace.deleteTempPlace", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTempPlace(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("likePlace.selectTempPlace", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRankPlace(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("likePlace.selectRankPlace", map);
	}

}
