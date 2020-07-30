package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	
	private static Logger log=Logger.getLogger(ReviewController.class);
	
	
	


	//전체조회
	@RequestMapping("listReview")
	public ModelAndView listReview() {
		
		log.info("ReviewController listReview >>> 호출성공");

		ModelAndView mav=new ModelAndView();
		mav.setViewName("comunity/reviewBoard/reviewBoard");
		
		log.info("mav >>> "+mav);
		log.info("ReviewController listReview >>> 끝");
		
		return mav;
	}
	
	

	
}
