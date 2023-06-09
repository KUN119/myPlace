package myPlace.likePlace.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import myPlace.likePlace.dao.LikePlaceDAO;

@Service("likePlaceService")
public class LikePlaceListServiceImpl implements LikePlaceService{
	
	@Resource(name="likePlaceDAO")
	private LikePlaceDAO likePlaceDAO;

	@Override
	public List<Map<String, Object>> selectLikePlaceList(Map<String, Object> map) throws Exception {
		return likePlaceDAO.selectLikePlaceList(map);
	}

	@Override
	public void insertLikePlace(Map<String, Object> map) throws Exception {
		likePlaceDAO.insertLikePlace(map);
	}

	@Override
	public void disLikePlace(Map<String, Object> map) throws Exception {
		likePlaceDAO.disLikePlace(map);
		
	}

	@Override
	public List<Map<String, Object>> selectIdInLikePlace(Map<String, Object> map) throws Exception {
		return likePlaceDAO.selectIdInLikePlace(map);
	}

	@Override
	public List<Map<String, Object>> selectLikePlace(Map<String, Object> map) throws Exception {
		return likePlaceDAO.selectLikePlace(map);
	}

	@Override
	public void insertTempPlace(Map<String, Object> map) throws Exception {
		likePlaceDAO.insertTempPlace(map);
	}

	@Override
	public void deleteTempPlace(Map<String, Object> map) throws Exception {
		likePlaceDAO.deleteTempPlace(map);
	}

	@Override
	public Map<String, Object> selectTempPlace(Map<String, Object> map) throws Exception {
		return likePlaceDAO.selectTempPlace(map);
	}

	@Override
	public Map<String, Object> selectRankPlace(Map<String, Object> map) throws Exception {
		return likePlaceDAO.selectRankPlace(map);
	}

}
