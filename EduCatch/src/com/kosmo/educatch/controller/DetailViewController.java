package com.kosmo.educatch.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.DetailViewService;
import com.kosmo.educatch.vo.DetailViewVO;

@Controller
public class DetailViewController {
	private static Logger log = Logger.getLogger(DetailViewController.class);
	
	@Autowired
	private DetailViewService detailViewService;

	// 상세조회
	@RequestMapping("listDetailView")
	public ModelAndView listDetailView(@ModelAttribute DetailViewVO param) {
		ModelAndView mav = new ModelAndView();
		log.info("listDetailView listDetailView 시작 >>>> ");
		
		log.info("listDetailView listDetailView param >>>> " + param);
		log.info("param.getAno() >>>> " + param.getAno());
		log.info("param.getAname() >>>> " + param.getAname());
		log.info("param.getAtel() >>>> " + param.getAtel());
		log.info("param.getAxpoint() >>>> " + param.getAxpoint());
		log.info("param.getAypoint() >>>> " + param.getAypoint());
		log.info("param.getAaddrno() >>>> " + param.getAaddrno());
		log.info("param.getAaddr1() >>>> " + param.getAaddr1());
		log.info("param.getAaddr2() >>>> " + param.getAaddr2());
		log.info("param.getAlogo() >>>> " + param.getAlogo());
		log.info("param.getCategory_cno() >>>> " + param.getCategory_cno());
		log.info("param.getAdeleteyn() >>>> " + param.getAdeleteyn());
		log.info("param.getAinsertdate() >>>> " + param.getAinsertdate());
		log.info("param.getAupdatedate() >>>> " + param.getAupdatedate());

		List<DetailViewVO> list = detailViewService.listDetailView(param);
		log.info("DetailViewController listDetailView list >>> : " + list);

		int listCnt = list.size();

		for (int i = 0; i < listCnt; i++) {
			DetailViewVO dvo = (DetailViewVO) list.get(i);
			log.info("dvo.getAno() >>>> " + dvo.getAno());
			log.info("dvo.getAname() >>>> " + dvo.getAname());
			log.info("dvo.getAtel() >>>> " + dvo.getAtel());
			log.info("dvo.getAxpoint() >>>> " + dvo.getAxpoint());
			log.info("dvo.getAypoint() >>>> " + dvo.getAypoint());
			log.info("dvo.getAaddrno() >>>> " + dvo.getAaddrno());
			log.info("dvo.getAaddr1() >>>> " + dvo.getAaddr1());
			log.info("dvo.getAaddr2() >>>> " + dvo.getAaddr2());
			log.info("dvo.getAlogo() >>>> " + dvo.getAlogo());
			log.info("dvo.getCategory_cno() >>>> " + dvo.getCategory_cno());
			log.info("dvo.getAdeleteyn() >>>> " + dvo.getAdeleteyn());
			log.info("dvo.getAinsertdate() >>>> " + dvo.getAinsertdate());
			log.info("dvo.getAupdatedate() >>>> " + dvo.getAupdatedate());
<<<<<<< HEAD
=======
<<<<<<< HEAD
			log.info("aaaa");
=======
>>>>>>> branch 'master' of https://github.com/SakE0310/EduCatch
>>>>>>> branch 'master' of https://github.com/SakE0310/EduCatch
		}

		mav.addObject("listDetailView", list);
		mav.setViewName("search/detailView");
		log.info("DepartmentController listDepartment mav >>> : " + mav);
		
		log.info("listDetailView listDetailView 끝 >>>> ");
		
		return mav;
	}
}