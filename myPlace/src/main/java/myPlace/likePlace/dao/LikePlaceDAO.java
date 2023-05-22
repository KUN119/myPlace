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
	
//	public void disLikePlace(Map<String, Object> map) throws Exception {
//		delete("likePlace.deleteLikePlace", map);
//	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIdInLikePlace(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("likePlace.selectIdInLikePlace", map);
	}

}
