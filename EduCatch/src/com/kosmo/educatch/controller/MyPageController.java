package com.kosmo.educatch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.MyPageService;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.ConsultVO;
import com.kosmo.educatch.vo.FreeVO;

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
	
	//======프로필 수정 : 수정===========================
	@RequestMapping("editMyPage.ec")
	public ModelAndView editMyPage(HttpServletRequest request,@ModelAttribute MemberVO param) {
		log.info("MyPageController editMyPage 시작 >>>");
		
		//휴대폰 
		String mtel1 = request.getParameter("mtel1");
		String mtel2 = request.getParameter("mtel2");
		String mtel3 = request.getParameter("mtel3");
		String mtel = mtel1+"-"+mtel2+"-"+mtel3;
		param.setMtel(mtel);
		log.info("mtel>>>"+mtel);

		log.info("param.getMno()>>>"+param.getMno());
		log.info("param.getMid()>>>"+param.getMid());
		log.info("param.getMpw()>>>"+param.getMpw());
		log.info("param.getMname()>>>"+param.getMname());
		log.info("param.getMtel()>>>"+param.getMtel());
		log.info("param.getMaddrno()>>>"+param.getMaddrno());
		log.info("param.getMaddr1()>>>"+param.getMaddr1());
		log.info("param.getMaddr2()>>>"+param.getMaddr2());

		int nCnt  = mypageService.editMyPage(param);
		log.info("nCnt>>>"+nCnt);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("MemberVO",param );
		mav.setViewName("/mypage/mypageMain");
		
		log.info("MyPageController editMyPage 끝 >>>");
		return mav;
	}//end of editMyPage
	
	//=======비밀번호 변경페이지로 이동=======================
	@RequestMapping("editPW.ec")
	public ModelAndView editPW(@ModelAttribute MemberVO param) {
		log.info("MyPageController editPW 시작 >>>");
		
		
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
		mav.setViewName("/mypage/mypagePwEdit");
		
		log.info("MyPageController editPW 끝 >>>");
		return mav;
	}//end of editPW
	
	//===비밀번호 변경 : 비밀번호 수정============
	@RequestMapping("updatePW.ec")
	public ModelAndView updatePW(HttpServletRequest request,
								@ModelAttribute MemberVO param) {
		log.info("MyPageController updatePW 시작 >>>");
		
		String newPW = request.getParameter("mpw_new");
		log.info("param.getMno()>>>"+param.getMno());
		log.info("newPW>>>"+newPW);
		
		param.setMpw(newPW);
		
		int nCnt  = mypageService.updatePW(param);
		log.info("nCnt>>>"+nCnt);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("MemberVO",param );
		mav.setViewName("/mypage/mypageMain");
		
		log.info("MyPageController updatePW 끝 >>>");
		return mav;
	}//end of updatePW
	
	//===== 학원문의 조회 ======================
	@RequestMapping("consultQuestion.ec")
	public ModelAndView consultQuestion(HttpServletRequest request,
										@ModelAttribute ConsultVO cvo, MemberVO param) {
		log.info("MyPageController consultSearch 시작>>>");
		
		String mno = request.getParameter("mno");
		log.info("mno>>>>"+mno);
		
		cvo.setMember_mno(mno);
		List<ConsultVO> list = mypageService.consultQuestion(cvo);
		log.info("MyPageController consultSearch list.size()>>>" + list.size());
		
		for (int i = 0; i < list.size(); i++) {
			// list를 VO로 형변환해준다.
			ConsultVO cvo1 = (ConsultVO) list.get(i);
			
			log.info(cvo1.getCbno());
			log.info(cvo1.getCbsubject());
			log.info(cvo1.getCbname());
			log.info(cvo1.getCbcontent());
			log.info(cvo1.getAcademy_ano());
			log.info(cvo1.getMember_mno());
			log.info(cvo1.getCdeleteyn());
			log.info(cvo1.getCinsertdate());
			log.info(cvo1.getCupdatedate());
		}
		
		MemberVO mvo = mypageService.selectMyPage(param);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("ConsultVO", list);
		mav.addObject("MemberVO", mvo);
		mav.setViewName("/mypage/mypageConsult");
		
		log.info("MyPageController consultSearch 끝 >>>");
		return mav;
	}//end of consultSearch
	
	@RequestMapping("myReview")
	public ModelAndView myReview(HttpServletRequest request,
								 @ModelAttribute ReviewVO rvo, MemberVO param) {
		log.info("MyPageController myReview 시작>>>");
		
		String mno = request.getParameter("mno");
		log.info("mno>>>>"+mno);
		
		rvo.setMember_mno(mno);
		List<ReviewVO> list = mypageService.myReview(rvo);
		log.info("MyPageController myReview list.size()>>>" + list.size());
		
		for (int i = 0; i < list.size(); i++) {
			// list를 VO로 형변환해준다.
			ReviewVO rvo1 = (ReviewVO) list.get(i);
			
			log.info("getRbno			>>"+rvo1.getRbno());
			log.info("getRbsubject		>>"+rvo1.getRbsubject());
			log.info("getRbname			>>"+rvo1.getRbname());
			log.info("getRbimg			>>"+rvo1.getRbimg());
			log.info("getRbcontent		>>"+rvo1.getRbcontent());
			log.info("getAcademy_ano	>>"+rvo1.getAcademy_ano());
			log.info("getMember_mno		>>"+rvo1.getMember_mno());
			log.info("getRbgrade		>>"+rvo1.getRbgrade());
			log.info("getRbdeleteyn		>>"+rvo1.getRbdeleteyn());
			log.info("getRbinsertdate	>>"+rvo1.getRbinsertdate());
			log.info("getRbupdatedate	>>"+rvo1.getRbupdatedate());

		}
		
		MemberVO mvo = mypageService.selectMyPage(param);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("ReviewVO", list);
		mav.addObject("MemberVO", mvo);
		mav.setViewName("/mypage/mypageMain");
		
		log.info("MyPageController myReview 끝 >>>");
		return mav;
	}
	
	@RequestMapping("myFree")
	public ModelAndView myFree(HttpServletRequest request,
								 @ModelAttribute FreeVO fvo, MemberVO param) {
		log.info("MyPageController myFree 시작>>>");
		
		String mno = request.getParameter("mno");
		log.info("mno>>>>"+mno);
		
		fvo.setMember_mno(mno);
		List<FreeVO> list = mypageService.myFree(fvo);
		log.info("MyPageController myFree list.size()>>>" + list.size());
		
		for (int i = 0; i < list.size(); i++) {
			// list를 VO로 형변환해준다.
			FreeVO fvo1 = (FreeVO) list.get(i);
			
			log.info("getRbno			>>"+fvo1.getFbno());
			log.info("getRbsubject		>>"+fvo1.getFbsubject());
			log.info("getRbname			>>"+fvo1.getFbname());
			log.info("getRbimg			>>"+fvo1.getFbimg());
			log.info("getRbcontent		>>"+fvo1.getFbcontent());
			log.info("getAcademy_ano	>>"+fvo1.getMember_mno());
			log.info("getRbgrade		>>"+fvo1.getFbdeleteyn());
			log.info("getRbdeleteyn		>>"+fvo1.getFbinsertdate());
			log.info("getRbinsertdate	>>"+fvo1.getFbupdatedate());

		}
		
		MemberVO mvo = mypageService.selectMyPage(param);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("FreeVO", list);
		mav.addObject("MemberVO", mvo);
		mav.setViewName("/mypage/mypageMain_2");
		
		log.info("MyPageController myReview 끝 >>>");
		return mav;
	}
	
	//회원탈퇴폼으로 이동
	@RequestMapping("/mypageOut")
	public ModelAndView mypageOut(@ModelAttribute MemberVO param, HttpSession session) {
		log.info("MyPageController mypageOut 시작 >>>");
		
		MemberVO mvo = null;
		mvo=(MemberVO) session.getAttribute("user");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("memberVO", mvo);
		mav.setViewName("/mypage/mypageOut");
		
		log.info("MyPageController mypageOut 끝 >>>");
		return mav;
	
	}
	//회원탈퇴 deleteyn을 y로 변경
	@RequestMapping("/memberout")
	public ModelAndView memberOut(@ModelAttribute MemberVO param, HttpSession session) {
		log.info("MyPageController memberOut 시작 >>>");
		
		//MemberVO mvo = mypageService.deleteMember();
		
		ModelAndView mav = new ModelAndView();
		
		//mav.addObject("memberVO", mvo);
		mav.setViewName("/mypage/mypageOut");
		
		log.info("MyPageController memberOut 끝 >>>");
		return mav;
	
	}
	
}









