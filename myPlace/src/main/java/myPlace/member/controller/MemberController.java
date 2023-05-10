package myPlace.member.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
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
		ModelAndView mv = new ModelAndView("loginForm");
		return mv;
	}

}
