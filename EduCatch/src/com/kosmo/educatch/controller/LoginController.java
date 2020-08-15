package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.LoginService;
import com.kosmo.educatch.vo.AMemberVO;
import com.kosmo.educatch.vo.MemberVO;

@Controller
public class LoginController {
	
	private Logger log = LoggerManager.getInstance().getLogger(LoginController.class);
	@Autowired
	private LoginService loginService;

	// =================== 로그인 화면으로  =================

	@RequestMapping(value = "/login.ec", method = RequestMethod.GET)
	public ModelAndView listNotice() {
		log.info("LoginController login 시작 >>>");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login/login");

		log.info("LoginController login 끝 >>>");
		return mav;

	}// end of login.jsp

	
	
	// ================ 로그인 처리 ========================
	
	@RequestMapping("/loginCheck")
	public ModelAndView  loginCheck(@ModelAttribute MemberVO param) {
		log.info("LoginController loginCheck 시작 >>>");
		ModelAndView mav = new ModelAndView();
		
		MemberVO memberInfo = loginService.loginCheck(param);
		mav.addObject("MemberVO", memberInfo);
		mav.setViewName("member/login/result");
				
		log.info("loginCheck() >>>>");
		return mav;
		
	}
		
		
	// ====================회원가입 폼으로 ==========================
	
	@RequestMapping("/joinCheckForm")
	   public ModelAndView joinCheckForm(){
	      log.info("joinCheckForm() start");
	      ModelAndView mav  = new ModelAndView();
	      mav.setViewName("member/join/agreeMember");          
	      log.info("joinCheckForm() end");
	      return mav;
	   }// end of joinCheckForm()
	// ==================== 학원가입 폼으로 ========================
	@RequestMapping("/academyJoinForm")
	   public ModelAndView academyJoinForm(){
	      log.info("joinCheckForm() start");
	      ModelAndView mav  = new ModelAndView();
	      mav.setViewName("member/join/agreeAmember");          
	      log.info("academyJoinForm() end");
	      return mav;
	   }// end of academyJoinForm()
	
	
	// =======================비밀번호 찾기==========================
	@RequestMapping(value = "/pwReset.ec", method = RequestMethod.GET)
	public ModelAndView pwReset() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login/pwReset");

		log.info("LoginController login 끝 >>>");
		return mav;

	}// end of login.jsp

	@RequestMapping("/passwordReset.ec")
	public ModelAndView pwReset(@ModelAttribute MemberVO param){
		log.info("pwRest() start " + param.getMid());
		ModelAndView mav = new ModelAndView();
		
		String complete = loginService.passwordReset(param);
		
		mav.addObject("resultMsg",complete);
		mav.setViewName("member/login/pwResultPage");
		log.info("pwReset() end");
		return mav;
	
	}// end of pwReset(
	
	/*
	 * 비밀번호 변경 후 Callback
	 * 이메일 URL통해 들어온 경우 비밀번호 변경 관련 Page 노출
	 * LoginVO(loginID)를 parameter로 받아와 jsp에 전송
	 * jsp에서  변경'될' 비밀번호를 받아와 API호출
	 */
	@RequestMapping("/passwdChangePage")
	public ModelAndView passwordChangePage(@ModelAttribute MemberVO param) {
		ModelAndView mav = new ModelAndView();
		log.info("URL Parameter : " + param.getMid());
		mav.addObject("MemberVO",param);
		mav.setViewName("member/login/pwChange");
		return mav;
	}
	
	@RequestMapping("/passwdChange")
	public ModelAndView passwordChange(@ModelAttribute MemberVO param) {
		ModelAndView result = new ModelAndView();
		log.info("change Password ID : " + param.getMid() + " password : " + param.getMpw());
		String changeCheck = loginService.passwordChange(param);
		result.addObject("resultMsg",changeCheck);
		result.setViewName("member/login/pwResultPage");
		
		return result;
	}
		
	
}

