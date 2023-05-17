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

	@Override
	public int selectBoardNum(String id) throws Exception {
		int BOARD_NUM = boardDAO.selectBoardNum(id);
		return BOARD_NUM;
	}

	@Override
	public  Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = boardDAO.selectBoardDetail(map);
		return resultMap;
		}
	
	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		boardDAO.deleteBoard(map);
	}
	
	@Override
	public Map<String, Object> openBoardUpdate(Map<String, Object> map) throws Exception{
		return boardDAO.openBoardUpdate(map);
	}
	
	@Override
	public void boardUpdate(Map<String, Object> map) throws Exception{
		boardDAO.boardUpdate(map);
	}
	
}
