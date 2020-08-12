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
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.SearchVO;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	Logger log = Logger.getLogger(SearchController.class);
	
	//검색페이지 이동
	@RequestMapping("searchMain")
	public ModelAndView searchMain() {
		log.info("search controller searchMain start >>> ");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("search/searchMain");
		log.info("search controller searchMain mv >>> "+mv);
		log.info("search controller searchMain end >>> ");
		return mv;
	}//end searchMain
	
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
	
	//학원리스트 받아오기
	@ResponseBody
	@RequestMapping("getAcaList")
	public Map<String,List<AcademyVO>>getAcaList(AcademyVO param,
											     HttpServletRequest req){
		log.info("search controller getAcaList start >>> ");
		log.info("search controller getAcaList param >>> "+param);
		
		String district = req.getParameter("district");
		String city = req.getParameter("city");
		String cmajor = req.getParameter("cmajor");
		String cminor = req.getParameter("cminor");
		String curPage = "1";
		
		String[] cityArr = city.split(" ");
		String cityStr = cityArr[0];
		String cminorAdd = cminor+" "+"split";
		log.info("search controller getAcaList cminorAdd >>> "+cminorAdd);
		String[] cminorArr = cminorAdd.split(" ");
		//언어  //국어
		log.info("search controller getAcaList cminorArr[0] >>> "+cminorArr[0]);
		//전체
		log.info("search controller getAcaList cminorArr[1] >>> "+cminorArr[1]);
		
		if(cminorArr[1].equals("전체")) {
			String cminorStr = cminorArr[1]; //전체
			param.setCminor(cminorStr);
			log.info("search controller getAcaList cminor >>> "+cminorStr);
		}else {
			String cminorStr = cminorArr[0]; //일본어
			param.setCminor(cminorStr);
			log.info("search controller getAcaList cminor >>> "+cminorStr);
		}
		
		param.setDistrict(district);
		param.setCity(cityStr);
		param.setCmajor(cmajor);
		
		log.info("search controller getAcaList param.getDistrict() >>> "+param.getDistrict());
		log.info("search controller getAcaList param.getCity() >>> "+param.getCity());
		log.info("search controller getAcaList param.getCmajor() >>> "+param.getCmajor());
		log.info("search controller getAcaList param.getCminor() >>> "+param.getCminor());
		
		Map<String,List<AcademyVO>>map = new HashMap<String,List<AcademyVO>>();
		List<AcademyVO>list = searchService.getAcaList(param);
		map.put("acaList",list);
		log.info("search controller getAcaList list >>> "+list);
		log.info("search controller getAcaList map >>> "+map);
		log.info("search controller getAcaList end >>> ");
		return map;
	}//getAcaList
	
	
}//end controller

