package com.kosmo.educatch.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.LoginService;
import com.kosmo.educatch.vo.AMemberVO;
import com.kosmo.educatch.vo.MemberVO;

@Controller
public class LoginController {
	
	private Logger log = LoggerManager.getInstance().getLogger(LoginController.class);
	@Autowired
	private LoginService loginService;

	// =================== 로그인 화면으로  =================

	@RequestMapping("login")

	public ModelAndView listNotice() {
		log.info("LoginController login 시작 >>>");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login/login");

		log.info("LoginController login 끝 >>>");
		return mav;

	}// end of login.jsp

	
	
	// ================ 로그인 처리 ========================
	
	@RequestMapping("/loginCheck")
	public ModelAndView  loginCheck(@ModelAttribute MemberVO param, HttpSession session) {
		log.info("LoginController loginCheck 시작 >>>");
		ModelAndView mav = new ModelAndView();
		
		MemberVO memberInfo = loginService.loginCheck(param);
		log.info("memberInfo >>>>"+memberInfo);
		
		if(memberInfo != null){
		
			if(memberInfo.getMemailchk().toUpperCase().equals("Y")) {
				session.setAttribute("user", memberInfo);
				mav.addObject("MemberVO", memberInfo);
				mav.setViewName("member/login/result");
				
			}else{
				mav.addObject("result", "인증 받지 않은 이메일입니다.");
				mav.setViewName("member/join/result");
				
			}
		}else
		{
			mav.addObject("message","아이디 또는 비밀번호가 올바르지 않습니다.");
			mav.setViewName("member/login/error");
		}
			
		
		
				
		log.info("loginCheck() >>>>");
		return mav;
		
	}
		
		
	// ====================회원가입 폼으로 ==========================
	
	@RequestMapping("/joinCheckForm")
	   public ModelAndView joinCheckForm(){
	      log.info("joinCheckForm() start");
	      ModelAndView mav  = new ModelAndView();
	      mav.setViewName("member/join/agreeMember");          
	      log.info("joinCheckForm() end");
	      return mav;
	   }// end of joinCheckForm()
	
	
	// ==================== 학원가입 폼으로 ========================
	@RequestMapping("/academyJoinForm")
	   public ModelAndView academyJoinForm(){
	      log.info("joinCheckForm() start");
	      ModelAndView mav  = new ModelAndView();
	      mav.setViewName("member/join/agreeAmember");          
	      log.info("academyJoinForm() end");
	      return mav;
	   }// end of academyJoinForm()
	
	
	// =======================비밀번호 찾기==========================
	@RequestMapping(value = "/pwReset.ec", method = RequestMethod.GET)
	public ModelAndView pwReset() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login/pwReset");

		log.info("LoginController login 끝 >>>");
		return mav;

	}
	@RequestMapping("/passwordReset.ec")
	public ModelAndView pwReset(@ModelAttribute MemberVO param){
		log.info("pwReset() start " + param.getMid()); 
		ModelAndView mav = new ModelAndView();
		
		String complete = loginService.passwordReset(param);
		
		mav.addObject("resultMsg",complete);
		mav.setViewName("member/login/pwResultPage");
		log.info("pwReset() end");
		return mav;
	
	}// end of pwReset
	
	/*
	 * 비밀번호 변경 후 Callback
	 * 이메일 URL통해 들어온 경우 비밀번호 변경 관련 Page 노출
	 * LoginVO(loginID)를 parameter로 받아와 jsp에 전송
	 * jsp에서  변경'될' 비밀번호를 받아와 API호출
	 */
	@RequestMapping("/passwdChangePage")
	public ModelAndView passwordChangePage(@ModelAttribute MemberVO param) {
		ModelAndView mav = new ModelAndView();
		log.info("URL Parameter : " + param.getFindpw());
		mav.addObject("MemberVO",param);
		mav.setViewName("member/login/pwChange");
		return mav;
	}
	
	@RequestMapping("/passwdChange")
	public ModelAndView passwordChange(@ModelAttribute MemberVO param) {
		ModelAndView result = new ModelAndView();
		log.info("change pw : " + param.getMpw());
		String changeCheck = loginService.passwordChange(param);
		result.addObject("resultMsg",changeCheck);
		result.setViewName("member/login/pwResultPage");
		
		return result;
	}
	
	// ==================== 로그아웃 ============================
		@RequestMapping("logout")
		public ModelAndView logout(HttpSession session) {
			
			MemberVO mvo = null;
			mvo=(MemberVO) session.getAttribute("user");
			
			log.info("snstype>>>"+mvo.getMsnstype());
			
			ModelAndView mav = new ModelAndView();
			if(mvo.getMsnstype().equals("k")) {
				mav.addObject("mvo",mvo);
				mav.setViewName("member/join/logoutKakao");
			}else {
				if(session != null)
				{
					if(session.getAttribute("user") != null)
					{
						session.removeAttribute("user");
					}
				}
				session.invalidate();
				mav.setViewName("member/login/logout");
			}
			
			return mav;
		}
		//====================카카오 로그아웃==================================
		@RequestMapping("logoutk")
		public ModelAndView logoutk(HttpSession session) {
			log.info("카카오 로그아웃 세션 지우기");
			if(session != null)
			{
				if(session.getAttribute("user") != null)
				{
					session.removeAttribute("user");
				}
			}
			session.invalidate();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("member/login/logout");
			return mav;
		}
		
	
}

