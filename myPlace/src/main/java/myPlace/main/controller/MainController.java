package myPlace.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import myPlace.board.service.BoardService;

@RestController
public class MainController {
	
//	@Resource(name="mainService")
//	private MainService mainService;
	@Resource(name="boardService")
	private BoardService boardService;
	
	Log log = LogFactory.getLog(this.getClass());
	
	@RequestMapping(value="/mainPage")
	public ModelAndView mainPage(@RequestParam Map<String, Object> map)throws Exception{
		log.debug("###### 메인 페이지 ######");
		ModelAndView mv = new ModelAndView("main/main");
		
        List<Map<String,Object>> list = boardService.selectBoardList(map);
        
        mv.addObject("list",list);
		return mv;
	} 

}
