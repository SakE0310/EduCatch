package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.LoggerManager;

@Controller
public class ManageController {
	private Logger log = LoggerManager.getInstance().getLogger(ManageController.class);
	
	@RequestMapping("manage")
	public ModelAndView getManagePage() {
		log.info("ManageController getManagePage >>> ");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manage/manageHome");
		
		return mv;
	}
	
	@RequestMapping("manageAca")
	public ModelAndView getManageAcaPage() {
		log.info("ManageController getManagePage >>> ");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manage/academyManage");
		
		return mv;
	}
	
	@RequestMapping("manageReserChk")
	public ModelAndView getManageReserChkPage() {
		log.info("ManageController getManagePage >>> ");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manage/reservationCheck");
		
		return mv;
	}
	
	@RequestMapping("manageAcaMem")
	public ModelAndView getManageAcaMemPage() {
		log.info("ManageController getManagePage >>> ");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manage/academyMemberAccept");
		
		return mv;
	}
}
