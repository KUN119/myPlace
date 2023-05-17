package myPlace.place.service;

import java.util.List;
import java.util.Map;

public interface PlaceService {

	void insertPlace(Map<String, Object> map)throws Exception;

	public List<Map<String, Object>> selectPlaceList(Map<String, Object> map) throws Exception;
}
