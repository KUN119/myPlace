package myPlace;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;


@RestController
public class MainController {
	
	
	Log log = LogFactory.getLog(this.getClass());

	@GetMapping(value = "/main")
	public ModelAndView main(@RequestParam Map<String, Object> map) throws Exception {
		log.debug("###### myPlace 메인페이지 ######");
		ModelAndView mv = new ModelAndView("member/main");
		return mv;
	}
	
	
}
