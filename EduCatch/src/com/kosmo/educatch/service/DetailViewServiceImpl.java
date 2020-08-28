package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.build.gradle.DetectSplitPackagesPlugin;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.log4j.Logger;

import com.kosmo.educatch.dao.DetailViewMapper;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ReserVO;
import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.SubjectVO;

@Service
@Transactional
public class DetailViewServiceImpl implements DetailViewService {
	private static Logger log = Logger.getLogger(DetailViewServiceImpl.class);

	@Autowired
	private DetailViewMapper detailViewMapper;

	//----------학원정보 조회 
	@Override
	public AcademyVO academyView(String ano) {
		log.info("DetailViewServiceImpl academyView 시작 >>>> ");
		AcademyVO avo = new AcademyVO();
		avo = detailViewMapper.academyView(ano);
		log.info("avo >>> " + avo);

		log.info("DetailViewServiceImpl academyView 끝 >>>> ");

		return avo;
	}//end of academyView
	
	//----------학원 편의기능 정보 조회
	@Override
	public ConvenienceVO conView(String ano) {
		log.info("DetailViewServiceImpl conView 시작 >>>> ");
		ConvenienceVO cvo = new ConvenienceVO();
		cvo = detailViewMapper.conView(ano);
		log.info("svo >>> " + cvo);

		log.info("DetailViewServiceImpl conView 끝 >>>> ");
		
		return cvo;
	}//end of conView
	
	//----------리뷰 평균 평점 조회
	@Override
	public AcademyVO gradeView(String ano) {
		log.info("DetailViewServiceImpl gradeView 시작 >>>> ");
		AcademyVO gvo = new AcademyVO();
		gvo = detailViewMapper.gradeView(ano);
		log.info("gvo >>> " + gvo);

		log.info("DetailViewServiceImpl gradeView 끝 >>>> ");
		
		return gvo;
	}//end of gradeView
	
	//----------과목정보 리스트조회
	@Override
	public List<SubjectVO> subjectViewList(SubjectVO param){
		log.info("DetailViewServiceImpl subjectViewList 시작 >>>> ");
		List<SubjectVO> list = new ArrayList<SubjectVO>();
		list = detailViewMapper.subjectViewList(param);
		log.info("DetailViewServiceImpl subjectViewList 끝 >>>> ");
		
		return list;
		
	}//end of subjectViewList

	//----------리뷰 게시판 리스트
	@Override
	public List<ReviewVO> reviewList(ReviewVO param) {
		
		log.info("DetailViewServiceImpl reviewList 시작 >>>> ");
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		list = detailViewMapper.reviewList(param);
		log.info("DetailViewServiceImpl reviewList 끝 >>>> ");
		
		return list;
	}//end of reviewList

	//----------찜목록 추가
	@Override
	public int insertBookmark(AcademyVO param) {
		log.info("DetailViewServiceImpl insertBookmark 시작 >>>> ");
		
		int nCnt = detailViewMapper.insertBookmark(param);
		log.info("nCnt >>> " + nCnt);
		
		log.info("DetailViewServiceImpl insertBookmark 끝 >>>> ");
		
		return nCnt;
	}//end of insertBookmark

	//----------찜목록 삭제
	@Override
	public int deleteBookmark(AcademyVO param) {
		log.info("DetailViewServiceImpl deleteBookmark 시작 >>>> ");
		
		int nCnt = detailViewMapper.deleteBookmark(param);
		log.info("nCnt >>> " + nCnt);
		
		log.info("DetailViewServiceImpl deleteBookmark 끝 >>>> ");
		
		return nCnt;
	}//end of deleteBookmark

	//----------찜목록 조회
	@Override
	public List<AcademyVO> selectBookmark(AcademyVO param) {

		log.info("DetailViewServiceImpl reviewList 시작 >>>> ");
		List<AcademyVO> list = new ArrayList<AcademyVO>();
		list = detailViewMapper.selectBookmark(param);
		log.info("DetailViewServiceImpl reviewList 끝 >>>> ");
		
		return list;
	}//end of deleteBookmark

	@Override
	public List<ReserVO> selectReser(AcademyVO avo) {
		log.info("DetailViewServiceImpl selectReser 시작 >>>> ");
		List<ReserVO> list = new ArrayList<ReserVO>();
		list = detailViewMapper.selectReser(avo);
		log.info("DetailViewServiceImpl selectReser 끝 >>>> ");
		return list;
	}

	@Override
	public int inReser(ReserVO rvo) {
		log.info("DetailViewServiceImpl inReser 시작 >>>> ");
		int i = 0;
		i = detailViewMapper.inReser(rvo);
		log.info("DetailViewServiceImpl inReser 끝 >>>> ");
		return i;
	}

	@Override
	public int delReser(ReserVO rvo) {
		log.info("DetailViewServiceImpl delReser 시작 >>>> ");
		int i = 0;
		i = detailViewMapper.delReser(rvo);
		log.info("DetailViewServiceImpl delReser 끝 >>>> ");
		return i;
	}

}
