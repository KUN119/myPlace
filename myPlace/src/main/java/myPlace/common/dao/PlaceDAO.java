package myPlace.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("placeDAO")
public class PlaceDAO extends AbstractDAO{
	
	public void insertPlace(Map<String, Object> map)throws Exception{
		insert("place.insertPlace", map);
	}

}
