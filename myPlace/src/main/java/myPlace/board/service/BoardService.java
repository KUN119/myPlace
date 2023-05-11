package myPlace.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
	
	void insertBoard(Map<String, Object> map) throws Exception;
}
