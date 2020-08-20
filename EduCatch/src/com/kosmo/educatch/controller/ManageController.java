package com.kosmo.educatch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.ManageService;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.SubjectVO;
import com.kosmo.educatch.vo.TimetableVO;

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
	public ModelAndView getManageAcaPage(@ModelAttribute AcademyVO avo, 
													SubjectVO svo,ConvenienceVO cvo) {
		log.info("ManageController getManagePage >>> ");
		
		List<AcademyVO> academylist = manageService.academyManageView(avo);
		List<SubjectVO> subjectlist = manageService.subjectManageView(svo);
		List<ConvenienceVO> conlist = manageService.conManageView(cvo);
		

		ModelAndView mv = new ModelAndView();
		mv.addObject("academylist", academylist);
		mv.addObject("subjectlist", subjectlist);
		mv.addObject("conlist", conlist);
		mv.setViewName("manage/academyManage");
		
		return mv;
	}
	
	
	@RequestMapping("manageInsertSubject.ec")
	public ModelAndView manageInsertSubject(HttpServletRequest request, 
						SubjectVO svo, AcademyVO avo, ConvenienceVO cvo){
		log.info("ManageController manageInsertSubject >>> ");
		int i = manageService.insertSubject(svo);
		
		List<AcademyVO> academylist = manageService.academyManageView(avo);
		List<SubjectVO> subjectlist = manageService.subjectManageView(svo);
		List<ConvenienceVO> conlist = manageService.conManageView(cvo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("academylist", academylist);
		mav.addObject("subjectlist", subjectlist);
		mav.addObject("conlist", conlist);
		if(i>0) {
			mav.addObject("resultStr", "등록 성공");
			mav.setViewName("manage/academyManage");
		}else {
			mav.addObject("resultStr", "등록 실패");
			mav.setViewName("manage/academyManage");
		}
		
		log.info("ManageController manageInsertSubject 끝>>> ");
		
		return mav;
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
		MemberVO mvo = new MemberVO();
		
		//세션 적용하면 바꿔야함
		mvo.setAno("A00001");
		List<MemberVO> list = manageService.getAcaAccept(mvo);
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
	
	@ResponseBody
	@RequestMapping("selectReser")
	public Map<String, List<TimetableVO>> selectReservation(HttpServletRequest request){
		log.info("ManageController selectReservation >>> ");
		log.info("requeset >>> " + request.getParameter("date"));
		MemberVO mvo = new MemberVO();
		
		//세션 적용하면 바꿔야함
		mvo.setAno("A00001");
		mvo.setMinsertdate(request.getParameter("date"));
		List<TimetableVO> list = manageService.selectReservation(mvo);
		Map<String, List<TimetableVO>> map = new HashMap<String, List<TimetableVO>>();
		map.put("data", list);
		log.info("ManageController selectReservation end >>> ");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("selectMemList")
	public Map<String, List<MemberVO>> selectMemberList(HttpServletRequest request){
		log.info("ManageController selectMemberList >>> ");
		List<MemberVO> list = manageService.selectMemList(request.getParameter("ttno"), "A00001");
		log.info(list);
		Map<String, List<MemberVO>> map = new HashMap<String, List<MemberVO>>();
		map.put("list", list);
		log.info("ManageController selectMemberList end >>> ");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("insertTimeTable")
	public Map<String, String> insertTimeTable(HttpServletRequest request){
		log.info("ManageController insertTimeTable >>> ");
		
		TimetableVO tvo = new TimetableVO();
		tvo.setTtdate(request.getParameter("date"));
		tvo.setTttime(request.getParameter("time"));
		tvo.setTtpeople(request.getParameter("people"));
		//세션 적용하면 바꿀부분
		tvo.setAcademy_ano("A00001");
		int i = manageService.insertTimetable(tvo);
		Map<String, String> map = new HashMap<String, String>();
		if(i > 0) {
			map.put("result", "success");
		}else {
			map.put("result", "failed");
		}
		log.info("ManageController insertTimeTable end >>> ");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("updateTimeTable")
	public Map<String, String> updateTimeTable(HttpServletRequest request){
		log.info("ManageController updateTimeTable >>> ");
		
		TimetableVO tvo = new TimetableVO();
		tvo.setTtno(request.getParameter("ttno"));
		tvo.setTttime(request.getParameter("time"));
		tvo.setTtpeople(request.getParameter("people"));
		int i = manageService.updateTimetable(tvo);
		Map<String, String> map = new HashMap<String, String>();
		if(i > 0) {
			map.put("result", "success");
		}else {
			map.put("result", "failed");
		}
		log.info("ManageController updateTimeTable end >>> ");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("deleteTimeTable")
	public Map<String, String> deleteTimeTable(HttpServletRequest request){
		log.info("ManageController deleteTimeTable >>> ");
		
		TimetableVO tvo = new TimetableVO();
		tvo.setTtno(request.getParameter("ttno"));
		int i = manageService.deleteTimetable(tvo);
		Map<String, String> map = new HashMap<String, String>();
		if(i > 0) {
			map.put("result", "success");
		}else {
			map.put("result", "failed");
		}
		log.info("ManageController deleteTimeTable end >>> ");
		return map;
	}
}
