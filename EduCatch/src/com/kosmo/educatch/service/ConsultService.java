package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.ConsultVO;

public interface ConsultService {

	public List<ConsultVO> listConsult(ConsultVO param);
	public int cinsertDisplay(ConsultVO param);
	public int insertConsult(ConsultVO param);
}
