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
		
		//좋아요 장소를 db에 추가
		likePlaceService.insertLikePlace(map);
		
		//ObjectMapper 인스턴스 생성 (JSON 직렬화 및 역직렬화를 처리하기 위함)
		ObjectMapper objectMapper = new ObjectMapper();
		
		// session에서 jsonList를 가져오기 
	    String jsonList = (String) session.getAttribute("PLACE_LIST");
	    
	    // placeList 변수를 선언
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
	    
	    // session에 다시 jsonList를 "PLACE_LIST"키로 넣어주고 "PLACE_LIST" 키로 업데이트된 jsonList를 세션에 저장
	    session.setAttribute("PLACE_LIST", jsonList);
	    
		}
	
	///disLikePlace URL에 대한 요청을 처리함
	@RequestMapping(value="/disLikePlace")
    public void disLikePlace(@RequestParam Map<String, Object> map, HttpSession session) throws Exception{
		
		//서비스 메서드를 호출
		likePlaceService.disLikePlace(map);
		
		//map에서 좋아요를 취소할 장소의 이름을 가져옴
		String canceledPlace = (String) map.get("LIKEPLACE_PLACE");
	    
	    ObjectMapper objectMapper = new ObjectMapper();
	    //현재 사용자의 세션에 들어있는 장소 목록 
	    String jsonList = (String) session.getAttribute("PLACE_LIST");
	    
	    //장소 목록을 저장하기 위한 리스트 변수를 선언
	    List<Map<String, Object>> placeList;
	    
	    if (jsonList != null) {
	    	// ObjectMapper를 사용하여 JSON 문자열을 List<Map<String, Object>>로 역직렬화
	        placeList = objectMapper.readValue(jsonList, new TypeReference<List<Map<String, Object>>>() {});
	        //placeList 반복하면서 place에 요소저장
	        for (Map<String, Object> place : placeList) {
	        	//member컨트롤러의 세션의 PLACE_LIST엔 jsonList가 있고 세션에 있는 PLACE_LIST를 jsonList에 넣어줬고 그걸 역직렬화해서 placeLsit에 넣어줫
	        	//LIKEPLACE_PLACE는 member컨트롤러에서 jsonList에 selectLikePlace(map)에서 받아와서 json문자열로 있어
	            String placeName = (String) place.get("LIKEPLACE_PLACE");
	            //현재 장소의 이름이 취소할 장소의 이름과 일치하는 경우 세션의 LIKEPLACE_PLACE와 map에서 가져온 LIKEPLACE_PLACE비교?
	            //같으면 세션의 LIKEPLACE_PLACE를 삭제
	            if (placeName.equals(canceledPlace)) {
	                placeList.remove(place);
	                break;
	            }
	        }
	        
	        //<List<Map<String, Object>>> 형식의 placeList를 다시 json형식으로 변환 (우리 세션엔 기본적으로 json형식으로 저장돼 있음)
	        jsonList = objectMapper.writeValueAsString(placeList);
	        //현재 사용자의 장소 목록을 세션에 저장
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
	
	@RequestMapping(value="/addTempPlace")
    public void addTempPlace(@RequestParam Map<String, Object> map) throws Exception{
		
		// 이미 임시데이터가 저장되어있는지 확인
		Map<String, Object> tempPlace = likePlaceService.selectTempPlace(map);
		
		//데이터가 이미 존재한다면
		if(tempPlace != null) {
			// 장소정보를 저장하지 않음
		}else {
			// 장소정보를 임시로 저장
			likePlaceService.insertTempPlace(map);
		}
		
	}
	
	@RequestMapping(value="/deleteTempPlace")
    public void deleteTempPlace(@RequestParam Map<String, Object> map) throws Exception{
		// 임시로 저장한 장소정보를 삭제
		likePlaceService.deleteTempPlace(map);
	}
	
	@RequestMapping(value="/selectTempPlace")
    public Map<String, Object> selectTempPlace(@RequestParam Map<String, Object> map) throws Exception{
		// 임시로 저장한 장소정보를 조회
		Map<String, Object> result = likePlaceService.selectTempPlace(map);
		
		return result;
	}
	
	@RequestMapping(value="/selectRankPlace")
    public Map<String, Object> selectRankPlace(@RequestParam Map<String, Object> map) throws Exception{
		// 임시로 저장한 장소정보를 조회
		Map<String, Object> result = likePlaceService.selectRankPlace(map);
		
		return result;
	}
	
	
}
