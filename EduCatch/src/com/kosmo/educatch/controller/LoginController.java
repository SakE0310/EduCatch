package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.LoginService;

@Controller
public class LoginController {
	private static Logger log = Logger.getLogger(LoginController.class);
	

	@Autowired
	private LoginService loginService;
	
	
	//====로그인 페이지로 =======
	
	@RequestMapping("/login.ec")
	public ModelAndView listNotice( ) {
		log.info("NoticeController listNotice 시작 >>>");
		log.info("aaa");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/login");
		
		log.info("LoginController login 끝 >>>");
		return mav;
	
	}//end  of login.jsp
}

    // 로그인



	



