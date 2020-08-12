package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.LoggerManager;

@Controller
public class MyPageController {
	private Logger log = LoggerManager.getInstance().getLogger(MyPageController.class);

	//마이페이지 조회
	@RequestMapping("listMyPage.ec")
	public ModelAndView listMyPage() {
		log.info("MyPageController listMyPage 시작 >>>");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/mypageMain");
		
		log.info("MyPageController listMyPage 끝 >>>");
		return mav;
	}
}
