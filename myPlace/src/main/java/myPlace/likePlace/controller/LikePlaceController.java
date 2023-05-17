package myPlace.likePlace.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import myPlace.likePlace.service.LikePlaceService;

@RestController
public class LikePlaceController {
	
	@Resource(name="likePlaceService")
	private LikePlaceService likePlaceService;

	@RequestMapping(value="/likePlaceList")
    public List<Map<String, Object>> LikePlaceList(@RequestParam Map<String, Object>map) throws Exception{
		System.out.println("오기는 함");
        List<Map<String,Object>> likePlaceList = likePlaceService.selectLikePlaceList(map);
        
        System.out.println(likePlaceList);
        
        return likePlaceList;
    }
}
