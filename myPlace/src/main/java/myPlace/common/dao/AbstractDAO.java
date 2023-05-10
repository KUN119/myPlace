package myPlace.common.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractDAO {

	protected Log log = LogFactory.getLog(this.getClass());

	@Autowired
	private SqlSessionTemplate sqlSession;

	protected void printQueryId(String queryId) {
		if (log.isDebugEnabled()) {
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}

	public Object insert(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}

	public Object update(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}

	public Object delete(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}

	public Object selectOne(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}

	public Object selectOne(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}
	
	//페이징 할 경우 쓸 코드
//	@SuppressWarnings("unchecked")
//	public Object selectPagingList(String queryId, Object params) {
//		printQueryId(queryId);
//		Map<String, Object> map = (Map<String, Object>) params;
//
//		String strPageIndex = (String) map.get("PAGE_INDEX"); // 현제 페이지
//		String strPageRow = (String) map.get("PAGE_ROW"); // 페이지 당 표시될 게시들 수
//		int nPageIndex = 0;
//		int nPageRow = 10;
//
//		if (StringUtils.isEmpty(strPageIndex) == false) {
//			nPageIndex = Integer.parseInt(strPageIndex) - 1;
//		}
//		if (StringUtils.isEmpty(strPageRow) == false) {
//			nPageRow = Integer.parseInt(strPageRow);
//		}
//		map.put("START", (nPageIndex * nPageRow) + 1);
//		map.put("END", (nPageIndex * nPageRow) + nPageRow);
//
//		return sqlSession.selectList(queryId, map);
//	}
}
