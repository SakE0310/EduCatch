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
	public ModelAndView listDetailView(@ModelAttribute SubjectVO param) {
		ModelAndView mav = new ModelAndView();
		
		//String sno = param.getSno();
		String sno = "1";
		log.info("sno >>> " + sno);
		
		SubjectVO svo = detailViewService.DetailViewList(sno);
		


		mav.addObject("svo", svo);
		mav.setViewName("search/detailView");
		log.info("DepartmentController listDepartment mav >>> : " + mav);
		
		log.info("listDetailView listDetailView 끝 >>>> ");
		
		return mav;
	}
}