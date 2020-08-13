package com.kosmo.educatch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.DetailViewService;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.SubjectVO;
import com.kosmo.educatch.vo.TimetableVO;

@Controller
public class DetailViewController {
	private static Logger log = Logger.getLogger(DetailViewController.class);
	
	@Autowired
	private DetailViewService detailViewService;

	// ----------상세조회페이지
	@RequestMapping("listDetailView.ec")
	public ModelAndView listDetailView(@ModelAttribute SubjectVO param) {
		log.info("DetailViewController listDetailView 시작 >>>> ");
		ModelAndView mav = new ModelAndView();
		
		//String ano = (String)param.getAno();
		String ano = "A00001";
		
		AcademyVO avo = detailViewService.academyView(ano);
		ConvenienceVO cvo = detailViewService.conView(ano);
		AcademyVO gvo = detailViewService.gradeView(ano);
		List<SubjectVO> subjectlist = detailViewService.subjectViewList(param);
		List<ReviewVO> reviewlist = detailViewService.reviewList(param);
		

		mav.addObject("avo", avo);
		mav.addObject("cvo", cvo);
		mav.addObject("gvo", gvo);
		mav.addObject("subjectList", subjectlist);
		mav.addObject("reviewlist", reviewlist);
		
		mav.setViewName("search/detailView");
		
		log.info("DetailViewController listDetailView mav >>> : " + mav);
		
		log.info("DetailViewController listDetailView 끝 >>>> ");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("insertBookmark.ec")
	public Map<String, String> insertBookmark(HttpServletRequest request){
		log.info("DetailViewController insertBookmark 시작 >>> ");
		/*
		TimetableVO tvo = new TimetableVO();
		tvo.setTtdate(request.getParameter("date"));
		tvo.setTttime(request.getParameter("time"));
		tvo.setTtpeople(request.getParameter("people"));
		//세션 적용하면 바꿀부분
		tvo.setAcademy_ano("A00001");
		int i = manageService.insertTimetable(tvo);
		*/
		
		AcademyVO avo = new AcademyVO();
		avo.setAcademy_ano("A00001");
		avo.setMember_mno("M202008130001");
		
		int i = detailViewService.insertBookmark(avo);
		
		Map<String, String> map = new HashMap<String, String>();
		if(i > 0) {
			map.put("result", "success");
		}else {
			map.put("result", "failed");
		}
		log.info("DetailViewController insertBookmark 끝 >>> ");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("deleteBookmark.ec")
	public Map<String, String> deleteBookmark(HttpServletRequest request){
		log.info("DetailViewController deleteBookmark >>> ");
		
		AcademyVO avo = new AcademyVO();
		avo.setAcademy_ano("A00001");
		avo.setMember_mno("M202008130001");
		int i = detailViewService.deleteBookmark(avo);
		
		Map<String, String> map = new HashMap<String, String>();
		if(i > 0) {
			map.put("result", "success");
		}else {
			map.put("result", "failed");
		}
		log.info("DetailViewController deleteBookmark 끝 >>> ");
		return map;
	}
	
	
}