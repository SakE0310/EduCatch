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
import com.kosmo.educatch.vo.SubjectVO;

@Controller
public class DetailViewController {
	private static Logger log = Logger.getLogger(DetailViewController.class);
	
	@Autowired
	private DetailViewService detailViewService;

	// 상세조회
	@RequestMapping("listDetailView")
	public ModelAndView listDetailView(@ModelAttribute AcademyVO avo, SubjectVO svo) {
		ModelAndView mav = new ModelAndView();
		log.info("listDetailView listDetailView 시작 >>>> ");

		List<AcademyVO> academylist = detailViewService.academyviewlist(avo);
		log.info("DetailViewController listDetailView list >>> : " + academylist);
		
		List<SubjectVO> subjectlist = detailViewService.subjectviewlist(svo);
		log.info("DetailViewController listDetailView list >>> : " + subjectlist);


		mav.addObject("avo", academylist);
		mav.addObject("svo", subjectlist);
		mav.setViewName("search/detailView");
		log.info("DepartmentController listDepartment mav >>> : " + mav);
		
		log.info("listDetailView listDetailView 끝 >>>> ");
		
		return mav;
	}
}