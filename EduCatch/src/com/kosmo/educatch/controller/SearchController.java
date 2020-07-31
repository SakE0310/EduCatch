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
	@RequestMapping("searchAreaList")
	public ModelAndView searchAreaList(SearchVO param) {
		log.info("search controller searchPopup start >>> ");
		log.info("search controller searchPopup param >>> "+param);
		List<SearchVO> list = searchService.searchAreaList(param);
		ModelAndView mv = new ModelAndView();
		mv.addObject("searchAreaList", list);
		mv.setViewName("search/searchArea_pop");
		log.info("search controller searchAreaList list >>> "+list);
		log.info("search controller searchAreaList mv >>> "+mv);
		log.info("search controller searchAreaList end >>> ");
		return mv;
	}//end searchAreaList
}//end controller
