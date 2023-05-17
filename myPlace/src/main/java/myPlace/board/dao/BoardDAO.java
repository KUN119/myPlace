package myPlace.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import myPlace.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("board.selectBoardList", map);
	}
	
	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("board.insertBoard", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("board.selectBoardDetail", map);
	}
	
	public void deleteBoard(Map<String, Object> map) throws Exception{
		update("board.deleteBoard", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> openBoardUpdate(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectList("board.openBoardUpdate", map);
	}
	
	public void boardUpdate(Map<String, Object> map) throws Exception{
		update("board.boardUpdate", map);
	}
	public int selectBoardNum(String id) throws Exception{
		return (int) selectOne("board.selectBoardNum", id);
	}
}
