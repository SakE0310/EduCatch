package com.kosmo.educatch.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.kosmo.educatch.vo.CountVO;
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

	// manage 홈연결
	@RequestMapping("manage")
	public ModelAndView getManagePage() {
		log.info("ManageController getManagePage >>> ");

		ModelAndView mv = new ModelAndView();
		mv.setViewName("manage/manageHome");

		return mv;
	}

	// 학원관리 페이지 조회
	@RequestMapping("manageAca")
	public ModelAndView getManageAcaPage(@ModelAttribute AcademyVO avo, HttpSession session, SubjectVO svo, ConvenienceVO cvo, HttpServletRequest request) {
		log.info("ManageController getManagePage >>> ");
		
		MemberVO mvo = null;
		String member_mno="";
		if(session != null) {
			mvo = (MemberVO)session.getAttribute("user");
			member_mno = mvo.getAcademy_ano();
		}
		log.info(request.getServletContext().getRealPath(""));
		avo.setAno(member_mno);
		svo.setAno(member_mno);
		cvo.setAno(member_mno);

		List<AcademyVO> academylist = manageService.academyManageView(avo);
		List<SubjectVO> subjectlist = manageService.subjectManageView(svo);
		List<ConvenienceVO> conlist = manageService.conManageView(cvo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("academylist", academylist);
		mv.addObject("subjectlist", subjectlist);
		mv.addObject("conlist", conlist);
		mv.setViewName("manage/academyManage2");

		return mv;
	}
	
	// 학원관리 페이지
	@RequestMapping("acmb.ec")
	public ModelAndView getManageAcaPage1(@ModelAttribute AcademyVO avo, HttpSession session, SubjectVO svo, ConvenienceVO cvo) {
		log.info("ManageController getManagePage >>> ");
		
		MemberVO mvo = null;
		String member_mno="";
		if(session != null) {
			mvo = (MemberVO)session.getAttribute("user");
			member_mno = mvo.getAcademy_ano();
		}
		
		avo.setAno(member_mno);
		svo.setAno(member_mno);
		cvo.setAno(member_mno);

		List<AcademyVO> academylist = manageService.academyManageView(avo);
		List<SubjectVO> subjectlist = manageService.subjectManageView(svo);
		List<ConvenienceVO> conlist = manageService.conManageView(cvo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("academylist", academylist);
		mv.addObject("subjectlist", subjectlist);
		mv.addObject("conlist", conlist);
		mv.setViewName("manage/academyManage2");

		return mv;
	}
	// 학원관리 페이지
	@RequestMapping("acmb2.ec")
	public ModelAndView getManageAcaPage2(@ModelAttribute AcademyVO avo, HttpSession session, SubjectVO svo, ConvenienceVO cvo, HttpServletRequest request) {
		log.info("ManageController getManagePage >>> ");
		
		MemberVO mvo = null;
		String member_mno=request.getParameter("ano");
		log.info("ano >>> " + member_mno);
		avo.setAno(member_mno);
		svo.setAno(member_mno);
		cvo.setAno(member_mno);

		List<AcademyVO> academylist = manageService.academyManageView(avo);
		List<SubjectVO> subjectlist = manageService.subjectManageView(svo);
		List<ConvenienceVO> conlist = manageService.conManageView(cvo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("academylist", academylist);
		mv.addObject("subjectlist", subjectlist);
		mv.addObject("conlist", conlist);
		mv.setViewName("manage/acaManageBody");

		return mv;
	}

	// 학원관리 과목정보 등록 ajax 연결부분
	@ResponseBody
	@RequestMapping("manageInsertSubject.ec")
	public Map<String, String> manageInsertSubject(HttpServletRequest request, SubjectVO svo) {
		log.info("ManageController manageInsertSubject >>> ");
		
		String ano=request.getParameter("academy_ano");
		svo.setSname(request.getParameter("sname"));
		svo.setSday(request.getParameter("sday"));
		svo.setStime(request.getParameter("stime"));
		svo.setSprice(request.getParameter("sprice"));
		svo.setSpeople(request.getParameter("speople"));
		svo.setSno(request.getParameter("sno"));

		svo.setAcademy_ano(ano);
		
		int i = manageService.insertSubject(svo);
		
		Map<String, String> map = new HashMap<String, String>();
		if(i >0) {
			map.put("result", "success");
		}

		log.info("ManageController manageInsertSubject 끝>>> ");

		return map;
	}
	
	// 학원관리 과목정보 수정 ajax 연결부분
	@ResponseBody
	@RequestMapping("manageUpdateSubject")
	public Map<String, String> manageUpdateSubject(HttpServletRequest request, SubjectVO svo) {
		log.info("ManageController manageUpdateSubject >>> ");
		
		svo.setSname(request.getParameter("sname"));
		svo.setSday(request.getParameter("sday"));
		svo.setStime(request.getParameter("stime"));
		svo.setSprice(request.getParameter("sprice"));
		svo.setSpeople(request.getParameter("speople"));
		svo.setSno(request.getParameter("sno"));
		
		log.info("svo >>> " + svo);
		int i = manageService.updateSubject(svo);

		Map<String, String> map = new HashMap<String, String>();
		if(i >0) {
			map.put("result", "success");
		}

		log.info("ManageController manageUpdateSubject 끝>>> ");
		
		return map;
	}
	
	// 학원관리 과목정보 삭제 ajax 연결부분
	@ResponseBody
	@RequestMapping("manageDeleteSubject")
	public Map<String, String> manageDeleteSubject(HttpServletRequest request, SubjectVO svo) {
		log.info("ManageController manageDeleteSubject >>> ");
		
		svo.setSno(request.getParameter("sno"));
		
		
		int i = manageService.deleteSubject(svo);

		
		Map<String, String> map = new HashMap<String, String>();
		if(i >0) {
			map.put("result", "success");
		}

		log.info("ManageController manageDeleteSubject 끝>>> ");
		
		return map;
	}

	// 학원관리 학원정보 수정 ajax 연결부분
	@ResponseBody
	@RequestMapping("manageUpdateAcademy")
	public Map<String, Boolean> manageUpdateAcademy(AcademyVO avo, HttpServletRequest request) {
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

		// 멀티파트 폼데이터인지 확인하기 위함
		// 멀티파트 폼데이터면 파일 전송을 실시
		if (request.getContentType().toLowerCase().startsWith("multipart/form-data")) {
			log.info("multipart/form-data true");

			// file삽입경로 (변경필수)
			String uploadPath = request.getServletContext().getRealPath("") + "/assets/img/academyLogo";
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

		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if(i >0) {
			map.put("isSuccess", true);
		}else {
			map.put("isSuccess", true);
		}

		log.info("ManageController manageUpdateAcademy >>> 끝");
		return map;
	}
	
	
	// 학원관리 학원편의기능 수정 ajax 연결부분
	@ResponseBody
	@RequestMapping("manageUpdateConvenience")
	public Map<String, String> manageUpdateConvenience(ConvenienceVO cvo, HttpServletRequest request) {
		log.info("ManageController manageUpdateConvenience >>> 시작");
		
		String academy_ano = request.getParameter("academy_ano");
		String acparking = request.getParameter("acparking");
		String acstore = request.getParameter("acstore");
		String acbus = request.getParameter("acbus");
		String acelevator = request.getParameter("acelevator");
		String acstudyroom = request.getParameter("acstudyroom");
		String aclounge = request.getParameter("aclounge");
		String aclocker = request.getParameter("aclocker");
		
		cvo.setAcademy_ano(academy_ano);
		cvo.setAcparking(acparking);
		cvo.setAcstore(acstore);
		cvo.setAcbus(acbus);
		cvo.setAcelevator(acelevator);
		cvo.setAcstudyroom(acstudyroom);
		cvo.setAclounge(aclounge);
		cvo.setAclocker(aclocker);
		
		log.info("academy_ano >>> " + academy_ano);
		log.info("acparking >>> " + acparking);
		log.info("acstore >>> " + acstore);
		log.info("acbus >>> " + acbus);
		log.info("acelevator >>> " + acelevator);
		log.info("acstudyroom >>> " + acstudyroom);
		log.info("aclounge >>> " + aclounge);
		log.info("aclocker >>> " + aclocker);
		
		int i = manageService.updateConvenience(cvo);
		
		Map<String, String> map = new HashMap<String, String>();
		if(i >0) {
			map.put("isSuccess", "success");
		}

		log.info("ManageController manageUpdateConvenience >>> 끝");
		return map;

	}
	
	// 학원관리 학원과목 조회 ajax 연결부분
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
	
	// 학원관리 학원편의기능 조회 ajax 연결부분
	@ResponseBody
	@RequestMapping("selectOneConvenienice")
	public Map<String, ConvenienceVO> selectOneConvenience(HttpServletRequest request) {
		log.info("ManageController selectOneConvenience >>> 시작");
		
		String academy_ano = request.getParameter("academy_ano");
		log.info("academy_ano >>>>" + academy_ano);
		ConvenienceVO cvo = new ConvenienceVO();
		cvo = manageService.selectOneConvenience(academy_ano);
		log.info("cvo >>> " + cvo);
		
		Map<String, ConvenienceVO> map = new HashMap<String, ConvenienceVO>();
		map.put("cvo", cvo);
		
		log.info("ManageController selectOneConvenience >>> 끝");
		return map;
	}

	// 상담예약관리 페이지 연결부분
	@RequestMapping("manageReserChk")
	public ModelAndView getManageReserChkPage() {
		log.info("ManageController getManagePage >>> ");

		ModelAndView mv = new ModelAndView();
		mv.setViewName("manage/reservationCheck");

		return mv;
	}

	
	// 학원회원 승인 페이지 연결
	@RequestMapping("manageAcaMem")
	public ModelAndView getManageAcaMemPage() {
		log.info("ManageController getManagePage >>> ");

		ModelAndView mv = new ModelAndView();
		mv.setViewName("manage/academyMemberAccept");

		return mv;
	}
	// 학원정보등록 페이지 연결
	@RequestMapping("addAca")
	public ModelAndView getAddAcaPage() {
		log.info("ManageController getAddAcaPage >>> ");

		ModelAndView mv = new ModelAndView();
		mv.setViewName("manage/addAcademy");

		return mv;
	}

	// 학원회원 승인 데이터 ajax 연결부분
	@ResponseBody
	@RequestMapping("getAcaMem")
	public Map<String, List<MemberVO>> getAcademyMember() {
		Map<String, List<MemberVO>> map = new HashMap<String, List<MemberVO>>();
		MemberVO mvo = new MemberVO();
		
		List<MemberVO> list = manageService.getAcaAccept();
		map.put("vo", list);
		return map;
	}

	// 학원회원승인 부분 
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

	// 학원회원 거절부분
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

	// 학원예약 정보 부분
	@ResponseBody
	@RequestMapping("selectReser")
	public Map<String, List<TimetableVO>> selectReservation(HttpServletRequest request) {
		log.info("ManageController selectReservation >>> ");
		log.info("requeset >>> " + request.getParameter("date"));
		MemberVO mvo = new MemberVO();

		// 세션 적용하면 바꿔야함
		mvo.setAno(request.getParameter("ano"));
		mvo.setMinsertdate(request.getParameter("date"));
		List<TimetableVO> list = manageService.selectReservation(mvo);
		Map<String, List<TimetableVO>> map = new HashMap<String, List<TimetableVO>>();
		map.put("data", list);
		log.info("ManageController selectReservation end >>> ");
		return map;
	}

	// 학원예약 상세보기 회원부분
	@ResponseBody
	@RequestMapping("selectMemList")
	public Map<String, List<MemberVO>> selectMemberList(HttpServletRequest request) {
		log.info("ManageController selectMemberList >>> ");
		List<MemberVO> list = manageService.selectMemList(request.getParameter("ttno"), request.getParameter("ano"));
		log.info(list);
		Map<String, List<MemberVO>> map = new HashMap<String, List<MemberVO>>();
		map.put("list", list);
		log.info("ManageController selectMemberList end >>> ");
		return map;
	}

	// 학원예약 시간 추가 부분
	@ResponseBody
	@RequestMapping("insertTimeTable")
	public Map<String, String> insertTimeTable(HttpServletRequest request) {
		log.info("ManageController insertTimeTable >>> ");

		TimetableVO tvo = new TimetableVO();
		tvo.setTtdate(request.getParameter("date"));
		tvo.setTttime(request.getParameter("time"));
		tvo.setTtpeople(request.getParameter("people"));
		// 세션 적용하면 바꿀부분
		tvo.setAcademy_ano(request.getParameter("ano"));
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

	// 학원예약 시간 수정부분
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

	// 학원예약 시간 삭제부분
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
	
	//학원관리 학원리스트 조회
	@ResponseBody
	@RequestMapping("getAcaListManage")
	public Map<String,List<AcademyVO>> getAcademyList(HttpServletRequest request){
		log.info("ManageController getAcaListManager >>> ");
		String district = request.getParameter("district");
		String city = request.getParameter("city");
		log.info("dist >> " + district);
		log.info("city >> " + city);
		city = city.split(" ")[0];
		AcademyVO vo = new AcademyVO();
		vo.setDistrict(district);
		vo.setCity(city);
		log.info("a");
		Map<String, List<AcademyVO>> map = new HashMap<String, List<AcademyVO>>();
		List<AcademyVO> list = manageService.getAcaListManage(vo);
		map.put("acaList", list);
		log.info("ManageController getAcaListManager <<< ");
		return map;
	}
	
	//학원 평균 수강료
	@ResponseBody
	@RequestMapping("getAvgPrice")
	public Map<String, List<HashMap<String,String>>> getAvgPrice(){
		log.info("Manager getAvgPrice >>> ");
		List<HashMap<String,String>> list = manageService.getAvgPrice();
		Map<String, List<HashMap<String,String>>> map = new HashMap<String, List<HashMap<String,String>>>();
		map.put("avgList", list);
		log.info("list >>> " + list);
		log.info("Manager getAvgPrice <<< ");
		return map;
	}
	
	// 회원타입
	@ResponseBody
	@RequestMapping("getMemType")
	public Map<String, List<HashMap<String, String>>> getMemType(){
		log.info("Manager getMemType >>> ");
		List<HashMap<String,String>> list = manageService.getMemType();
		Map<String, List<HashMap<String,String>>> map = new HashMap<String, List<HashMap<String,String>>>();
		map.put("memType", list);
		log.info("list >>> " + list);
		log.info("Manager getMemType <<< ");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("getAcaStat")
	public Map<String, List<HashMap<String, String>>> getAcaStat(){
		log.info("Manager getAcaStat >>> ");
		List<HashMap<String,String>> list = manageService.getAcaStat();
		Map<String, List<HashMap<String,String>>> map = new HashMap<String, List<HashMap<String,String>>>();
		map.put("acaStat", list);
		log.info("list >>> " + list);
		log.info("Manager getAcaStat <<< ");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("getPostCnt")
	public Map<String, List<HashMap<String, String>>> getPostCnt(){
		log.info("Manager getPostCnt >>> ");
		List<HashMap<String,String>> list = manageService.getPostCnt();
		Map<String, List<HashMap<String,String>>> map = new HashMap<String, List<HashMap<String,String>>>();
		map.put("getPostCnt", list);
		log.info("list >>> " + list);
		log.info("Manager getPostCnt <<< ");
		return map;
	}
	
	// 월별 평점 및 상담현황
	@ResponseBody
	@RequestMapping("getMonCnt")
	public Map<String, List<String>> getMonConCnt(HttpServletRequest request) {
		log.info("ManageController getMonConCnt >>> ");
		String ano = request.getParameter("ano");
		String date = String.valueOf(LocalDate.now().getYear());
		int end = LocalDate.now().getMonth().getValue();
		CountVO cvo = new CountVO();
		if(end/10 != 1) {
			cvo.setEndDate(date+"-0"+end);
		}else {
			cvo.setEndDate(date+"-"+end);
		}
		cvo.setAno(ano);
		cvo.setStartDate(date+"-01");
		log.info("date >>> " + date);
		List<CountVO> monConCnt = manageService.getMonConCnt(cvo);
		List<CountVO> monResCnt = manageService.getMonResCnt(cvo);	
		List<CountVO> monGraCnt = manageService.getMonGrade(cvo);
		
		List<String> monConList = setDataString(monConCnt, end);
		List<String> monResList = setDataString(monResCnt, end);
		List<String> monGraCList = setDataString(monGraCnt, end);
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("monConCnt", monConList);
		map.put("monResCnt", monResList);
		map.put("monGraCnt", monGraCList);
		
		log.info("ManageController selectReservation end >>> ");
		return map;
		
	}
	
	// 데이터 세팅
	public List<String> setDataString(List<CountVO> vo, int end) {
		String[] str = new String[end];
		for(int i = 0; i < str.length; i++) {
			str[i] = "0";
		}
		for(int i = 0; i < vo.size(); i++) {
			int v = Integer.parseInt(vo.get(i).getDat());
			log.info(">>> " + vo.get(i).getCnt());
			str[v-1] = vo.get(i).getCnt();
		}
		List<String> list = Arrays.asList(str);
		return list;
	}
	
	// 어레이만들기
	public String[] makeStringArray(int end) {
		String[] str = new String[end];
		for(int i = 0; i < str.length; i++) {
			str[i] = "0";
		}
		return str;
	}
}
