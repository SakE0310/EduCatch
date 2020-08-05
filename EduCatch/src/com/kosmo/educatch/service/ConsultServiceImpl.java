package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.vo.ConsultVO;

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
	
}
