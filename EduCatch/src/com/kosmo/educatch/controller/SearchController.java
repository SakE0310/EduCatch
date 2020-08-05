package com.kosmo.educatch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.SearchService;
import com.kosmo.educatch.vo.SearchVO;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	Logger log = Logger.getLogger(SearchController.class);
	
	//Search메인페이지 이동
	@RequestMapping("searchMain")
	public ModelAndView searchMain() {
		log.info("search controller searchMain start >>> ");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("search/searchMain");
		log.info("search controller searchMain mv >>> "+mv);
		log.info("search controller searchMain end >>> ");
		return mv;
	}//end searchMain
	
	//선택완료버튼 클릭후 메인으로 돌아오는 기능
//	@ResponseBody
//	@RequestMapping("searchCateList")
//	public Map<String,List<SearchVO>>searchCateList(SearchVO param, 
//			HttpServletRequest req) {
//		log.info("search controller searchCateList start >>> ");
//		String cmajor = req.getParameter("cmajor");
//		param.setCmajor(cmajor);
//		log.info("search controller searchCateList cmajor >>> "+cmajor);
//		log.info("search controller searchCateList param >>> "+param);
//		List<SearchVO> list = searchService.selectCate(param);
//		Map<String,List<SearchVO>>map = new HashMap<String,List<SearchVO>>();
//		map.put("minorList",list);
//		log.info("search controller searchCateList list >>> "+list);
//		log.info("search controller searchCateList map >>> "+map);
//		log.info("search controller searchCateList end >>> ");
//		return map;
//	}
//	
//	@RequestMapping("searchMainAgain")
//	public ModelAndView searchMainAgain(SearchVO param,
//										HttpServletRequest req) {
//		log.info("search controller searchMain_again start >>> ");
//		String city = req.getParameter("city");
//		String cmajor = req.getParameter("cmajor");
//		log.info("search controller searchMain_again city >>> "+city);
//		log.info("search controller searchMain_again cmajor >>> "+cmajor);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("cityForm", city);
//		mv.addObject("cateForm", cmajor);
//		mv.setViewName("search/searchMain");
//		log.info("search controller searchMain_again mv >>> "+mv);
//		log.info("search controller searchMain_again end >>> ");
//		return mv;
//	}//end searchMain
//	
//	//지역select
//	@ResponseBody
//	@RequestMapping("searchAreaList")
//	public Map<String,List<SearchVO>>searchAreaList(HttpServletRequest req) {
//		log.info("search controller searchAreaList start >>> ");
//		String district = req.getParameter("district");
//		log.info("search controller searchAreaList district >>> "+district);
//		List<SearchVO> list = searchService.selectArea(district);
//		Map<String,List<SearchVO>>map = new HashMap<String,List<SearchVO>>();
//		map.put("cityList",list);
//		log.info("search controller searchAreaList list >>> "+list);
//		log.info("search controller searchAreaList map >>> "+map);
//		log.info("search controller searchAreaList end >>> ");
//		return map;
//	}//end searchAreaList
//	
////	@RequestMapping("selectComplete")
////	public ModelAndView selectComplete() {
////		log.info("search controller selectComplete start >>> ");
////		
////		ModelAndView mv = new ModelAndView();
////		log.info("search controller selectComplete mv >>> "+mv);
////		log.info("search controller selectComplete end >>> ");
////		return mv;
////	}//end selectComplete
//	@ResponseBody
//	@RequestMapping("searchCateList")
//	public Map<String,List<SearchVO>>searchCateList(SearchVO param, 
//													HttpServletRequest req) {
//		log.info("search controller searchCateList start >>> ");
//		String cmajor = req.getParameter("cmajor");
//		param.setCmajor(cmajor);
//		log.info("search controller searchCateList cmajor >>> "+cmajor);
//		log.info("search controller searchCateList param >>> "+param);
//		List<SearchVO> list = searchService.selectCate(param);
//		Map<String,List<SearchVO>>map = new HashMap<String,List<SearchVO>>();
//		map.put("minorList",list);
//		log.info("search controller searchCateList list >>> "+list);
//		log.info("search controller searchCateList map >>> "+map);
//		log.info("search controller searchCateList end >>> ");
//		return map;
//	}

	//지역 대분류
	@ResponseBody
	@RequestMapping("getDistrict")
	public Map<String,List<SearchVO>>getDistrict(SearchVO param){
		log.info("search controller getDistrict start >>> ");
		log.info("search controller getDistrict param >>> "+param);
		Map<String,List<SearchVO>>map = new HashMap<String,List<SearchVO>>();
		List<SearchVO>list = searchService.getDistrict(param);
		map.put("districtList",list);
		log.info("search controller getDistrict list >>> "+list);
		log.info("search controller getDistrict map >>> "+map);
		log.info("search controller getDistrict end >>> ");
		return map;
	}//getDistrict
	
	//지역 소분류
	@ResponseBody
	@RequestMapping("getCity")
	public Map<String,List<SearchVO>>getCity(SearchVO param,
											HttpServletRequest req){
		log.info("search controller getCity start >>> ");
		String district = req.getParameter("district");
		log.info("search controller getCity district >>> "+district);
		Map<String,List<SearchVO>>map = new HashMap<String,List<SearchVO>>();
		List<SearchVO>list = searchService.getCity(param);
		map.put("cityList",list);
		log.info("search controller getCity list >>> "+list);
		log.info("search controller getCity map >>> "+map);
		log.info("search controller getCity end >>> ");
		return map;
	}//getCity
	
}//end controller
