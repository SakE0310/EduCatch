package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	private final String FILE_PATH = "search/";
	Logger log = Logger.getLogger(SearchController.class);
	
	@RequestMapping("searchMain")
	public ModelAndView searchMain() {
		log.info("search controller searchMain start >>> ");
		ModelAndView mv = new ModelAndView();
		mv.setViewName(FILE_PATH+"searchMain");
		log.info("search controller searchMain end >>> ");
		log.info("search controller searchMain mv >>> "+mv);
		return mv;
	}//end searchMain
	
	public ModelAndView searchInsert() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}//end searchInsert
}//end controller
