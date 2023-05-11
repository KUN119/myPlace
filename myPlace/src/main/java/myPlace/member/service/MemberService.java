package myPlace.member.service;

import java.util.Map;

public interface MemberService {
	
	Map<String, Object> selectId(Map<String, Object> map) throws Exception;
	
	
	/* @@@@@@@@@@@@@@@@@@@ 회원가입 관련 @@@@@@@@@@@@@@@@@@@ */
	
	/* 아이디 중복 검사 */
	String selectMemberId(String id) throws Exception;

	/* 이메일 중복 검사 */
	String selectMemberEmail(String email) throws Exception;
	
	/* 전화번호 중복 검사 */
	String selectMemberPhone(String phone) throws Exception;
	
	/* 회원 데이터 등록 */
	public void insertMember(Map<String, Object> joinData) throws Exception; // 이메일 회원가입
	
}
