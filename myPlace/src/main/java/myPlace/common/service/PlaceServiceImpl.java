package myPlace.common.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import myPlace.common.dao.PlaceDAO;


@Service("placeService")
public class PlaceServiceImpl implements PlaceService{
	
	@Resource(name="placeDAO")
	private PlaceDAO placeDAO;
	
	@Override
	public void insertPlace(Map<String, Object> map) throws Exception {
		placeDAO.insertPlace(map);
	}
	

}
