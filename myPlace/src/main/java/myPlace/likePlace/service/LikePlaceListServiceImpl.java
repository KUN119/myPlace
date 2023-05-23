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

}
