package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	private static Logger log = Logger.getLogger(LoginController.class);
	

	//@AutiWired
	//@private LoginService loginservice
	
	
	//공지사항 게시판 목록 조회
	@RequestMapping("/login.ec")
	public ModelAndView listNotice( ) {
		log.info("NoticeController listNotice 시작 >>>");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/login");
		
		log.info("LoginController login 끝 >>>");
		return mav;
	}
}

	



