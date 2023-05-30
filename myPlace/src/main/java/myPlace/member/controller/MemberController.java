package myPlace.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import myPlace.likePlace.service.LikePlaceService;
import myPlace.member.service.MemberService;

@RestController
public class MemberController {
	
	Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name="likePlaceService")
	private LikePlaceService likePlaceService;
	
	@RequestMapping(value="/loginForm")
	public ModelAndView loginForm(@RequestParam Map<String, Object>map) throws Exception{
		log.debug("###### 로그인 폼 ######");
		ModelAndView mv = new ModelAndView("member/loginForm");
		return mv;
	}
	
	@RequestMapping(value="/loginCheck")
	public String loginCheck(@RequestParam Map<String, Object> map, HttpSession session)throws Exception{
		log.debug("###### 로그인 체크 ######");
		
		String result = "";
		// 리스트를 저장할 ArrayList 객체를 생성
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> member = memberService.selectId(map);
		// likePlaceService.selectLikePlace(map) 메서드를 호출하여 데이터를 가져와 리스트에 저장
		list = likePlaceService.selectLikePlace(map);

		// ObjectMapper 인스턴스를 생성 (java객체를 json으로 처리 반대도 가능)
		// jsonList 변수를 선언하고 초기값을 null로 설정
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonList = null;
		
		// ObjectMapper의 writeValueAsString() 메서드를 사용하여 리스트를 JSON 문자열로 변환하고, 그 결과를 jsonList 변수에 저장
		jsonList = objectMapper.writeValueAsString(list);
		
		log.debug("아이디 : " + (String) map.get("MEM_ID"));
		
		// 회원 정보가 존재하지 않을 경우
		if(member == null) {
			result = "idFail";
		// 아이디 일치 확인
		}else if(!member.get("MEM_ID").equals(map.get("MEM_ID"))) {
			result = "idFail";
		// 비밀번호 일치 확인
		} else if(!member.get("MEM_PW").equals(map.get("MEM_PW"))) {
			result = "pwFail";
		} else {
			result = "success";
			
			// 세션 부여
			session.setAttribute("MEM_ID", member.get("MEM_ID"));
			session.setAttribute("MEM_NAME", member.get("MEM_NAME"));
			session.setAttribute("PLACE_LIST", jsonList);
		}
		log.debug("reuslt:" + result);
		return result;
	}
	
	@RequestMapping(value="/logout")
	public String logout(@RequestParam Map<String, Object> memId, HttpSession session) throws Exception{
		log.debug("###### 로그아웃 ######");
		
		session.invalidate();
		
		return "로그아웃 성공";
	}
	
	// 회원가입 페이지
	@RequestMapping(value = "/joinForm", method = {RequestMethod.GET})
	public ModelAndView joinForm(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("member/joinForm");
		
		return mv;
   }
   
// 회원가입 기능
   @RequestMapping(value = "/joinSuccess")
   public String joinSuccess(@RequestParam Map<String, Object> param) throws Exception{
      String result = "";
      
      String MEM_ID = (String) param.get("MEM_ID");
      String MEM_EMAIL = (String) param.get("MEM_EMAIL");
      String MEM_PHONE = (String) param.get("MEM_PHONE");
      
      String verifyId = memberService.selectMemberId(MEM_ID);
      String verifyEmail = memberService.selectMemberEmail(MEM_EMAIL);
      String verifyPhone = memberService.selectMemberPhone(MEM_PHONE);
      
      // 아이디 중복 확인
      if(verifyId != null) {
    	  System.out.println("아이디 중복");
    	  result = "1";
      }else if(verifyEmail != null) {
    	  System.out.println("이메일 중복");
    	  result = "2";
      }else if(verifyPhone != null) {
    	  System.out.println("전화번호 중복");
    	  result = "3";
      }else {
    	  result = "0"; // 회원가입 성공
    	  memberService.insertMember(param); // db에 회원데이터 등록
      }
      
      return result;
   }
}