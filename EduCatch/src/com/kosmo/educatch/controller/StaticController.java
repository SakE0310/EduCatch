package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StaticController {
	Logger log = Logger.getLogger(StaticController.class);
	
	// 통계페이지 접근
	@RequestMapping("statics")
	public ModelAndView getChart() {
		log.info("StaticController getChart() 진입 >>> ");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("statics/statics");
		log.info("StaticController getChart() 종료 >>> ");
		
		return mv;
	}
}
