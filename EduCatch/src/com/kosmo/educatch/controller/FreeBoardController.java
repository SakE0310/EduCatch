package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class FreeBoardController {
	private static Logger log=
			Logger.getLogger(FreeBoardController.class);
	private static final String CONTEXT_PATH="board";
	
	@RequestMapping("/freeboard")
	public ModelAndView freeBoard() {
		log.info("freeBoard함수 진입>>>");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/freeboard");
		
		log.info("mav>>>"+mav);
		log.info("freeBoard함수 끝>>>");
		return mav;
		
	}
}
