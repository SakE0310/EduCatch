package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AcademyRequestController {
	
	Logger log = Logger.getLogger(AcademyRequestController.class);
	
	@RequestMapping("/AcaReq")
	public ModelAndView getPage() {
		log.info("AcademyRequestController AcaReq >>> ");
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("community/AcademyRequest/acaRequest");
		
		return mv;
	}
}
