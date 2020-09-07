package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConsultVO;
import com.kosmo.educatch.vo.MemberVO;

public interface ConsultService {

	public List<ConsultVO> listConsult(ConsultVO param);
	public List<ConsultVO> searchConsult(ConsultVO param);
	public List<AcademyVO> cacademyList(AcademyVO param);
	public int cinsertDisplay(ConsultVO param);
	public int insertConsult(ConsultVO param);
	public int updateConsult(ConsultVO param);
	public int deleteConsult(ConsultVO param);
	public ConsultVO selectConsult(ConsultVO param);
	public ConsultVO selectUpdate1(ConsultVO param);
	public AcademyVO academyAno(AcademyVO ano);
	public MemberVO memberMno(MemberVO param);
}
