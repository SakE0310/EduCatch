package com.kosmo.educatch.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.LoginService;
import com.kosmo.educatch.vo.MemberVO;

@Controller
public class LoginController {
	
	private Logger log = LoggerManager.getInstance().getLogger(LoginController.class);
	@Autowired
	private LoginService loginService;

	// =================== 로그인 화면으로  =================

	@RequestMapping("/login.ec")
	public ModelAndView listNotice() {
		log.info("LoginController login 시작 >>>");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login/login");

		log.info("LoginController login 끝 >>>");
		return mav;

	}// end of login.jsp

	
	
//	// ================ 로그인 처리 ========================
//	@
//	RequestMapping("/loginCheck")
//	public String loginCheck(@ModelAttribute MemberVO mvo, HttpSession session) {
//		boolean result = LoginService.logincheck(mvo, session);
//	}
//		log.info("loginCheck() >>>>");
//		
	
	
	
	// ====================회원가입 폼으로 ==========================
	
	@RequestMapping("/joinCheckForm")
	   public ModelAndView joinCheckForm(){
	      log.info("joinCheckForm() start");
	      ModelAndView mav  = new ModelAndView();
	      mav.setViewName("member/join/memberButton");          
	      log.info("joinCheckForm() end");
	      return mav;
	   }// end of joinCheckForm()
	
	
	// =======================비밀번호 찾기==========================
	
	@RequestMapping("/pwReset.ec")
		public ModelAndView pwReset(){
			log.info("pwRest() start");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("member/login/pwReset");
			 log.info("pwReset() end");
			return mav;
		
	}// end of pwReset(
		
			
}

