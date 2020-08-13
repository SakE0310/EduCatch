package com.kosmo.educatch.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.MyPageService;
import com.kosmo.educatch.vo.MemberVO;

@Controller
public class MyPageController {
	private Logger log = LoggerManager.getInstance().getLogger(MyPageController.class);

	@Autowired
	private MyPageService mypageService;
	
	//============마이페이지 조회=========================
	@RequestMapping("listMyPage.ec")
	public ModelAndView selectMyPage(@ModelAttribute MemberVO param) {
		log.info("MyPageController selectMyPage 시작 >>>");
		
		MemberVO mvo = mypageService.selectMyPage(param);
		
		log.info("mvo.getMno()>>>"+mvo.getMno());
		log.info("mvo.getMid()>>>"+mvo.getMid());
		log.info("mvo.getMpw()>>>"+mvo.getMpw());
		log.info("mvo.getMname()>>>"+mvo.getMname());
		log.info("mvo.getMtel()>>>"+mvo.getMtel());
		log.info("mvo.getMaddrno()>>>"+mvo.getMaddrno());
		log.info("mvo.getMaddr1()>>>"+mvo.getMaddr1());
		log.info("mvo.getMaddr2()>>>"+mvo.getMaddr2());
		log.info("mvo.getMimg()>>>"+mvo.getMimg());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("MemberVO", mvo);
		mav.setViewName("/mypage/mypageMain");
		
		log.info("MyPageController selectMyPage 끝 >>>");
		return mav;
	}//end of selectMyPage
	
	
	//=========프로필 수정 : 비밀번호 검사 : 조회
	@RequestMapping("selectPW.ec")
	public ModelAndView selectPW(@ModelAttribute MemberVO param) {
		log.info("MyPageController selectPW 시작 >>>");
		
		log.info("param.getMid()>>>"+param.getMid());
		
		MemberVO mvo = mypageService.selectPW(param);
		log.info("mvo.getMid()>>>"+mvo.getMid());
		log.info("mvo.getMpw()>>>"+mvo.getMpw());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("MemberVO", mvo);
		mav.setViewName("/mypage/mypagePwCheck");
		
		log.info("MyPageController selectPW 끝 >>>");
		return mav;
	}//end of selectPW
	
	//=========프로필 수정 : 비밀번호 검사 : 검사
	@RequestMapping("checkPW.ec")
	public ModelAndView checkPW(@ModelAttribute MemberVO param) {
		log.info("MyPageController checkPW 시작 >>>");
		
		log.info("param.getMid()>>>"+param.getMid());
		log.info("param.getMpw()>>>"+param.getMpw());
		
		MemberVO mvo = mypageService.checkPW(param);
		log.info("mvo>>>"+mvo);
		
		ModelAndView mav = new ModelAndView();
		
		if(mvo == null) {
			mav.setViewName("/mypage/mypagePwCheckForm");
		}else {
			
			log.info("mvo.getMid()>>>"+mvo.getMid());
			log.info("mvo.getMpw()>>>"+mvo.getMpw());
			
			mav.addObject("MemberVO", mvo);
			mav.setViewName("/mypage/mypagePwCheckForm");
		}
		
		log.info("MyPageController checkPW 끝 >>>");
		return mav;
	}//end of checkPW
	
	//====== 프로필 수정페이지로 이동
	@RequestMapping("EditDisplay.ec")
	public ModelAndView EditDisplay(@ModelAttribute MemberVO param) {
		log.info("MyPageController EditDisplay 시작 >>>");
		
		MemberVO mvo = mypageService.selectMyPage(param);
		
		log.info("mvo.getMno()>>>"+mvo.getMno());
		log.info("mvo.getMid()>>>"+mvo.getMid());
		log.info("mvo.getMpw()>>>"+mvo.getMpw());
		log.info("mvo.getMname()>>>"+mvo.getMname());
		log.info("mvo.getMtel()>>>"+mvo.getMtel());
		log.info("mvo.getMaddrno()>>>"+mvo.getMaddrno());
		log.info("mvo.getMaddr1()>>>"+mvo.getMaddr1());
		log.info("mvo.getMaddr2()>>>"+mvo.getMaddr2());
		log.info("mvo.getMimg()>>>"+mvo.getMimg());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("MemberVO", mvo);
		mav.setViewName("/mypage/mypageEdit");
		
		log.info("MyPageController EditDisplay 끝 >>>");
		return mav;
	}//end of EditDisplay
}
