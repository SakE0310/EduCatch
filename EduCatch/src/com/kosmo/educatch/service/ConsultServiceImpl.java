package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.ConsultMapper;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConsultVO;
import com.kosmo.educatch.vo.MemberVO;

@Service
@Transactional
public class ConsultServiceImpl implements ConsultService{

	private static Logger log=Logger.getLogger(ConsultServiceImpl.class);
	
	@Autowired
	private ConsultMapper consultMapper;

	//상담 전체 조회
	@Override
	public List<ConsultVO> listConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		log.info("ConsultServiceImpl listConsult >>> 호출성공");
		
		List<ConsultVO> list=new ArrayList<ConsultVO>();
		list=consultMapper.listConsult(param);
		
		return list;
	}

	//글쓰기 에디터 화면
	@Override
	public int cinsertDisplay(ConsultVO param) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		return consultMapper.insertConsult(param);
	}

	@Override
	public ConsultVO selectConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		return consultMapper.selectConsult(param);
	}

	@Override
	public ConsultVO selectUpdate1(ConsultVO param) {
		// TODO Auto-generated method stub
		return consultMapper.selectUpdate1(param);
	}

	@Override
	public int updateConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		return consultMapper.updateConsult(param);
	}

	@Override
	public int deleteConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		return consultMapper.deleteConsult(param);
	}

	@Override
	public List<ConsultVO> searchConsult(ConsultVO param) {
		// TODO Auto-generated method stub
		List<ConsultVO> list=new ArrayList<ConsultVO>();
		list=consultMapper.searchConsult(param);
		
		return list;
	}

	@Override
	public List<AcademyVO> cacademyList(AcademyVO param) {
		// TODO Auto-generated method stub
		List<AcademyVO> list=new ArrayList<AcademyVO>();
		list=consultMapper.cacademyList(param);
		
		return list;
	}
	
	@Override
	public AcademyVO academyAno(AcademyVO ano) {
		AcademyVO avo = new AcademyVO();
		avo = consultMapper.academyAno(ano);
		
		return avo;
	
	}

	@Override
	public MemberVO memberMno(MemberVO param) {
		// TODO Auto-generated method stub
		MemberVO mvo = new MemberVO();
		mvo = consultMapper.memberMno(param);
		
		return mvo;
	}
	
}
