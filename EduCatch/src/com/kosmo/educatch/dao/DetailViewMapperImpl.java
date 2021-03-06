package com.kosmo.educatch.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ReserVO;
import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.SubjectVO;

import org.apache.log4j.Logger;

public class DetailViewMapperImpl extends SqlSessionDaoSupport implements DetailViewMapper{
	
	private static Logger log = Logger.getLogger(DetailViewMapperImpl.class);

	//----------학원정보 조회 
	@Override
	public AcademyVO academyView(String ano) {
		return getSqlSession().selectOne("DetailViewMapper.academyView");
	}
	
	//----------학원 편의기능 정보 조회
	@Override
	public ConvenienceVO conView(String ano) {
		return getSqlSession().selectOne("DetailViewMapper.conView");
	}
	
	//----------리뷰 평균 평점 조회
	@Override
	public AcademyVO gradeView(String ano) {
		return getSqlSession().selectOne("DetailViewMapper.gradeView");
	}
	
	//----------과목정보 리스트조회
	@Override
	public List<SubjectVO> subjectViewList(SubjectVO param){
		return getSqlSession().selectList("DetailViewMapper.subjectViewList");
	}
	
	//----------리뷰 게시판 리스트
	@Override
	public List<ReviewVO> reviewList(ReviewVO param){
		return getSqlSession().selectList("DetailViewMapper.reviewList");
	}

	//----------찜목록 추가
	@Override
	public int insertBookmark(AcademyVO param) {
		return getSqlSession().insert("DetailViewMapper.insertBookmark");
	}

	//----------찜목록 삭제
	@Override
	public int deleteBookmark(AcademyVO param) {
		return getSqlSession().delete("DetailViewMapper.deleteBookmark");
	}
	//----------찜목록 조회
	@Override
	public List<AcademyVO> selectBookmark(AcademyVO param) {
		return getSqlSession().selectList("DetailViewMapper.selectBookmark");
	}

	@Override
	public List<ReserVO> selectReser(AcademyVO avo) {
		return getSqlSession().selectList("DetailViewMapper.selectReser", avo);
	}

	@Override
	public int inReser(ReserVO rvo) {
		return getSqlSession().insert("DetailViewMapper.inReser", rvo);
	}

	@Override
	public int delReser(ReserVO rvo) {
		return getSqlSession().delete("DetailViewMapper.delReser", rvo);
	}
	

}
