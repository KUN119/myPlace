package myPlace.likePlace.service;

import java.util.List;
import java.util.Map;

public interface LikePlaceService {

	public List<Map<String, Object>> selectLikePlaceList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectIdInLikePlace(Map<String, Object> map) throws Exception;

	public void insertLikePlace(Map<String, Object> map) throws Exception;
	
	public void disLikePlace(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectLikePlace(Map<String, Object> map) throws Exception;

}
