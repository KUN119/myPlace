package myPlace.member.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import myPlace.member.service.MemberService;

@RestController
public class MemberController {
	
	Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping(value="/loginForm")
	public ModelAndView loginForm(@RequestParam Map<String, Object>map) throws Exception{
		log.debug("###### 로그인 폼 ######");
		ModelAndView mv = new ModelAndView("member/loginForm");
		return mv;
	}
	
	@RequestMapping(value="/loginCheck")
	public String loginCheck(@RequestParam Map<String, Object> map)throws Exception{
		log.debug("###### 로그인 체크 ######");
		
		String result = "";
		
		Map<String, Object> member = memberService.selectId(map);
		log.debug("아이디 : " + (String) map.get("MEM_ID"));
		
		if(!member.get("MEM_ID").equals(map.get("MEM_ID"))) {
			result = "idFail";
		} else if(!member.get("MEM_PW").equals(map.get("MEM_PW"))) {
			result = "pwFail";
		} else {
			result = "success";
		}
		log.debug("reuslt:" + result);
		return result;
	}
	
	// 회원가입 페이지
   @RequestMapping(value = "/joinForm", method = {RequestMethod.GET})
   public ModelAndView joinForm(@RequestParam Map<String, Object> map) throws Exception{
      ModelAndView mv = new ModelAndView("member/joinForm");
      
      return mv;
   }
   
   // 회원가입 기능
   // joinForm.jsp => controller.joinSuccess() => Service =>DAO => SQL => DB
   // 
}
