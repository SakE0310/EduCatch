package com.kosmo.educatch.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.FilePathManager;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.AcademyAddService;
import com.kosmo.educatch.service.LoginService;
import com.kosmo.educatch.service.ReviewService;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.PagingVO;
import com.kosmo.educatch.vo.ReviewVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class ReviewController {

	private Logger log = LoggerManager.getInstance().getLogger(ReviewController.class);

	@Autowired
	private ReviewService reviewService;
	
	// 파일경로 바꿔주는 싱글톤 객체
	private FilePathManager fManager = FilePathManager.getInstance();

	// 전체조회
	@RequestMapping("listReview.ec")
	public ModelAndView listReview(@ModelAttribute ReviewVO param, AcademyVO avo, HttpServletRequest request) {

		log.info("ReviewController listReview >>> 호출성공");
		log.info(param);
		log.info(param.getMember_mno());
		log.info(param.getRbcontent());

		// 페이지 사이즈, 그룹사이즈, 현재페이지, 전체 게시물 수를 선언
		String pagesize = "10";
		String groupsize = "5";
		String curpage = "1";
		String totalcount = "0";

		// 날짜 조회
		String startDate = param.getStartDate();
		String endDate = param.getEndDate();

		// 시작일 종료일 날짜형식 변환
		// startDate와 endDate가 null이면
		if (startDate == null && endDate == null) {
			startDate = "";
			endDate = "";
		} 
		// startDate와 endDate가 null이 아니면
		else {
			startDate = startDate.replace("/", "-");
			endDate = endDate.replace("/", "-");
			log.info("startDate>>>" + startDate);
			log.info("endDate>>>" + endDate);
		}

		if (request.getParameter("curpage") != null) {
			curpage = request.getParameter("curpage");
		}

		param.setPagesize(pagesize);
		param.setGroupsize(groupsize);
		param.setCurpage(curpage);
		param.setTotalcount(totalcount);

		List<ReviewVO> list = reviewService.listReview(param);
		log.info("list.size() >>> " + list.size());

		int listCnt = list.size();

		for (int i = 0; i < listCnt; i++) {
			ReviewVO rvo = (ReviewVO) list.get(i);

			log.info("rbno >>> " + rvo.getRbno());
			log.info("rbsubject >>> " + rvo.getRbsubject());
			log.info("rbname >>> " + rvo.getRbname());
			log.info("rbimg >>> " + rvo.getRbimg());
			log.info("rbcontent >>> " + rvo.getRbcontent());
			log.info("academyano >>> " + rvo.getAcademy_ano());
			log.info("membermno >>> " + rvo.getMember_mno());
			log.info("rbgrade >>> " + rvo.getRbgrade());
			log.info("rbdeleteyn >>> " + rvo.getRbdeleteyn());
			log.info("rbinsertdate >>> " + rvo.getRbinsertdate());
			log.info("rbupdatedate >>> " + rvo.getRbupdatedate());
			log.info("aname >>> " + rvo.getAname());

			log.info("pagesize >>> " + rvo.getPagesize());
			log.info("groupsize >>> " + rvo.getGroupsize());
			log.info("curpage >>> " + rvo.getCurpage());
			log.info("totalcount >>> " + rvo.getTotalcount());
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("listReview", list);
		mav.setViewName("community/reviewBoard/reviewBoard");

		log.info("mav >>> " + mav);
		log.info("ReviewController listReview >>> 끝");

		return mav;
	}

	// 검색 페이징
	@RequestMapping("searchList.ec")
	public ModelAndView searchReview(@ModelAttribute ReviewVO param, AcademyVO avo, HttpServletRequest request) {

		log.info("ReviewController searchList >>> 호출성공");
		log.info(param);
		log.info(param.getMember_mno());
		log.info(param.getRbcontent());

		String pagesize = "10";
		String groupsize = "5";
		String curpage = "1";
		String totalcount = "0";

		// 날짜 조회
		String startDate = param.getStartDate();
		String endDate = param.getEndDate();

		// 시작일 종료일 날짜형식 변환
		if (startDate == null && endDate == null) {
			startDate = "";
			endDate = "";
		} else {
			startDate = startDate.replace("/", "-");
			endDate = endDate.replace("/", "-");
			log.info("startDate>>>" + startDate);
			log.info("endDate>>>" + endDate);
		}

		if (request.getParameter("curpage") != null) {
			curpage = request.getParameter("curpage");
		}

		param.setPagesize(pagesize);
		param.setGroupsize(groupsize);
		param.setCurpage(curpage);
		param.setTotalcount(totalcount);

		List<ReviewVO> list = reviewService.searchList(param);
		log.info("list.size() >>> " + list.size());

		int listCnt = list.size();

		for (int i = 0; i < listCnt; i++) {
			ReviewVO rvo = (ReviewVO) list.get(i);

			log.info("rbno >>> " + rvo.getRbno());
			log.info("rbsubject >>> " + rvo.getRbsubject());
			log.info("rbname >>> " + rvo.getRbname());
			log.info("rbimg >>> " + rvo.getRbimg());
			log.info("rbcontent >>> " + rvo.getRbcontent());
			log.info("academyano >>> " + rvo.getAcademy_ano());
			log.info("membermno >>> " + rvo.getMember_mno());
			log.info("rbgrade >>> " + rvo.getRbgrade());
			log.info("rbdeleteyn >>> " + rvo.getRbdeleteyn());
			log.info("rbinsertdate >>> " + rvo.getRbinsertdate());
			log.info("rbupdatedate >>> " + rvo.getRbupdatedate());
			log.info("aname >>> " + rvo.getAname());

			log.info("pagesize >>> " + rvo.getPagesize());
			log.info("groupsize >>> " + rvo.getGroupsize());
			log.info("curpage >>> " + rvo.getCurpage());
			log.info("totalcount >>> " + rvo.getTotalcount());
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("searchList", list);
		mav.setViewName("community/reviewBoard/reviewBoard_search");

		log.info("mav >>> " + mav);
		log.info("ReviewController searchList >>> 끝");

		return mav;
	}

	// 글쓰기 버튼 눌렀을때
	@RequestMapping("/insertDisplay.ec")
	public ModelAndView insertDisplay(@ModelAttribute ReviewVO param, AcademyVO param1) {

		log.info("aname1 >>>> " + param1.getAname());
		log.info("ReviewController insertDisplay >>> 호출 성공 ");
		String aname = param1.getAname();

		ModelAndView mav = new ModelAndView();
		mav.addObject("aname", aname);
		mav.setViewName("community/reviewBoard/reviewInsert");

		return mav;

	}

	// 상세페이지에서 후기 글쓰기 버튼 눌렀을때
	@RequestMapping("/inserttDisplay.ec")
	public ModelAndView inserttDisplay(@ModelAttribute ReviewVO param, AcademyVO param1) {

		log.info("getAname >>>> " + param1.getAname());
		log.info("getAno >>>> " + param1.getAno());
		log.info("ReviewController insertDisplay >>> 호출 성공 ");
		String aname = param1.getAname();
		String ano = param1.getAno();

		ModelAndView mav = new ModelAndView();
		mav.addObject("aname", aname);
		mav.addObject("ano", ano);
		mav.setViewName("community/reviewBoard/reviewInsertt");

		return mav;

	}

	// 등록 버튼 눌렀을 때
	@RequestMapping("insertReview.ec")
	public ModelAndView insertReview(HttpServletRequest request, @ModelAttribute ReviewVO param,
			AcademyVO avo,  MemberVO mvo) {
		log.info("ReviewController insertReview >>> 호출 성공 ");

		log.info("membervo.getmid >>> " + mvo.getMid());
		String mid = null;
		String mno = null;
		String mname = null;
		String ano = null;
		String aname = null;
		String rbno = null;
		String rbsubject = null;
		String rbname = null;
		String rbimg = null;
		String rbcontent = null;
		String academy_ano = null;
		String member_mno = null;
		String rbgrade = null;
		String rbdeleteyn = null;
		String rbinsertdate = null;
		String rbupdatedate = null;
		String resultStr = "";

		ModelAndView mav = new ModelAndView();
		if (request.getContentType().toLowerCase().startsWith("multipart/form-data")) {
			log.info("multipart/form-data true");

			int size = 10 * 1024 * 1024;
			// 파일 경로
			String uploadPath = request.getServletContext().getRealPath("") + "/assets/img/reviewImg";

			try {
				MultipartRequest mr = new MultipartRequest(request, uploadPath, size, "UTF-8",
						new DefaultFileRenamePolicy());
				mid = mr.getParameter("mid");
				mno = mr.getParameter("mno");
				mname = mr.getParameter("mname");
				ano = mr.getParameter("ano");
				aname = mr.getParameter("aname");
				rbno = mr.getParameter("rbno");
				rbsubject = mr.getParameter("rbsubject");
				rbname = mr.getParameter("rbname");
				rbimg = mr.getParameter("rbimg");
				rbcontent = mr.getParameter("rbcontent");
				academy_ano = mr.getParameter("academy_ano");
				member_mno = mr.getParameter("member_mno");
				rbgrade = mr.getParameter("rbgrade");
				rbdeleteyn = mr.getParameter("rbdeleteyn");
				rbinsertdate = mr.getParameter("rbinsertdate");
				rbupdatedate = mr.getParameter("rbupdatedate");

				Enumeration<String> en = mr.getFileNames();
				List<String> list = new ArrayList<String>();

				while (en.hasMoreElements()) {
					String file1 = en.nextElement();
					list.add(mr.getFilesystemName(file1));

					log.info("fileName >>> " + rbimg);
				}

				mvo.setMid(mid);
				mvo.setMno(mno);
				mvo.setMname(mname);
				avo.setAno(ano);
				avo.setAname(aname);
				param.setRbno(rbno);
				param.setRbsubject(rbsubject);
				param.setRbname(rbname);
				param.setRbimg(list.get(0));
				param.setRbcontent(rbcontent);
				param.setAcademy_ano(academy_ano);
				param.setMember_mno(member_mno);
				param.setRbgrade(rbgrade);
				param.setRbdeleteyn(rbdeleteyn);
				param.setRbinsertdate(rbinsertdate);
				param.setRbupdatedate(rbupdatedate);

			} catch (Exception e) {
				log.info("Exception >>> " + e);
			}
		} else {
			log.info("multipart/form-data false");

		}

		AcademyVO avov = reviewService.academyAno(avo);
		MemberVO mvov = reviewService.memberMno(mvo);

		ano = avov.getAno();
		mno = mvov.getMno();
		param.setAcademy_ano(ano);
		param.setMember_mno(mno);

		log.info("<<<< ano >>>> " + ano);

		int nCnt = reviewService.insertReview(param);
		log.info("getRbgrade >" + param.getRbgrade());
		log.info("getRbsubject >" + param.getRbsubject());

		if (nCnt > 0) {
			resultStr = "등록 완료";
		} else {
			resultStr = "등록 실패";
		} // end of if-else

		mav.addObject("result", resultStr);
		mav.setViewName("community/reviewBoard/reviewInsertForm");

		log.info("ReviewController insertReview >>> 끝 ");
		return mav;

	}

	// 상세 조회
	@RequestMapping("/selectReview.ec")
	public ModelAndView selectReview(@ModelAttribute ReviewVO param) {
		// value="rbno", required=false
		log.info("ReviewController selectReview >>> 호출 성공");

		String rbno = (String) param.getRbno();
		ModelAndView mav = new ModelAndView();

		mav.addObject("ReviewVO", reviewService.selectReview(param));
		mav.setViewName("community/reviewBoard/detailReview");

		log.info("ReviewController selectReview >>> 끝");

		return mav;
	}

	// 업데이트 상세 조회
	@RequestMapping("/selectUpdate.ec")
	public ModelAndView selectUpdate(@ModelAttribute ReviewVO param, AcademyVO avo) {
		// value="rbno", required=false
		log.info("ReviewController selectUpdate >>> 호출 성공");
		
		String rbno = (String) param.getRbno();
		ModelAndView mav = new ModelAndView();

		mav.addObject("ReviewVOO", reviewService.selectUpdate(param));
		mav.setViewName("community/reviewBoard/updateReview");

		log.info("ReviewController selectUpdate >>> 끝");

		return mav;
	}

	// 수정 버튼 눌렀을 때
	@RequestMapping("/updateReview.ec")
	public ModelAndView updateReview(HttpServletRequest request, @ModelAttribute ReviewVO param) {
		log.info("ReviewController updateReview >>> 호출 성공");
		String resultStr = "";

		String rbno = null;
		String rbsubject = null;
		String rbname = null;
		String rbimg = null;
		String rbcontent = null;
		String academy_ano = null;
		String member_mno = null;
		String rbgrade = null;
		String rbdeleteyn = null;
		String rbinsertdate = null;
		String rbupdatedate = null;
		
		if (request.getContentType().toLowerCase().startsWith("multipart/form-data")) {
			log.info("multipart/form-data true");

			int size = 10 * 1024 * 1024;
			// 파일 경로
			String uploadPath = request.getServletContext().getRealPath("") + "/assets/img/reviewImg";

			try {
				MultipartRequest mr = new MultipartRequest(request, uploadPath, size, "UTF-8",
						new DefaultFileRenamePolicy());

				rbno = mr.getParameter("rbno");
				rbsubject = mr.getParameter("rbsubject");
				rbname = mr.getParameter("rbname");
				rbimg = mr.getParameter("rbimg2");
				rbcontent = mr.getParameter("rbcontent");
				academy_ano = mr.getParameter("academy_ano");
				member_mno = mr.getParameter("member_mno");
				rbgrade = mr.getParameter("rbgrade");
				rbdeleteyn = mr.getParameter("rbdeleteyn");
				rbinsertdate = mr.getParameter("rbinsertdate");
				rbupdatedate = mr.getParameter("rbupdatedate");

				Enumeration<String> en = mr.getFileNames();
				List<String> list = new ArrayList<String>();

				while (en.hasMoreElements()) {
					String file1 = en.nextElement();
					list.add(mr.getFilesystemName(file1));

					log.info("fileName >>> " + rbimg);
				}

				param.setRbno(rbno);
				param.setRbsubject(rbsubject);
				param.setRbname(rbname);
				param.setRbimg(list.get(0));
				param.setRbcontent(rbcontent);
				param.setAcademy_ano(academy_ano);
				param.setMember_mno(member_mno);
				param.setRbgrade(rbgrade);
				param.setRbdeleteyn(rbdeleteyn);
				param.setRbinsertdate(rbinsertdate);
				param.setRbupdatedate(rbupdatedate);

			} catch (Exception e) {
				log.info("Exception >>> " + e);
			}
		} else {
			log.info("multipart/form-data false");
			rbno = request.getParameter("rbno");
			rbsubject = request.getParameter("rbsubject");
			rbname = request.getParameter("rbname");
			rbimg = request.getParameter("rbimg1");
			rbcontent = request.getParameter("rbcontent");
			academy_ano = request.getParameter("academy_ano");
			member_mno = request.getParameter("member_mno");
			rbgrade = request.getParameter("rbgrade");
			rbdeleteyn = request.getParameter("rbdeleteyn");
			rbinsertdate = request.getParameter("rbinsertdate");
			rbupdatedate = request.getParameter("rbupdatedate");
			
			param.setRbno(rbno);
			param.setRbsubject(rbsubject);
			param.setRbname(rbname);
			param.setRbimg(rbimg);
			param.setRbcontent(rbcontent);
			param.setAcademy_ano(academy_ano);
			param.setMember_mno(member_mno);
			param.setRbgrade(rbgrade);
			param.setRbdeleteyn(rbdeleteyn);
			param.setRbinsertdate(rbinsertdate);
			param.setRbupdatedate(rbupdatedate);
		}

		int nCnt = reviewService.updateReview(param);

		ModelAndView mav = new ModelAndView();
		if (nCnt > 0) {
			resultStr = "update";
			log.info("수정완료");
			mav.addObject("ReviewVOO", param);
		} else {
			resultStr = "update";
			log.info("수정실패");
		}
		mav.addObject("result", resultStr);
		mav.setViewName("community/reviewBoard/result");
		log.info("ReviewController updateReview >>> 끝");

		return mav;
	}

	// 삭제 버튼 눌렀을 때
	@RequestMapping("/deleteReview.ec")
	public ModelAndView deleteReview(@ModelAttribute ReviewVO param) {
		log.info("ReviewController deleteReview >>> 호출 성공");

		String resultStr = "";
		String isSuccess = "";
		String rbno = (String) param.getRbno();

		int nCnt = reviewService.deleteReview(param);

		ModelAndView mav = new ModelAndView();
		if (nCnt > 0) {
			resultStr = "delete";
			isSuccess = "true";
			log.info("삭제완료");

		} else {
			resultStr = "delete";
			isSuccess = "false";
			log.info("삭제실패");
		}

		mav.addObject("result", resultStr);
		mav.addObject("isSuccess", isSuccess);
		mav.setViewName("community/reviewBoard/result");

		log.info("ReviewController deleteReview >>> 끝");

		return mav;
	}

	// 학원리스트 조회
	@RequestMapping("academyList.ec")
	public ModelAndView academyList(@ModelAttribute AcademyVO param) {

		log.info("ReviewController academyList >>> 호출성공");

		List<AcademyVO> list = reviewService.academyList(param);
		log.info("list.size() >>> " + list.size());

		int listCnt = list.size();

		for (int i = 0; i < listCnt; i++) {
			AcademyVO avo = (AcademyVO) list.get(i);

			log.info("avo.getAaddr1()	>>" + avo.getAaddr1());
			log.info("avo.getAno()		>>" + avo.getAno());
			log.info("avo.getAname()	>>" + avo.getAname());
			log.info("avo.getAdeleteyn()	>>" + avo.getAdeleteyn());
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("academyList", list);
		mav.setViewName("community/reviewBoard/search_pop");

		log.info("mav >>> " + mav);
		log.info("ReviewController academyList >>> 끝");

		return mav;
	}

}
