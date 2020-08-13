package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.AcademyAddMapper;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.SearchVO;

@Service
@Transactional
public class AcademyAddServiceImpl implements AcademyAddService{

	private static Logger log = Logger.getLogger(AcademyAddServiceImpl.class);
	
	
	@Autowired
	private AcademyAddMapper academyAddMapper;
	
	
	//카테고리 정보
	public AcademyVO selectCategory(AcademyVO avo) {
		log.info("AcademyAddServiceImpl.selectCategory >>> 시작");
		log.info("AcademyAddServiceImpl.selectCategory >>> 끝");
		
		return academyAddMapper.selectCategory(avo);
	}//end of selectCategory
	
	//학원 등록
	@Override
	public int insertAcademy(AcademyVO param) {
		log.info("AcademyAddServiceImpl insertAcademy >>> 시작 ");
		
		int nCnt = 0;
		
		nCnt = academyAddMapper.insertAcademy(param);
		log.info("nCnt >>> " + nCnt);
		
		log.info("AcademyAddServiceImpl insertAcademy >>> 끝 ");
		return nCnt;
	}//end of insertAcademy
	

	//학원 편의 기능
	@Override
	public int insertConveniece(ConvenienceVO param) {
		log.info("AcademyAddServiceImpl insertConveniece >>> 시작 ");
		
		int nCnt = 0;
		
		nCnt = academyAddMapper.insertConveniece(param);
		log.info("nCnt >>> " + nCnt);
		
		log.info("AcademyAddServiceImpl insertConveniece >>> 끝 ");
		return nCnt;
	}//end of insertConveniece
	
	
}
