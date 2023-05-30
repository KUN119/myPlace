package myPlace.board.controller;

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
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	Log log = LogFactory.getLog(this.getClass());
	
	@RequestMapping(value="/boardList")
    public ModelAndView BoardList(@RequestParam Map<String, Object>map) throws Exception{
        log.debug("###### 게시판 폼 ######");
        ModelAndView mv = new ModelAndView("board/boardList");
        
        List<Map<String,Object>> list = boardService.selectBoardList(map);
        
        mv.addObject("list",list);
        return mv;
    }
	
		@RequestMapping(value="/boardWrite")
		public ModelAndView BoardWrite(@RequestParam Map<String, Object> map) throws Exception{
			ModelAndView mv = new ModelAndView("/board/boardWrite");
			
			mv.addObject("map",map);
			
			return mv;
		}
	
	// 게시글 작성 메서드
	@RequestMapping(value="/insertBoard")
	public int insertBoard(@RequestParam Map<String, Object> map) throws Exception{
		
		boardService.insertBoard(map);
		
		// 방금 입력한 게시물의 BoardNum을 조회
		int BOARD_NUM = boardService.selectBoardNum((String) map.get("BOARD_WRITER"));
		
		return BOARD_NUM ;
	}

	@RequestMapping(value="/boardDetail")
	public ModelAndView BoardDetail(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("/board/boardDetail");
		Map<String, Object> map2 = boardService.selectBoardDetail(map);
		
		System.out.println(map.get("BOARD_CONTENT"));
		
		mv.addObject("map2",map2);
		mv.addObject("test1",map);
		
		System.out.println(map.get("BOARD_TITLE"));
		
		return mv;
	}
	
	@RequestMapping(value="/boardDelete")
	public ModelAndView BoardDelete(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/mainPage");
		
		boardService.deleteBoard(map);
		
		return mv;
	}
	
	@RequestMapping(value="/openBoardUpdate")
	public ModelAndView openBoardUpdate(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("/board/boardUpdate");
		
		Map<String,Object> map2 = boardService.selectBoardDetail(map);
		mv.addObject("map2", map2);
		
		return mv;
	}
	@RequestMapping(value="/boardUpdate")
	public ModelAndView boardUpdate(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/boardDetail");
		log.debug("map: " + map);
		mv.addObject("BOARD_NUM", map.get("BOARD_NUM"));
		mv.addObject("BOARD_PLACE",map.get("placeNum"));
		mv.addObject("AA",map.get("AA"));
		mv.addObject("currentPage",map.get("CC"));
		boardService.boardUpdate(map);
		return mv;
	}
}