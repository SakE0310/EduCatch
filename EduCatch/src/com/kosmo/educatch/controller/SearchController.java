package com.kosmo.educatch.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.SearchService;
import com.kosmo.educatch.vo.SearchVO;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	Logger log = Logger.getLogger(SearchController.class);
	//메인페이지 이동
	@RequestMapping("searchMain")
	public ModelAndView searchMain() {
		log.info("search controller searchMain start >>> ");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("search/searchMain");
		log.info("search controller searchMain end >>> ");
		log.info("search controller searchMain mv >>> "+mv);
		return mv;
	}//end searchMain
	
	//지역/카테고리 팝업 선택
	@RequestMapping("areaPopup")
	public ModelAndView areaPopup(SearchVO param) {
		log.info("search controller areaPopup start >>> ");
		log.info("search controller areaPopup param >>> "+param);
		List<SearchVO> list = searchService.searchAreaList(param);
		ModelAndView mv = new ModelAndView();
		mv.addObject("areaList", list);
		mv.setViewName("search/searchArea_pop");
		
		log.info("search controller searchPopup list >>> "+list);
		log.info("search controller searchPopup end >>> ");
		log.info("search controller searchPopup mv >>> "+mv);
		return mv;
	}//end searchInsert
	
}//end controller
