package myPlace.place.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import myPlace.place.dao.PlaceDAO;

@Service("placeService")
public class PlaceServiceImpl implements PlaceService{
	
	@Resource(name="placeDAO")
	private PlaceDAO placeDAO;
	
	@Override
	public void insertPlace(Map<String, Object> map) throws Exception {
		placeDAO.insertPlace(map);
	}
	
	@Override
	public List<Map<String, Object>> selectPlaceList(Map<String, Object> map) throws Exception {
		return placeDAO.selectPlaceList(map);
	}

	@Override
	public List<Map<String, Object>> selectMonthlyPlaceRank(Map<String, Object> map) throws Exception {
		return placeDAO.selectMonthlyPlaceRank(map);
	}

	@Override
	public Map<String, Object> selectPlaceSearch(Map<String, Object> map) throws Exception {
		return placeDAO.selectPlaceSearch(map);
	}

}
