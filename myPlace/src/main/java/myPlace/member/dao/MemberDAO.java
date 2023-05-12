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

	// 아이디 중복 검사
		public String selectMemberId(String id) throws Exception {
			return (String) selectOne("join.selectMemberId", id);
		}
		
		// 이메일 중복 검사
		public String selectMemberEmail(String email) throws Exception {
			return (String) selectOne("join.selectMemberEmail", email);
		}
		
		// 전화번호 중복 검사
		public String selectMemberPhone(String Phone) throws Exception {
			return (String) selectOne("join.selectMemberPhone", Phone);
		}
		
		// 회원 데이터 등록
		public void insertMember(Map<String, Object> joinData) throws Exception{
			insert("join.insertMember", joinData);
		}
}
