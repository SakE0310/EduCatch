package com.kosmo.educatch.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
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
	
	//area select함수
	//구를 선택하면 동 데이터를 가져오는 함수
//	@RequestMapping("searchAreaList")
//	public ModelAndView searchAreaList(SearchVO param) {
//		log.info("search controller searchAreaList start >>> ");
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("");
//		log.info("search controller searchAreaList mv >>> "+mv);
//		log.info("search controller searchAreaList end >>> ");
//		return mv;
//	}//end searchAreaList

	//지역/카테고리 팝업 선택
	@RequestMapping("searchPopup")
	public ModelAndView searchPopup(@RequestParam("search") String search
									,SearchVO param) {
		log.info("search controller searchPopup start >>> ");
		log.info("search controller searchPopup search >>> "+search);
		ModelAndView mv = new ModelAndView();
		if(search=="") {
			List<SearchVO> list = searchService.SearchAreaList(param);
			mv.addObject("areaList", list);
			mv.setViewName("search/searchArea_pop");
		}else {
			mv.addObject("search", "cate");
			mv.setViewName("search/searchCategory_pop");
		}
=======
<<<<<<< HEAD
<<<<<<< HEAD
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
	
	//area select함수
	//구를 선택하면 동 데이터를 가져오는 함수
//	@RequestMapping("searchAreaList")
//	public ModelAndView searchAreaList(SearchVO param) {
//		log.info("search controller searchAreaList start >>> ");
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("");
//		log.info("search controller searchAreaList mv >>> "+mv);
//		log.info("search controller searchAreaList end >>> ");
//		return mv;
//	}//end searchAreaList

	//지역/카테고리 팝업 선택
	@RequestMapping("searchPopup")
	public ModelAndView searchPopup(@RequestParam("search") String search
									,SearchVO param) {
		log.info("search controller searchPopup start >>> ");
		log.info("search controller searchPopup search >>> "+search);
		ModelAndView mv = new ModelAndView();
		if(search=="") {
			List<SearchVO> list = searchService.SearchAreaList(param);
			mv.addObject("areaList", list);
			mv.setViewName("search/searchArea_pop");
		}else {
			mv.addObject("search", "cate");
			mv.setViewName("search/searchCategory_pop");
		}
=======
=======
import org.springframework.web.bind.annotation.RequestParam;
>>>>>>> branch 'master' of https://github.com/SakE0310/EduCatch
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
	
<<<<<<< HEAD
	//area select함수
	//구를 선택하면 동 데이터를 가져오는 함수
//	@RequestMapping("searchAreaList")
//	public ModelAndView searchAreaList(SearchVO param) {
//		log.info("search controller searchAreaList start >>> ");
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("");
//		log.info("search controller searchAreaList mv >>> "+mv);
//		log.info("search controller searchAreaList end >>> ");
//		return mv;
//	}//end searchAreaList

	//지역/카테고리 팝업 선택
	@RequestMapping("searchPopup")
	public ModelAndView searchPopup(@RequestParam("search") String search
									,SearchVO param) {
		log.info("search controller searchPopup start >>> ");
		log.info("search controller searchPopup search >>> "+search);
		ModelAndView mv = new ModelAndView();
		if(search=="") {
			List<SearchVO> list = searchService.SearchAreaList(param);
			mv.addObject("areaList", list);
			mv.setViewName("search/searchArea_pop");
		}else {
			mv.addObject("search", "cate");
			mv.setViewName("search/searchCategory_pop");
		}
=======
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
>>>>>>> branch 'master' of https://github.com/SakE0310/EduCatch
>>>>>>> branch 'master' of https://github.com/SakE0310/EduCatch.git
		log.info("search controller searchPopup end >>> ");
		log.info("search controller searchPopup mv >>> "+mv);
		return mv;
	}//end searchInsert
	
}//end controller
