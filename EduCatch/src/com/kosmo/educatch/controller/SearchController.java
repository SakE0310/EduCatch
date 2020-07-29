package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("searchMain")
public class SearchController {
	private final String FILE_PATH = "search/";
	Logger log = Logger.getLogger(SearchController.class);
	
	//�п��˻� ���ΰ���
	public ModelAndView searchMain() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName(FILE_PATH+"searchMain");
		return mv;
	}//end searchMain
	
	//����/ī�װ� �Է�
	public ModelAndView searchInsert() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}//end searchInsert
}//end controller
