package com.kosmo.educatch.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.LoginService;

@Controller
public class LoginController {
	private static Logger log = Logger.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;

	// ====로그인 페이지로 =======

	@RequestMapping("/login")
	public ModelAndView listNotice() {
		log.info("LoginController login 시작 >>>");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login/login");

		log.info("LoginController login 끝 >>>");
		return mav;

	}// end of login.jsp

//	// 로그인
//	@RequestMapping("/loginCheck")
//	public String loginCheck(@ModelAttribute MemberVO mbvo, Model model, HttpServletRequest req) {
//		log.info("loginCheck() >>>>");
//		String url = "";
//		String auth =  mbvo.getMauth();
//
//		// DB에 auth값이 1일 때
//		if (auth.equals("1")) {
//			MemberVO mvo = null;
//			mvo = new MemberVO();
//			String mid = mbvo.getMid();
//			String mpw = mbvo.getMpw();
			
	@RequestMapping("/joinCheckForm")
	   public ModelAndView joinCheckForm(){
	      log.info("joinCheckForm() start");
	      ModelAndView mav  = new ModelAndView();
	      mav.setViewName("member/join/memberButton");          
	      log.info("joinCheckForm() end");
	      return mav;
	   }// end of joinCheckForm()
		
			
}

