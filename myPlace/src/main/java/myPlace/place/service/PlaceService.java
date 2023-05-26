package myPlace.place.service;

import java.util.List;
import java.util.Map;

public interface PlaceService {

	void insertPlace(Map<String, Object> map)throws Exception;

	public List<Map<String, Object>> selectPlaceList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectMonthlyPlaceRank(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectPlaceSearch(Map<String, Object> map) throws Exception;
}
