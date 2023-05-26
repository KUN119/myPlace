package myPlace.place.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import myPlace.common.dao.AbstractDAO;

@Repository("placeDAO")
public class PlaceDAO extends AbstractDAO{
	
	public void insertPlace(Map<String, Object> map)throws Exception{
		insert("place.insertPlace", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPlaceList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("place.selectPlaceList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMonthlyPlaceRank(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("place.selectMonthlyPlaceRank", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPlaceSearch(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("place.selectPlaceSearch", map);
	}
}
