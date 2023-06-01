package myPlace.main.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
      log.debug("###### 메인 페이지 map ######:" + map);
      ModelAndView mv = new ModelAndView("main/main");
      mv.addObject("test",map);
      
      return mv;
   }
	
	@RequestMapping(value = "/boardPlace", method = RequestMethod.POST)  
	@ResponseBody
	public List<Map<String, Object>> boardPlace(@RequestParam Map<String, Object> map)throws Exception{
		List<Map<String, Object>> boardList = new ArrayList<Map<String,Object>>();
		
		
		boardList = boardService.selectBoardList(map);
		
		// 결과 데이터 중 DATE타입의 데이터를 지정한 방식으로 포맷팅
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		for (Map<String, Object> boardDate : boardList) {
		    Object boardDataValue = boardDate.get("BOARD_DATE");
		    String formattedDate = dateFormat.format(boardDataValue);
		    boardDate.put("BOARD_DATE", formattedDate);
		}
	
		System.out.println(boardList);
		
		return boardList;
	}

	 @RequestMapping(value = "/boardCount", method = RequestMethod.POST)
	   @ResponseBody
	   public String boardCount(@RequestParam Map<String, Object> map) throws Exception {
		 log.debug(map);
		 
		 System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+map.get("BOARD_PLACE"));
		 
		 String boardCount = boardService.boardCount(map);
		 System.out.println(boardCount);
		 
		 return boardCount;
	 }
}