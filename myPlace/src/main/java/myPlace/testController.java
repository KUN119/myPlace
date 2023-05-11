package myPlace;

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
public class testController {
	
	Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="memberService")
	private MemberService memberService;

	
	/*
	 * // 회원가입 페이지
	 * 
	 * @RequestMapping(value = "/main", method = {RequestMethod.GET}) public
	 * ModelAndView joinForm(@RequestParam Map<String, Object> map) throws
	 * Exception{ ModelAndView mv = new ModelAndView("member/main");
	 * 
	 * return mv; }
	 */
   
   // 회원가입 기능
   // joinForm.jsp => controller.joinSuccess() => Service =>DAO => SQL => DB
   // 
}
