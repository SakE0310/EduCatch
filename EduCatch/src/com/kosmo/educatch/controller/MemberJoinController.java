package com.kosmo.educatch.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.MemberJoinService;
import com.kosmo.educatch.vo.MemberVO;

@Controller
public class MemberJoinController {
	private static Logger log=
			Logger.getLogger(MemberJoinController.class);
	
	@Autowired
	private MemberJoinService memberjoinservice;
	//일반회원, 학원회원을 선택하는 페이지로 이동
	@RequestMapping("/memberjoingo")
	public ModelAndView memlberJoinGo(@ModelAttribute MemberVO param) {
		log.info("memlberJoinGo함수 진입");
		ModelAndView mav = new ModelAndView(); 
		
		mav.setViewName("member/join/memberButton");
		log.info("memlberJoinGo함수 진입 끝");
		return mav;
	}
	
	//일반회원가입폼으로 이동 
	@RequestMapping("/memberjoinform")
	public ModelAndView memberJoinForm(@ModelAttribute MemberVO param) {
		log.info("memberJoinForm함수 진입");
		ModelAndView mav = new ModelAndView(); 
		
		mav.setViewName("member/join/memberJoinForm");
		log.info("memberJoinForm함수 진입 끝");
		return mav;
	}
	
	//등록
	@RequestMapping("memberinsert")
	public ModelAndView memberInsert(@ModelAttribute MemberVO param, HttpServletRequest request) {
		log.info("memberInsert함수 진입");
		//핸드폰 조립
		String mtel1 = request.getParameter("mtel1");
		String mtel2 = request.getParameter("mtel2");
		String mtel3 = request.getParameter("mtel3");
		String mtel = mtel1+mtel2+mtel3;
		param.setMtel(mtel);
		
		//주소조립
		
		//이메일 조립
		
		
		
		
		
		int ins =memberjoinservice.memberInsert(param);
		
		ModelAndView mav = new ModelAndView();
		
		log.info("memberInsert함수 진입 끝");
		return mav;
	}
	

}
