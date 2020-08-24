package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.ManageMapper;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.SubjectVO;
import com.kosmo.educatch.vo.TimetableVO;

@Service
@Transactional
public class ManageServiceImpl implements ManageService {

	private Logger log = LoggerManager.getInstance().getLogger(ManageServiceImpl.class);
	
	@Autowired
	private ManageMapper manageMapper;
	
	@Override
	public List<MemberVO> getAcaAccept(MemberVO vo) {
		log.info("ManagerServiceImpl getAcaAccept >>> ");
		List<MemberVO> list = null;
		list = manageMapper.getAcaAccept(vo);
		log.info("ManagerServiceImpl getAcaAccept end >>> ");
		return list;
	}

	@Override
	public int setAcceptAcaMem(MemberVO vo) {
		log.info("ManagerserviceImpl setAcceptAcaMem >>> ");
		int cnt = manageMapper.setAcceptAcaMem(vo);
		log.info("ManagerserviceImpl setAcceptAcaMem end >>> ");
		return cnt;
	}

	@Override
	public int delAcaMem(MemberVO vo) {
		log.info("ManagerserviceImpl delAcaMem >>> ");
		int cnt = manageMapper.delAcaMem(vo);
		log.info("ManagerserviceImpl delAcaMem end >>> ");
		return cnt;
	}

	@Override
	public List<TimetableVO> selectReservation(MemberVO vo) {
		log.info("ManagerServiceImpl selectReservation >>> ");
		List<TimetableVO> list = null;
		list = manageMapper.selectReservation(vo);
		log.info("ManagerServiceImpl selectReservation end >>> ");
		return list;
	}

	@Override
	public List<MemberVO> selectMemList(String str1, String str2) {
		log.info("ManagerServiceImpl selectMemList >>> ");
		List<MemberVO> list = null;
		list = manageMapper.selectMemList(str1, str2);
		log.info("ManagerServiceImpl selectMemList end >>> ");
		return list;
	}

	@Override
	public int insertTimetable(TimetableVO tvo) {
		log.info("ManagerserviceImpl insertTimetable >>> ");
		int cnt = manageMapper.insertTimetable(tvo);
		log.info("ManagerserviceImpl insertTimetable end >>> ");
		return cnt;
	}

	@Override
	public int updateTimetable(TimetableVO tvo) {
		log.info("ManagerserviceImpl updateTimetable >>> ");
		int cnt = manageMapper.updateTimetable(tvo);
		log.info("ManagerserviceImpl updateTimetable end >>> ");
		return cnt;
	}

	@Override
	public int deleteTimetable(TimetableVO tvo) {
		log.info("ManagerserviceImpl deleteTimetable >>> ");
		int cnt = manageMapper.deleteTimetable(tvo);
		log.info("ManagerserviceImpl deleteTimetable end >>> ");
		return cnt;
	}
	
	// ---------- 학원관리 학원 조회
	@Override
	public List<AcademyVO> academyManageView(AcademyVO avo){
		log.info("ManagerServiceImpl academyManageView >>> ");
		List<AcademyVO> list = new ArrayList<AcademyVO>();
		list = manageMapper.academyManageView(avo);
		log.info("ManagerServiceImpl selectMemList end >>> ");
		
		return list;
	}
	// ---------- 학원관리 과목 조회
	@Override
	public List<SubjectVO> subjectManageView(SubjectVO svo) {
		log.info("ManagerServiceImpl subjectManageView >>> ");
		List<SubjectVO> list = new ArrayList<SubjectVO>();
		list = manageMapper.subjectManageView(svo);
		log.info("ManagerServiceImpl subjectManageView end >>> ");
		
		return list;
	}
	// ---------- 학원관리 편의기능 조회
	@Override
	public List<ConvenienceVO> conManageView(ConvenienceVO cvo) {
		log.info("ManagerServiceImpl conManageView >>> ");
		List<ConvenienceVO> list = new ArrayList<ConvenienceVO>();
		list = manageMapper.conManageView(cvo);
		log.info("ManagerServiceImpl conManageView end >>> ");
		
		return list;
	}
	// ---------- 학원관리 과목 추가
	@Override
	public int insertSubject(SubjectVO svo) {
		log.info("ManagerserviceImpl insertSubject >>> ");
		int cnt = manageMapper.insertSubject(svo);
		log.info("ManagerserviceImpl insertSubject end >>> ");
		return cnt;
	}
	// ---------- 학원관리 학원 수정
	@Override
	public int updateAcademy(AcademyVO avo) {
		log.info("ManagerserviceImpl updateAcademy >>> ");
		int cnt = manageMapper.updateAcademy(avo);
		log.info("ManagerserviceImpl updateAcademy end >>> ");
		return cnt;
	}

}
