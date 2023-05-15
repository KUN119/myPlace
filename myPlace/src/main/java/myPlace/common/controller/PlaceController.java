package myPlace.common.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import myPlace.common.service.PlaceService;

@RestController
@RequiredArgsConstructor
public class PlaceController {
	
	Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "placeService")
	private PlaceService placeService;
	
	@SuppressWarnings("unchecked")
	@GetMapping("/api/load")
	public <T> ResponseEntity<T> insertPlace() {
		log.debug("###### api load ######");
		
		String result="";
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			URL url = new URL("https://api.odcloud.kr/api/15052408/v1/uddi:611c5470-ad94-49e8-8f72-973732c56304?page=2&perPage=10&serviceKey=oQxZdiXR8K8U%2BsFvOZJxW8bP%2FIs0tqBThPnNxNt0FJrjgOZXM537iVGIyUfCPX86eghuF4HLzRaQ7t4I5gfiPQ%3D%3D");
			HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
			urlConnection.setRequestProperty("Content-Type", "application/json");
			
			BufferedReader bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			
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
		return (ResponseEntity<T>) map;
	}
}