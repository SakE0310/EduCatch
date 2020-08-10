package com.kosmo.educatch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	@ResponseBody
	@RequestMapping("acceptAca")
	public Map<String, String> acceptAcaMember(@RequestBody String json){
		log.info("ManageController acceptAca >>> ");
		ObjectMapper objMapper = new ObjectMapper();
		Map<String, List<Map<String,String>>> map = null;
		
		try {
			map = objMapper.readValue(json, new TypeReference<Map<String,List<Map<String,String>>>>() {});
		} catch (Exception e) {
			log.info("json parse error >>> " + e.getMessage());
		}
		
		
		List<Map<String,String>> list = map.get("data");
		int cnt = 0;
		MemberVO mvo = null;
		mvo = new MemberVO();
		
		for(int i = 0; i < list.size(); i++) {
			Map<String,String> data = list.get(i);
			mvo.setMno(data.get("mno"));
			log.info(mvo.getMno());
			cnt += manageService.setAcceptAcaMem(mvo);
		}
		
		Map<String, String> rmap = new HashMap<String, String>();
		if(cnt == list.size()) {
			rmap.put("result", "success");
		}
		
		log.info("ManageController acceptAca end >>> ");
		return rmap;
	}
	
	@ResponseBody
	@RequestMapping("rejectAca")
	public Map<String, String> rejectAcaMember(@RequestBody String json){
		log.info("ManageController rejectAcaMember >>> ");
		
		ObjectMapper objMapper = new ObjectMapper();
		Map<String, List<Map<String,String>>> map = null;
		
		try {
			map = objMapper.readValue(json, new TypeReference<Map<String,List<Map<String,String>>>>() {});
		} catch (Exception e) {
			log.info("json parse error >>> " + e.getMessage());
		}
		
		
		List<Map<String,String>> list = map.get("data");
		int cnt = 0;
		MemberVO mvo = null;
		mvo = new MemberVO();
		
		for(int i = 0; i < list.size(); i++) {
			Map<String,String> data = list.get(i);
			mvo.setMno(data.get("mno"));
			log.info(mvo.getMno());
			cnt += manageService.delAcaMem(mvo);
		}
		
		Map<String, String> rmap = new HashMap<String, String>();
		if(cnt == list.size()) {
			rmap.put("result", "success");
		}
		
		log.info("ManageController rejectAcaMember end >>> ");
		return rmap;
	}
}
