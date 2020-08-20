package com.kosmo.educatch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

@Controller
public class DetailViewController {
	private static Logger log = Logger.getLogger(DetailViewController.class);
	
	@Autowired
	private DetailViewService detailViewService;

	// ----------상세조회페이지
	@RequestMapping("listDetailView.ec")
	public ModelAndView listDetailView(@ModelAttribute
										SubjectVO svo, ReviewVO rvo,HttpServletRequest request) {
		log.info("DetailViewController listDetailView 시작 >>>> ");
		ModelAndView mav = new ModelAndView();
		
		String ano = (String)request.getParameter("ano");
		log.info("ano >!>!>!>!>!>"+ano);
		
		AcademyVO avo = detailViewService.academyView(ano);
		ConvenienceVO cvo = detailViewService.conView(ano);
		AcademyVO gvo = detailViewService.gradeView(ano);
		List<SubjectVO> subjectlist = detailViewService.subjectViewList(svo);
		List<ReviewVO> reviewlist = detailViewService.reviewList(rvo);
		

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
	public Map<String, String> insertBookmark(HttpServletRequest request, HttpSession session){
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
		String ano = request.getParameter("ano");
		log.info("ano >!>!>!> " + ano);
		AcademyVO avo = new AcademyVO();
		avo.setAcademy_ano(ano);
		avo.setAno(ano);
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
	public Map<String, String> deleteBookmark(HttpServletRequest request, HttpSession session){
		log.info("DetailViewController deleteBookmark >>> ");
		String ano = request.getParameter("ano");
		log.info("ano >!>!>!> " + ano);
		AcademyVO avo = new AcademyVO();
		avo.setAcademy_ano(ano);
		avo.setAno(ano);
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
	
	@ResponseBody
	@RequestMapping("selectBookmark.ec")
	public Map<String, String> selectBookmark(HttpServletRequest request, HttpSession session, AcademyVO param){
		log.info("DetailViewController selectBookmark >>> ");
		String ano = request.getParameter("ano");
		log.info("ano >!>!>!> " + ano);
		//log.info("academy_ano >!>!>!> " + academy_ano);
		//sbvo.setAcademy_ano(ano);
		//sbvo.setMember_mno("M202008130001");
		
		param.setAno(ano);
		param.setAcademy_ano(ano);
		
		
		List<AcademyVO> bookmarklist = detailViewService.selectBookmark(param);
		
		int i = bookmarklist.size();
		log.info("booksize >>>" + i);
		
		
		Map<String, String> map = new HashMap<String, String>();
		if(i > 0) {
			map.put("result", "success");
		}else {
			map.put("result", "failed");
		}
		
		
		
		log.info("DetailViewController selectBookmark 끝 >>> ");
		return map;
	}
	
	
	
	
}