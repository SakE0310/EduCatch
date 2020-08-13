package com.kosmo.educatch.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView listDetailView(@ModelAttribute SubjectVO param) {
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
		log.info("DepartmentController listDepartment mav >>> : " + mav);
		
		log.info("listDetailView listDetailView 끝 >>>> ");
		
		return mav;
	}
}