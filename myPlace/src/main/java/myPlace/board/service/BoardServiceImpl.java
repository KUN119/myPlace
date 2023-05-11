package myPlace.board.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import myPlace.board.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return boardDAO.selectBoardList(map);
	}
	
	@Override
	public void insertBoard(Map<String, Object> map) throws Exception {
		boardDAO.insertBoard(map);
	}
	
}
