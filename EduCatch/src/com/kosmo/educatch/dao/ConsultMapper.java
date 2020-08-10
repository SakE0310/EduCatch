package com.kosmo.educatch.dao;

import java.util.List;

import com.kosmo.educatch.vo.ConsultVO;

public interface ConsultMapper {

	public List<ConsultVO> listConsult(ConsultVO param);
	public int insertConsult(ConsultVO param);
	public int updateConsult(ConsultVO param);
	public int deleteConsult(String cbno);
	public ConsultVO selectConsult(String cbno);
	public ConsultVO selectUpdate1(String cbno);
}
