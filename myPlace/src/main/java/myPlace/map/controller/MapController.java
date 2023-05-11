package myPlace.map.controller;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MapController {
	
	Log log = LogFactory.getLog(this.getClass());
	
	@RequestMapping(value="/map")
	public ModelAndView mapPage(@RequestParam Map<String, Object> map)throws Exception{
		log.debug("###### 맵 페이지 ######");
		ModelAndView mv = new ModelAndView("map/map");
		return mv;
	}

}
