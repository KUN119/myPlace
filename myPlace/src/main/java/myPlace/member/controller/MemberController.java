package myPlace.member.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import myPlace.member.service.MemberService;

@RestController
public class MemberController {

	@Resource(name ="memberService")
	private MemberService memberService;
	
	// 회원가입 페이지
	@RequestMapping(value = "/joinForm.mp", method = {RequestMethod.GET})
	public ModelAndView joinForm(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("member/joinForm");
		
		return mv;
	}
}
