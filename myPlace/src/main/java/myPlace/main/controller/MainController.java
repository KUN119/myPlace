package myPlace.main.controller;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {
	
//	@Resource(name="mainService")
//	private MainService mainService;
	
	Log log = LogFactory.getLog(this.getClass());
	
	@RequestMapping(value="/mainPage")
	public ModelAndView mainPage(@RequestParam Map<String, Object> map)throws Exception{
		log.debug("###### 메인 페이지 ######");
		ModelAndView mv = new ModelAndView("main/main");
		return mv;
	}

}
