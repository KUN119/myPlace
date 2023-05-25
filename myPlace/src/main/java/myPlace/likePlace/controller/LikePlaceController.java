package myPlace.likePlace.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import myPlace.likePlace.service.LikePlaceService;

import com.fasterxml.jackson.core.type.TypeReference;

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
    public void addLikePlace(@RequestParam Map<String, Object> map, HttpSession session) throws Exception{
		
		likePlaceService.insertLikePlace(map);
		
		//ObjectMapper 인스턴스 생성 (JSON 직렬화 및 역직렬화를 처리하기 위함)
		ObjectMapper objectMapper = new ObjectMapper();
		
		// session에서 jsonList를 가져오기
	    String jsonList = (String) session.getAttribute("PLACE_LIST");
	    
	    List<Map<String, Object>> placeList;
	    
	    // jsonList가 null이 아닌지 확인
	    if (jsonList != null) {
	    	// ObjectMapper를 사용하여 JSON 문자열을 List<Map<String, Object>>로 역직렬화
	        placeList = objectMapper.readValue(jsonList, new TypeReference<List<Map<String, Object>>>() {});
	    } else {
	    	// jsonList가 null인 경우 빈 ArrayList 초기화
	        placeList = new ArrayList<>();
	    }
	    
	    // 맵에서 "LIKEPLACE_PLACE"의 값을 가져옴
	    String likedPlace = (String) map.get("LIKEPLACE_PLACE");
	    // "LIKEPLACE_PLACE" 값을 담을 새로운 맵 생성
	    Map<String, Object> newPlace = new HashMap<>();
	    newPlace.put("LIKEPLACE_PLACE", likedPlace);
	    
	    // newPlace 맵을 placeList에 추가 jsonList에 데이터를 추가하기
	    placeList.add(newPlace);
	    
	    //placeList를 Java 개체를 JSON으로 변환 placeList Java 객체를 다시 JSON 문자열로 직렬화
	    jsonList = objectMapper.writeValueAsString(placeList);
	    
	    // session에 다시 jsonList를 "PLACE_LIST"키로 넣어주 "PLACE_LIST" 키로 업데이트된 jsonList를 세션에 저장
	    session.setAttribute("PLACE_LIST", jsonList);
	    
		}
	
	@RequestMapping(value="/disLikePlace")
    public void disLikePlace(@RequestParam Map<String, Object> map, HttpSession session) throws Exception{
		
		likePlaceService.disLikePlace(map);
		
		
		String canceledPlace = (String) map.get("LIKEPLACE_PLACE");
	    
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonList = (String) session.getAttribute("PLACE_LIST");
	    
	    List<Map<String, Object>> placeList;
	    
	    if (jsonList != null) {
	        placeList = objectMapper.readValue(jsonList, new TypeReference<List<Map<String, Object>>>() {});
	        for (Map<String, Object> place : placeList) {
	            String placeName = (String) place.get("LIKEPLACE_PLACE");
	            if (placeName.equals(canceledPlace)) {
	                placeList.remove(place);
	                break;
	            }
	        }
	        
	        jsonList = objectMapper.writeValueAsString(placeList);
	        session.setAttribute("PLACE_LIST", jsonList);
	        
	        System.out.println("PLACE_LIST: " + session.getAttribute("PLACE_LIST"));

		}
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
