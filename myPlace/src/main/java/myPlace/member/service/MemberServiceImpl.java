package myPlace.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import myPlace.member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;

	@Override
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		return memberDAO.selectId(map); 
	}

	@Override
	public String selectMemberId(String id) throws Exception {
		return memberDAO.selectMemberId(id);
	}

	@Override
	public String selectMemberEmail(String email) throws Exception {
		return memberDAO.selectMemberEmail(email);
	}

	@Override
	public String selectMemberPhone(String phone) throws Exception {
		return memberDAO.selectMemberPhone(phone);
	}

	@Override
	public void insertMember(Map<String, Object> joinData) throws Exception {
		memberDAO.insertMember(joinData);
	}
	

}
