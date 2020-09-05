package com.kosmo.educatch.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.CountVO;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.SubjectVO;
import com.kosmo.educatch.vo.TimetableVO;

public class ManageMapperImpl extends SqlSessionDaoSupport implements ManageMapper {
	
	private Logger log = LoggerManager.getInstance().getLogger(ManageMapperImpl.class);

	@Override
	public List<MemberVO> getAcaAccept(MemberVO vo) {
		log.info("ManageMapperImpl getAcaAccept >>> ");
		return getSqlSession().selectList("ManageMapper.getAcaAccept");
	}

	@Override
	public int setAcceptAcaMem(MemberVO vo) {
		log.info("ManageMapperImpl setAcceptAcaMem >>> ");
		return getSqlSession().update("ManagerMapper.setAcceptAcaMem", vo);
	}

	@Override
	public int delAcaMem(MemberVO vo) {
		log.info("ManageMapperImpl delAcaMem >>> ");
		return getSqlSession().delete("ManagerMapper.delAcaMem", vo);
	}

	@Override
	public List<TimetableVO> selectReservation(MemberVO vo) {
		log.info("ManageMapperImpl delAcaMem >>> ");
		return getSqlSession().selectList("ManagerMapper.selectReservattion", vo);
	}

	@Override
	public List<MemberVO> selectMemList(@Param("ttno") String str1, @Param("ano")String str2) {
		log.info("ManageMapperImpl selectMemList >>> ");
		return getSqlSession().selectList("ManagerMapper.selectMemList");
	}

	@Override
	public int insertTimetable(TimetableVO tvo) {
		log.info("ManageMapperImpl insertTimetable >>> ");
		return getSqlSession().insert("ManagerMapper.insertTimetable", tvo);
	}

	@Override
	public int updateTimetable(TimetableVO tvo) {
		log.info("ManageMapperImpl updateTimetable >>> ");
		return getSqlSession().insert("ManagerMapper.updateTimetable", tvo);
	}

	@Override
	public int deleteTimetable(TimetableVO tvo) {
		log.info("ManageMapperImpl deleteTimetable >>> ");
		return getSqlSession().insert("ManagerMapper.deleteTimetable", tvo);
	}
	
	// ---------- 학원관리 학원 조회
	@Override
	public List<AcademyVO> academyManageView(AcademyVO avo){
		log.info("ManageMapperImpl academyManageView >>> ");
		return getSqlSession().selectList("ManagerMapper.academyManageView");
	}
	
	// ---------- 학원관리 과목 조회
	@Override
	public List<SubjectVO> subjectManageView(SubjectVO svo) {
		log.info("ManageMapperImpl subjectManageView >>> ");
		return getSqlSession().selectList("ManagerMapper.subjectManageView");
	}
	
	// ---------- 학원관리 편의기능 조회
	@Override
	public List<ConvenienceVO> conManageView(ConvenienceVO cvo) {
		log.info("ManageMapperImpl conManageView >>> ");
		return getSqlSession().selectList("ManagerMapper.conManageView");
	}

	// ---------- 학원관리 과목 입력
	@Override
	public int insertSubject(SubjectVO svo) {
		return getSqlSession().insert("ManagerMapper.insertSubject");
	}

	// ---------- 학원관리 학원 수정
	@Override
	public int updateAcademy(AcademyVO avo) {
		return getSqlSession().update("ManagerMapper.updateAcademy");
	}
	// ---------- 학원관리 학원 수정 이미지없을때
	@Override
	public int updateAcademyNoImg(AcademyVO avo) {
		return getSqlSession().update("ManagerMapper.updateAcademyNoImg");
	}
	// ---------- 학원관리 편의기능 수정
	@Override
	public int updateConvenience(ConvenienceVO cvo) {
		return getSqlSession().update("ManagerMapper.updateConvenience");
	}
	// ---------- 학원관리 과목 수정/삭제 체크박스
	@Override
	public SubjectVO selectOneSubject(String sno) {
		return getSqlSession().selectOne("ManagerMapper.selectOneSubject");
	}
	
	// ---------- 학원관리 과목 수정
	@Override
	public int updateSubject(SubjectVO svo) {
		return getSqlSession().update("ManagerMapper.updateSubject");
	}
	// ---------- 학원관리 과목 삭제
	@Override
	public int deleteSubject(SubjectVO svo) {
		return getSqlSession().update("ManagerMapper.deleteSubject");
	}
	//---------- 학원관리 편의기능 버튼조회
	@Override
	public ConvenienceVO selectOneConvenience(String ano) {
		return getSqlSession().selectOne("ManagerMapper.selectOneConvenience");
	}

	@Override
	public List<AcademyVO> getAcaListManage(AcademyVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("ManagerMapper.getAcaListManage", param);
	}

	@Override
	public List<HashMap<String, String>> getAvgPrice() {
		return getSqlSession().selectList("ManagerMapper.getAvgPrice");
	}

	@Override
	public List<HashMap<String, String>> getMemType() {
		return getSqlSession().selectList("ManagerMapper.getMemType");
	}

	@Override
	public List<HashMap<String, String>> getAcaStat() {
		return getSqlSession().selectList("ManagerMapper.getAcaStat");
	}

	@Override
	public List<HashMap<String, String>> getPostCnt() {
		return getSqlSession().selectList("ManagerMapper.getPostCnt");
	}

	@Override
	public List<CountVO> getMonConCnt(CountVO cvo) {
		return getSqlSession().selectList("ManagerMapper.getMonConCnt");
	}

	@Override
	public List<CountVO> getMonResCnt(CountVO cvo) {
		return getSqlSession().selectList("ManagerMapper.getMonResCnt");
	}

	@Override
	public List<CountVO> getMonGrade(CountVO cvo) {
		return getSqlSession().selectList("ManagerMapper.getMonGrade");
	}

}
