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
	

}
