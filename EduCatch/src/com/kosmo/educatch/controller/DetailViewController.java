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
import com.kosmo.educatch.vo.SubjectVO;

@Controller
public class DetailViewController {
	private static Logger log = Logger.getLogger(DetailViewController.class);
	
	@Autowired
	private DetailViewService detailViewService;

	// 상세조회
	@RequestMapping("listDetailView")
	public ModelAndView listDetailView(@ModelAttribute AcademyVO param) {
		ModelAndView mav = new ModelAndView();
		
		//String sno = param.getSno();
		String sno = "A00001";
		
		SubjectVO svo = detailViewService.DetailViewList(sno);
		ConvenienceVO cvo = detailViewService.conViewList(sno);
		AcademyVO rvo = detailViewService.gradeSelect(sno);


		mav.addObject("svo", svo);
		mav.addObject("cvo", cvo);
		mav.addObject("rvo", rvo);
		
		mav.setViewName("search/detailView");
		log.info("DepartmentController listDepartment mav >>> : " + mav);
		
		log.info("listDetailView listDetailView 끝 >>>> ");
		
		return mav;
	}
}