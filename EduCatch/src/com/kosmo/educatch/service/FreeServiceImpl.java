package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.controller.AcademyRequestController;
import com.kosmo.educatch.dao.FreeMapper;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.FreeVO;

@Service
@Transactional
public class FreeServiceImpl implements FreeService {
	private Logger log = LoggerManager.getInstance().getLogger(FreeServiceImpl.class);
	
	@Autowired
	private FreeMapper freeMapper;

	//조회서비스
	@Override
	public List<FreeVO> listFreeBoard(FreeVO param) {
		// TODO Auto-generated method stub
		log.info("listFreeBoard함수 진입(목록)");
		
		List<FreeVO> list = new ArrayList<FreeVO>();
		list = freeMapper.listFreeBoard(param);
		log.info("service prarm>>>"+list.get(0).getFbname());
		
		log.info("listFreeBoard함수 진입 끝(목록)");
		return list;
	}
	//selectFreeBoard서비스
	@Override
	public FreeVO selectFreeBoard(FreeVO param) {
		// TODO Auto-generated method stub
		log.info("selectFreeBoard서비스 진입");
		FreeVO freevo = freeMapper.selectFreeBoard(param);
		return freevo;
	}

	//입력 서비스
	@Override
	public int insertFreeBoard(FreeVO param) {
		// TODO Auto-generated method stub
		log.info("insertFreeBoard서비스 진입");
		int ins = freeMapper.insertFreeBoard(param);
		log.info("selectFreeBoard서비스 끝");
		return ins;
	}
	//수정 서비스
	@Override
	public int updateFreeBoard(FreeVO param) {
		// TODO Auto-generated method stub
		log.info("updateFreeBoard서비스 진입");
		int upd = freeMapper.updateFreeBoard(param);
		log.info("updateFreeBoard서비스 진입 끝");
		return upd;
	}
	//삭제 서비스
	@Override
	public int deleteFreeBoard(FreeVO param) {
		// TODO Auto-generated method stub
		log.info("deleteFreeBoard서비스 진입");
		int del = freeMapper.deleteFreeBoard(param);
		log.info("deleteFreeBoard서비스 진입 끝");
		return del;
	}

}
