package com.kosmo.educatch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AcademyRequestController {
	
	@RequestMapping("/AcaReq")
	public ModelAndView getPage() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/comunity/AcademyRequest/acaRequest");
		
		return null;
	}
}
