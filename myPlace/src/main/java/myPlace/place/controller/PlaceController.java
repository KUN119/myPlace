package myPlace.place.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import myPlace.place.service.PlaceService;

@RestController
@RequiredArgsConstructor
public class PlaceController {
	
	Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "placeService")
	private PlaceService placeService;
	
	@RequestMapping("/api/load")
	public Map<String, Object> insertPlace() throws Exception{
		log.debug("###### api load ######");
		
		String result="";
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			URL url = new URL("https://api.odcloud.kr/api/15052408/v1/uddi:611c5470-ad94-49e8-8f72-973732c56304?page=1&perPage=100&serviceKey=oQxZdiXR8K8U%2BsFvOZJxW8bP%2FIs0tqBThPnNxNt0FJrjgOZXM537iVGIyUfCPX86eghuF4HLzRaQ7t4I5gfiPQ%3D%3D");
			HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
			urlConnection.setRequestProperty("Content-Type", "application/json"); // 1.셋 리퀘스트
			
			BufferedReader bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8")); // 새 버퍼 리더
			result = bf.readLine(); // 버퍼 리드 한 것을 result에 할당
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONArray jsonArray = (JSONArray) jsonObject.get("data");
			
			for(int i = 0; i<jsonArray.size(); i++) {
				JSONObject object = (JSONObject)jsonArray.get(i);
				
				String lng = (String)object.get("경도");
				String lat = (String)object.get("위도");
				String date = (String)object.get("데이터기준일자");
				String addr = (String)object.get("소재지(도로명)");
				String name = (String)object.get("업소명");
				String type = (String)object.get("업태");
				String tel = (String)object.get("전화번호");
				String menu = (String)object.get("주취급음식");
				
				map.put("lng", lng);
				map.put("lat", lat);
				map.put("date", date);
				map.put("addr", addr);
				map.put("name", name);
				map.put("type", type);
				map.put("tel", tel);
				map.put("menu", menu);
				
				placeService.insertPlace(map);
				log.debug("map:" + map);
			}
		}catch(Exception e) {
			log.debug(e);
		}
		return map;
	}

	@RequestMapping(value="/place")
	public ResponseEntity<List<Map<String, Object>>> mapPage(@RequestParam Map<String, Object> map)throws Exception{
		log.debug("###### 맵 페이지 ######");
		
		List<Map<String, Object>> list = placeService.selectPlaceList(map);
		log.debug("###### list: " + list);
		
	    return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(value="/placeRankForm")
	public ModelAndView placeRankForm(@RequestParam Map<String, Object> map) throws Exception{
		log.debug("###### placeRankForm ######");
		
		ModelAndView mv = new ModelAndView("place/placeRankForm");
		
		return mv;
	} 
	
	@RequestMapping(value="/placeRank")
	public List<Map<String, Object>> placeRank(@RequestParam Map<String, Object> map) throws Exception{
		log.debug("###### placeRank ######");
		
		List<Map<String, Object>> placeRank = placeService.selectMonthlyPlaceRank(map);
		log.debug("placeRank: " + placeRank);
		
		return placeRank;
	}
	
	@RequestMapping(value="/placeSearch")
	public ModelAndView placeSearch(@RequestParam Map<String, Object> map) throws Exception{
		log.debug("###### placeSearch ######");
		
		ModelAndView mv = new ModelAndView("main/main");
		
		Map<String, Object> placeSearch = placeService.selectPlaceSearch(map);
		
		log.debug("placeSearch:" + placeSearch);
		
		mv.addObject("placeSearch", placeSearch);
		
		return mv;
	}
	
	@RequestMapping(value="/searchPlace")
	public ResponseEntity<List<Map<String, Object>>> searchPlace(@RequestParam Map<String, Object> map) throws Exception{
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		
		JSONObject jsonResult = new JSONObject();
		String searchLat = (String) map.get("lat");
	    String searchLng = (String) map.get("lng");
	    String category = (String) map.get("category");
	    
		String REST_KEY = "4c4f8b61dba3b485888845d0b1a0411d";
	    String url1 = "https://dapi.kakao.com/v2/local/search/category.json?"
	    		+"category_group_code=" + category // 카테고리
	    		+"&page=1"
	    		+"&size=15"
	    		+"&sort=accuracy"
	    		+"&x=" + searchLng //경도
	    		+"&y=" + searchLat //위도
	    		+"&radius=10000";

        URL url = new URL(url1);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        //conn.setRequestProperty("X-Requested-With", "curl");
        conn.setRequestProperty("Authorization", "KakaoAK " + REST_KEY);
        
        //request에 JSON data 준비
        conn.setDoOutput(true);
            
        Charset charset = Charset.forName("UTF-8");
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), charset));
        
        String line;
        StringBuilder response = new StringBuilder();
        while ((line = br.readLine()) != null) {
            response.append(line);
        }
        br.close();

        String responseString = response.toString();
        JSONParser parser = new JSONParser();
        //JSONArray jsonArray = null;
        	
        //jsonArray = (JSONArray) parser.parse(responseString);
        jsonResult = (JSONObject) parser.parse(responseString);
        
        // "documents" 배열 추출
        JSONArray documents = (JSONArray) jsonResult.get("documents");
        
        System.out.println(documents);
        
        for (int i = 0; i < documents.size(); i++) {
            JSONObject object = (JSONObject) documents.get(i);
            
            Map<String, Object> resultMap = new HashMap<String, Object>();
            
            String id = (String) object.get("id");
            String addr = (String) object.get("address_name");
            String name = (String) object.get("place_name");
            String type = (String) object.get("category_group_code");
            String tel = (String) object.get("phone");
            String lng = (String) object.get("x");
            String lat = (String) object.get("y");

            resultMap.put("id", id);
            resultMap.put("lng", lng);
            resultMap.put("lat", lat);
            resultMap.put("addr", addr);
            resultMap.put("name", name);
            resultMap.put("type", type);
            resultMap.put("tel", tel);
            
            // return시킬 List<Map> 변수를 만들고 매 회마다 add한다.
            result.add(resultMap);
            // 데이터가 없을 경우의 예외처리도 만들기
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
	}

}
