package myPlace.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import myPlace.board.service.BoardService;
import myPlace.member.service.MemberService;

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
		
		return mv;
	}
	
	@RequestMapping(value="/insertBoard")
	public ModelAndView insertBoard(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/main/main");
		
		boardService.insertBoard(map);
		
		return mv;
	}
	
	@RequestMapping(value="/boardDetail")
	public ModelAndView BoardDetail(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("/board/boardDetail");
		Map<String, Object> map2 = boardService.selectBoardDetail(map);
		mv.addObject("map2",map2);
		return mv;
	}
	
	@RequestMapping(value="/boardDelete")
	public ModelAndView BoardDelete(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/mainPage");
		
		boardService.deleteBoard(map);
		
		return mv;
	}
	
	@RequestMapping(value="openBoardUpdate.do")
	public ModelAndView openBoardUpdate(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("/board/boardUpdate");
		
		Map<String,Object> map2 = boardService.selectBoardDetail(map);
		mv.addObject("map2", map2);
		
		return mv;
	}
	
	@RequestMapping(value="boardUpdate")
	public ModelAndView boardUpdate(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/boardDetail");
		
		boardService.boardUpdate(map);
		mv.addObject(map);
		return mv;
	}
}