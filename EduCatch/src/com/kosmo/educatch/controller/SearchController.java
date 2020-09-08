package com.kosmo.educatch.controller;

import java.util.ArrayList;
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

//controller를 사용하기 위한 annotation
@Controller
public class SearchController {
	//SearchService 자동주입 annotation
	@Autowired
	private SearchService searchService;

	Logger log = Logger.getLogger(SearchController.class);
	
	//학원검색 페이지로 이동
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
	//json데이터를 사용하기 위해서 ResponseBody annotation을 사용
	//지역 데이터는 서울을 최상단에 올리기 위해서 DB를 통하지 않고 직접 세팅했다
	//ArrayList 값을 Map안에 넣어서 ajax에서 데이터를 꺼내서 씀
	@ResponseBody
	@RequestMapping("getDistrict")
	public Map<String,ArrayList<String>>getDistrict(SearchVO param){
		log.info("search controller getDistrict start >>> ");
		Map<String, ArrayList<String>>map = new HashMap<String,ArrayList<String>>();
		ArrayList<String> arr = new ArrayList<String>();
		arr.add("서울");
		arr.add("경기도");
		arr.add("인천");
		arr.add("강원");
		arr.add("충북");
		arr.add("충남");
		arr.add("전북");
		arr.add("전남");
		arr.add("경북");
		arr.add("경남");
		arr.add("부산");
		arr.add("대구");
		arr.add("광주");
		arr.add("대전");
		arr.add("울산");
		arr.add("세종특별자치시");
		arr.add("제주특별자치도");
		map.put("districtList",arr);
		log.info("search controller getDistrict arr >>> "+arr);
		log.info("search controller getDistrict map >>> "+map);
		log.info("search controller getDistrict end >>> ");
		return map;
	}//getDistrict
	
	//지역 소분류
	//지역 소분류 또한 json데이터를 이용해서 ajax에서 출력하여 데이터를 사용한다
	@ResponseBody
	@RequestMapping("getCity")
	public Map<String,List<SearchVO>>getCity(SearchVO param,
											HttpServletRequest req){
		log.info("search controller getCity start >>> ");
		//district값을 getParamater로 받아온다
		String district = req.getParameter("district");
		log.info("search controller getCity district >>> "+district);
		Map<String,List<SearchVO>>map = new HashMap<String,List<SearchVO>>();
		
		//district값을 DB로 보내서 현재 district row값에 맞는 city 값을 가져온다
		List<SearchVO>list = searchService.getCity(param);
		//그 값을 mpa.put을 하여 key : cityList , value : list값을 반환 한다
		map.put("cityList",list);
		log.info("search controller getCity list >>> "+list);
		log.info("search controller getCity map >>> "+map);
		log.info("search controller getCity end >>> ");
		return map;
	}//getCity
	
	//카테고리 대분류,소분류를 가져오는 controller 함수는 AcademyRequestController에 있다
	
	//학원리스트 받아오기
	//json데이터를 사용하여 ajax와 통신했다
	@ResponseBody
	@RequestMapping("getAcaList")
	public Map<String,List<AcademyVO>>getAcaList(AcademyVO param,
											     HttpServletRequest req){
		log.info("search controller getAcaList start >>> ");
		log.info("search controller getAcaList param >>> "+param);
		//학원리스트 출력에 필요한 값들을 받아오게 세팅 해놓고 사용했다
		//지역 대분류
		String district = req.getParameter("district");
		//지역 소분류
		String city = req.getParameter("city");
		//카테고리 대분류
		String cmajor = req.getParameter("cmajor");
		//카테코리 소분류
		String cminor = req.getParameter("cminor");
		//학원명
		String aname = req.getParameter("aname");
		//필터설정
		String setDesc = req.getParameter("setDesc");
		//무한스크롤 현재 페이지
		String scrollPage = req.getParameter("scrollPage");
		
		//모든 getParameter의 값들은 if문을 거쳐서 사용하게 만들었다
		if(scrollPage!=null) {
			log.info("search controller getAcaList scrollPage >>> "+scrollPage);
		}
		//필터 설정
		//필터 설정은 리뷰순, 평점순 두가지가 있다 select box value값이
		//넘어오는것에 따라서 세팅되는 vo값이 달라진다
		if(setDesc!=null) {
			log.info("search controller getAcaList setDesc not null >>> ");
			if(setDesc.equals("리뷰 많은순")) {
				log.info("search controller getAcaList heightReview >>> ");
				log.info("search controller getAcaList setDesc >>> "+setDesc);
				param.setRvcount(setDesc);
			}
			if (setDesc.equals("평점 높은순")) {
				log.info("search controller getAcaList heightGrade >>> ");
				log.info("search controller getAcaList setDesc >>> "+setDesc);
				param.setAgrade(setDesc);
			}
		}
		//지역, 카테고리 검색
		//지역 2개와 케티고리 2개 값이 모두 넘어올 경우
		if(district!=null && city!=null && cmajor!=null && cminor!=null) {
		//split함수는 서울 전체값을 가져오기 위한 함수이다 
		//city값에서 "서울 전체" 값이 반환될 시 가운데 공백을 기점으로
		//나누기 한뒤 index[0]값을 가져와서 DB로 보낸다
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
		log.info("search controller getAcaList param.getAgrade() >>> "+param.getAgrade());
		log.info("search controller getAcaList param.getRvcount()() >>> "+param.getRvcount());
		}
		
		//학원명 검색
		if(aname!=null) {
		param.setAname(aname);
		
		log.info("search controller getAcaList aname >>> "+aname);
		log.info("search controller getAcaList param.getAname() >>> "+param.getAname());
		}
		Map<String,List<AcademyVO>>map = new HashMap<String,List<AcademyVO>>();
		//getParameter에서 거쳐진 값들을 service로 보낸다
		List<AcademyVO>list = searchService.getAcaList(param);
		map.put("acaList",list);
		log.info("search controller getAcaList list >>> "+list);
		log.info("search controller getAcaList map >>> "+map);
		log.info("search controller getAcaList end >>> ");
		return map;
	}//getAcaList
	
}//end controller

