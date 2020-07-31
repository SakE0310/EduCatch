package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConsultController {
	
private static Logger log=Logger.getLogger(ReviewController.class);
	
	
	


	//전체조회
	@RequestMapping("listConsult")
	public ModelAndView listConsult() {
		
		log.info("ConsultController listConsult >>> 호출성공");

		ModelAndView mav=new ModelAndView();
		mav.setViewName("comunity/consultBoard/consultBoard");
		
		log.info("mav >>> "+mav);
		log.info("ConsultController listConsult >>> 끝");
		
		return mav;
	}

}
