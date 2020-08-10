package com.kosmo.educatch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.ManageService;
import com.kosmo.educatch.vo.MemberVO;

@Controller
public class ManageController {
	private Logger log = LoggerManager.getInstance().getLogger(ManageController.class);
	
	@Autowired
	private ManageService manageService;
	
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
	
	@RequestMapping("addAca")
	public ModelAndView getAddAcaPage() {
		log.info("ManageController getAddAcaPage >>> ");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manage/addAcademy");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("getAcaMem")
	public Map<String, List<MemberVO>> getAcademyMember(){
		Map<String, List<MemberVO>> map = new HashMap<String, List<MemberVO>>();
		
		List<MemberVO> list = manageService.getAcaAccept();
		map.put("vo", list);
		return map;
	}
}
