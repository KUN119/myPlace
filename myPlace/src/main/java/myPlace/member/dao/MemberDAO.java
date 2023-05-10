package myPlace.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import myPlace.common.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO{
	
	// 로그인 체크
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		System.out.println("selectId : " + map);
		return (Map<String, Object>) selectOne("member.selectMemberId", map);
		// 이메일에 해당하는 회원정보를 가져옴
	}

}
