package myPlace.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
	
	void insertBoard(Map<String, Object> map) throws Exception;
	// MEM_ID를 이용하여 가장 최근에 작성한 게시물의 BOARD_NUM을 조회
	public int selectBoardNum(String id) throws Exception;

	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;
	
	void deleteBoard(Map<String, Object> map) throws Exception;
	
	void boardUpdate(Map<String, Object> map) throws Exception;
}
