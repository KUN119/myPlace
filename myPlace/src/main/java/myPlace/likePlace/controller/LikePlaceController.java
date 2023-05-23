package myPlace.likePlace.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import myPlace.likePlace.service.LikePlaceService;

@RestController
public class LikePlaceController {
	
	Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="likePlaceService")
	private LikePlaceService likePlaceService;

	@RequestMapping(value="/likePlaceList")
    public List<Map<String, Object>> LikePlaceList(@RequestParam Map<String, Object>map) throws Exception{
		System.out.println("오기는 함");
        List<Map<String,Object>> likePlaceList = likePlaceService.selectLikePlaceList(map);
        
        System.out.println(likePlaceList);
        
        return likePlaceList;
    }
	
	@RequestMapping(value="/addLikePlace")
    public void AddLikePlace(@RequestParam Map<String, Object> map) throws Exception{
		
		
		likePlaceService.insertLikePlace(map);
		}
	
	@RequestMapping(value="/disLikePlace")
    public void disLikePlace(@RequestParam Map<String, Object> map) throws Exception{
		
		likePlaceService.disLikePlace(map);
		}
	
	
	@RequestMapping(value="/idInLikePlace")
	public List<Map<String, Object>> IdInLikePlace(@RequestParam Map<String, Object>map) throws Exception{
		log.debug("###### idInLikePlace ######");
		log.debug("###### map ######:" + map);
		
        List<Map<String,Object>> idInLikePlace = likePlaceService.selectIdInLikePlace(map);
        
        log.debug("idInLikePlace:" + idInLikePlace);
        
        return idInLikePlace;
    }
}
