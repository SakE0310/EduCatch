package com.kosmo.educatch.controller;

import java.util.Enumeration;
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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	public ModelAndView getManageAcaPage(@ModelAttribute AcademyVO avo, HttpSession session, SubjectVO svo, ConvenienceVO cvo) {
		log.info("ManageController getManagePage >>> ");
		
		MemberVO mvo = null;
		String member_mno="";
		if(session != null) {
			mvo = (MemberVO)session.getAttribute("user");
			member_mno = mvo.getMno();
		}
		
		avo.setMno(member_mno);
		svo.setMno(member_mno);
		cvo.setMno(member_mno);

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
	public ModelAndView manageInsertSubject(HttpSession session, HttpServletRequest request, SubjectVO svo, AcademyVO avo,
			ConvenienceVO cvo) {
		log.info("ManageController manageInsertSubject >>> ");
		MemberVO mvo = null;
		String member_mno="";
		if(session != null) {
			mvo = (MemberVO)session.getAttribute("user");
			member_mno = mvo.getMno();
		}
		
		avo.setMno(member_mno);
		svo.setMno(member_mno);
		cvo.setMno(member_mno);
		
		
		int i = manageService.insertSubject(svo);

		List<AcademyVO> academylist = manageService.academyManageView(avo);
		List<SubjectVO> subjectlist = manageService.subjectManageView(svo);
		List<ConvenienceVO> conlist = manageService.conManageView(cvo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("academylist", academylist);
		mav.addObject("subjectlist", subjectlist);
		mav.addObject("conlist", conlist);
		if (i > 0) {
			mav.addObject("resultStr", "등록 성공");
			mav.setViewName("manage/academyManage");
		} else {
			mav.addObject("resultStr", "등록 실패");
			mav.setViewName("manage/academyManage");
		}

		log.info("ManageController manageInsertSubject 끝>>> ");

		return mav;
	}
	
	@RequestMapping("manageUpdateSubject")
	public ModelAndView manageUpdateSubject(HttpSession session, HttpServletRequest request, SubjectVO svo, AcademyVO avo,
			ConvenienceVO cvo) {
		log.info("ManageController manageUpdateSubject >>> ");
		MemberVO mvo = null;
		String member_mno="";
		if(session != null) {
			mvo = (MemberVO)session.getAttribute("user");
			member_mno = mvo.getMno();
		}
		
		avo.setMno(member_mno);
		svo.setMno(member_mno);
		cvo.setMno(member_mno);
		
		
		int i = manageService.updateSubject(svo);

		List<AcademyVO> academylist = manageService.academyManageView(avo);
		List<SubjectVO> subjectlist = manageService.subjectManageView(svo);
		List<ConvenienceVO> conlist = manageService.conManageView(cvo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("academylist", academylist);
		mav.addObject("subjectlist", subjectlist);
		mav.addObject("conlist", conlist);
		
		if (i > 0) {
			mav.addObject("resultStr", "수정 성공");
			mav.setViewName("manage/academyManage");
		} else {
			mav.addObject("resultStr", "수정 실패");
			mav.setViewName("manage/academyManage");
		}

		log.info("ManageController manageUpdateSubject 끝>>> ");
		
		return mav;
	}
	
	@RequestMapping("manageDeleteSubject")
	public ModelAndView manageDeleteSubject(HttpSession session, HttpServletRequest request, SubjectVO svo, AcademyVO avo,
			ConvenienceVO cvo) {
		log.info("ManageController manageDeleteSubject >>> ");
		MemberVO mvo = null;
		String member_mno="";
		if(session != null) {
			mvo = (MemberVO)session.getAttribute("user");
			member_mno = mvo.getMno();
		}
		
		avo.setMno(member_mno);
		svo.setMno(member_mno);
		cvo.setMno(member_mno);
		
		
		int i = manageService.deleteSubject(svo);

		List<AcademyVO> academylist = manageService.academyManageView(avo);
		List<SubjectVO> subjectlist = manageService.subjectManageView(svo);
		List<ConvenienceVO> conlist = manageService.conManageView(cvo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("academylist", academylist);
		mav.addObject("subjectlist", subjectlist);
		mav.addObject("conlist", conlist);
		
		if (i > 0) {
			mav.addObject("resultStr", "삭제 성공");
			mav.setViewName("manage/academyManage");
		} else {
			mav.addObject("resultStr", "삭제 실패");
			mav.setViewName("manage/academyManage");
		}

		log.info("ManageController manageDeleteSubject 끝>>> ");
		
		return mav;
	}

	@RequestMapping("manageUpdateAcademy")
	public ModelAndView manageUpdateAcademy(@ModelAttribute AcademyVO avo, SubjectVO svo, ConvenienceVO cvo,
			HttpSession session, HttpServletRequest request ) {
		log.info("ManageController manageUpdateAcademy >>> 시작");

		String ano = null;
		String aname = null;
		String atel = null;
		String axpoint = null;
		String aypoint = null;
		String aaddrno = null;
		String aaddr1 = null;
		String aaddr2 = null;
		String alogo = null;
		String file = null;
		int i=0;

		ModelAndView mav = new ModelAndView();

		// 멀티파트 폼데이터인지 확인하기 위함
		// 멀티파트 폼데이터면 파일 전송을 실시
		if (request.getContentType().toLowerCase().startsWith("multipart/form-data")) {
			log.info("multipart/form-data true");

			// file삽입경로 (변경필수)
			String uploadPath = "C://Users//kosmo_26//git//EduCatch//EduCatch//WebContent//assets//img//academyLogo";
			// file 최대크기
			int size = 10 * 1024 * 1024;
			// multipart로 파일을 업로드 후 각 데이터셋팅
			try {
				MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
						new DefaultFileRenamePolicy());

				ano = multi.getParameter("ano");
				aname = multi.getParameter("aname");
				atel = multi.getParameter("atel");
				axpoint = multi.getParameter("axpoint");
				aypoint = multi.getParameter("aypoint");
				aaddrno = multi.getParameter("aaddrno");
				aaddr1 = multi.getParameter("aaddr1");
				aaddr2 = multi.getParameter("aaddr2");
				alogo = multi.getParameter("alogo");

				log.info("multi >>> " + multi);

				Enumeration en = multi.getFileNames();
				while (en.hasMoreElements()) {
					String file1 = (String) en.nextElement();
					file = multi.getFilesystemName(file1);
					log.info("fileName >>> " + file);
				}
				
				avo.setAno(ano);
				avo.setAname(aname);
				avo.setAtel(atel);
				avo.setAxpoint(axpoint);
				avo.setAypoint(aypoint);
				avo.setAaddrno(aaddrno);
				avo.setAaddr1(aaddr1);
				avo.setAaddr2(aaddr2);
				avo.setAlogo(file);

				i = manageService.updateAcademy(avo);
			} catch (Exception e) {
				log.info("에러>>>>" + e.getMessage());
			} // end of try-catch

			// 멀티파트 폼데이터가 아닐경우 파일 전송없이 매핑
		} else {
			log.info("multipart/form-data false");

			ano = request.getParameter("ano");
			aname = request.getParameter("aname");
			atel = request.getParameter("atel");
			axpoint = request.getParameter("axpoint");
			aypoint = request.getParameter("aypoint");
			aaddrno = request.getParameter("aaddrno");
			aaddr1 = request.getParameter("aaddr1");
			aaddr2 = request.getParameter("aaddr2");
			
			avo.setAno(ano);
			avo.setAname(aname);
			avo.setAtel(atel);
			avo.setAxpoint(axpoint);
			avo.setAypoint(aypoint);
			avo.setAaddrno(aaddrno);
			avo.setAaddr1(aaddr1);
			avo.setAaddr2(aaddr2);
			i = manageService.updateAcademyNoImg(avo);
		}

		log.info("ano >>> " + ano);
		log.info("aname >>> " + aname);
		log.info("axpoint >>> " + axpoint);
		log.info("aypoint >>> " + aypoint);
		log.info("aaddrno >>> " + aaddrno);
		log.info("aaddr1 >>> " + aaddr1);
		log.info("aaddr2 >>> " + aaddr2);
		log.info("alogo >>> " + alogo);

		
		
		MemberVO mvo = null;
		String member_mno="";
		if(session != null) {
			mvo = (MemberVO)session.getAttribute("user");
			member_mno = mvo.getMno();
		}
		
		avo.setMno(member_mno);
		svo.setMno(member_mno);
		cvo.setMno(member_mno);

		List<AcademyVO> academylist = manageService.academyManageView(avo);
		List<SubjectVO> subjectlist = manageService.subjectManageView(svo);
		List<ConvenienceVO> conlist = manageService.conManageView(cvo);
		mav.addObject("academylist", academylist);
		mav.addObject("subjectlist", subjectlist);
		mav.addObject("conlist", conlist);


		if (i > 0) {
			mav.addObject("resultStr", "수정 완료");
		} else {
			mav.addObject("resultStr", "수정 실패");
		}

		mav.setViewName("manage/academyManage");

		log.info("ManageController manageUpdateAcademy >>> 끝");
		return mav;
	}
	
	
	
	@RequestMapping("manageUpdateConvenience")
	public ModelAndView manageUpdateConvenience(@ModelAttribute AcademyVO avo, SubjectVO svo, ConvenienceVO cvo,
			HttpSession session, HttpServletRequest request) {
		log.info("ManageController manageUpdateConvenience >>> 시작");
		log.info("ManageController manageUpdateConvenience >>> 시작");
		ModelAndView mav = new ModelAndView();
		
		String academy_ano = request.getParameter("academy_ano");
		String acparking = request.getParameter("acparking");
		String acstore = request.getParameter("acstore");
		String acbus = request.getParameter("acbus");
		String acelevator = request.getParameter("acelevator");
		String acstudyroom = request.getParameter("acstudyroom");
		String aclounge = request.getParameter("aclounge");
		String aclocker = request.getParameter("aclocker");
		
		
		if(acparking !=null) {
			cvo.setAcparking(acparking);
		}else {
			acparking = "N";
			cvo.setAcparking(acparking);
		}
		
		
		if(acstore !=null) {
			cvo.setAcstore(acstore);
		}else {
			acstore = "N";
			cvo.setAcstore(acstore);
		}
		
		
		if(acbus !=null) {
			cvo.setAcbus(acbus);
		}else {
			acbus = "N";
			cvo.setAcbus(acbus);
		}
		
		
		if(acelevator !=null) {
			cvo.setAcelevator(acelevator);
		}else {
			acelevator = "N";
			cvo.setAcelevator(acelevator);
		}
		
		
		if(acstudyroom !=null) {
			cvo.setAcstudyroom(acstudyroom);
		}else {
			acstudyroom = "N";
			cvo.setAcstudyroom(acstudyroom);
		}
		
		
		if(aclounge !=null) {
			cvo.setAclounge(aclounge);
		}else {
			aclounge = "N";
			cvo.setAclounge(aclounge);
		}
		
		
		if(aclocker !=null) {
			cvo.setAclocker(aclocker);
		}else {
			aclocker = "N";
			cvo.setAclocker(aclocker);
		}
		
		log.info("academy_ano >>> " + academy_ano);
		log.info("acparking >>> " + acparking);
		log.info("acstore >>> " + acstore);
		log.info("acbus >>> " + acbus);
		log.info("acelevator >>> " + acelevator);
		log.info("acstudyroom >>> " + acstudyroom);
		log.info("aclounge >>> " + aclounge);
		log.info("aclocker >>> " + aclocker);
		

		log.info("시작");
		int i = manageService.updateConvenience(cvo);
		log.info("끝");
		
		MemberVO mvo = null;
		String member_mno="";
		if(session != null) {
			mvo = (MemberVO)session.getAttribute("user");
			member_mno = mvo.getMno();
		}
		
		avo.setMno(member_mno);
		svo.setMno(member_mno);
		cvo.setMno(member_mno);
		
		List<AcademyVO> academylist = manageService.academyManageView(avo);
		List<SubjectVO> subjectlist = manageService.subjectManageView(svo);
		List<ConvenienceVO> conlist = manageService.conManageView(cvo);
		mav.addObject("academylist", academylist);
		mav.addObject("subjectlist", subjectlist);
		mav.addObject("conlist", conlist);

		if (i > 0) {
			mav.addObject("resultStr", "수정 완료");
		} else {
			mav.addObject("resultStr", "수정 실패");
		}

		mav.setViewName("manage/academyManage");
		log.info("ManageController manageUpdateConvenience >>> 끝");
		return mav;

	}
	
	@ResponseBody
	@RequestMapping("selectOneSubject")
	public Map<String, SubjectVO> selectOneSubject(HttpServletRequest request) {
		log.info("ManageController selectOneSubject >>> 시작");
		
		String sno = request.getParameter("sno");
		log.info("sno >>>>" + sno);
		SubjectVO svo = new SubjectVO();
		svo = manageService.selectOneSubject(sno);
		log.info("svo >>> " + svo);
		
		Map<String, SubjectVO> map = new HashMap<String, SubjectVO>();
		map.put("svo", svo);
		
		log.info("ManageController selectOneSubject >>> 끝");
		return map;
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
	public Map<String, List<MemberVO>> getAcademyMember() {
		Map<String, List<MemberVO>> map = new HashMap<String, List<MemberVO>>();
		MemberVO mvo = new MemberVO();

		// 세션 적용하면 바꿔야함
		mvo.setAno("A00001");
		List<MemberVO> list = manageService.getAcaAccept(mvo);
		map.put("vo", list);
		return map;
	}

	@ResponseBody
	@RequestMapping("acceptAca")
	public Map<String, String> acceptAcaMember(@RequestBody String json) {
		log.info("ManageController acceptAca >>> ");
		ObjectMapper objMapper = new ObjectMapper();
		Map<String, List<Map<String, String>>> map = null;

		try {
			map = objMapper.readValue(json, new TypeReference<Map<String, List<Map<String, String>>>>() {
			});
		} catch (Exception e) {
			log.info("json parse error >>> " + e.getMessage());
		}

		List<Map<String, String>> list = map.get("data");
		int cnt = 0;
		MemberVO mvo = null;
		mvo = new MemberVO();

		for (int i = 0; i < list.size(); i++) {
			Map<String, String> data = list.get(i);
			mvo.setMno(data.get("mno"));
			log.info(mvo.getMno());
			cnt += manageService.setAcceptAcaMem(mvo);
		}

		Map<String, String> rmap = new HashMap<String, String>();
		if (cnt == list.size()) {
			rmap.put("result", "success");
		}

		log.info("ManageController acceptAca end >>> ");
		return rmap;
	}

	@ResponseBody
	@RequestMapping("rejectAca")
	public Map<String, String> rejectAcaMember(@RequestBody String json) {
		log.info("ManageController rejectAcaMember >>> ");

		ObjectMapper objMapper = new ObjectMapper();
		Map<String, List<Map<String, String>>> map = null;

		try {
			map = objMapper.readValue(json, new TypeReference<Map<String, List<Map<String, String>>>>() {
			});
		} catch (Exception e) {
			log.info("json parse error >>> " + e.getMessage());
		}

		List<Map<String, String>> list = map.get("data");
		int cnt = 0;
		MemberVO mvo = null;
		mvo = new MemberVO();

		for (int i = 0; i < list.size(); i++) {
			Map<String, String> data = list.get(i);
			mvo.setMno(data.get("mno"));
			log.info(mvo.getMno());
			cnt += manageService.delAcaMem(mvo);
		}

		Map<String, String> rmap = new HashMap<String, String>();
		if (cnt == list.size()) {
			rmap.put("result", "success");
		}

		log.info("ManageController rejectAcaMember end >>> ");
		return rmap;
	}

	@ResponseBody
	@RequestMapping("selectReser")
	public Map<String, List<TimetableVO>> selectReservation(HttpServletRequest request) {
		log.info("ManageController selectReservation >>> ");
		log.info("requeset >>> " + request.getParameter("date"));
		MemberVO mvo = new MemberVO();

		// 세션 적용하면 바꿔야함
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
	public Map<String, List<MemberVO>> selectMemberList(HttpServletRequest request) {
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
	public Map<String, String> insertTimeTable(HttpServletRequest request) {
		log.info("ManageController insertTimeTable >>> ");

		TimetableVO tvo = new TimetableVO();
		tvo.setTtdate(request.getParameter("date"));
		tvo.setTttime(request.getParameter("time"));
		tvo.setTtpeople(request.getParameter("people"));
		// 세션 적용하면 바꿀부분
		tvo.setAcademy_ano("A00001");
		int i = manageService.insertTimetable(tvo);
		Map<String, String> map = new HashMap<String, String>();
		if (i > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "failed");
		}
		log.info("ManageController insertTimeTable end >>> ");
		return map;
	}

	@ResponseBody
	@RequestMapping("updateTimeTable")
	public Map<String, String> updateTimeTable(HttpServletRequest request) {
		log.info("ManageController updateTimeTable >>> ");

		TimetableVO tvo = new TimetableVO();
		tvo.setTtno(request.getParameter("ttno"));
		tvo.setTttime(request.getParameter("time"));
		tvo.setTtpeople(request.getParameter("people"));
		int i = manageService.updateTimetable(tvo);
		Map<String, String> map = new HashMap<String, String>();
		if (i > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "failed");
		}
		log.info("ManageController updateTimeTable end >>> ");
		return map;
	}

	@ResponseBody
	@RequestMapping("deleteTimeTable")
	public Map<String, String> deleteTimeTable(HttpServletRequest request) {
		log.info("ManageController deleteTimeTable >>> ");

		TimetableVO tvo = new TimetableVO();
		tvo.setTtno(request.getParameter("ttno"));
		int i = manageService.deleteTimetable(tvo);
		Map<String, String> map = new HashMap<String, String>();
		if (i > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "failed");
		}
		log.info("ManageController deleteTimeTable end >>> ");
		return map;
	}
}
