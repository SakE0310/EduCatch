package com.kosmo.educatch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
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

}
