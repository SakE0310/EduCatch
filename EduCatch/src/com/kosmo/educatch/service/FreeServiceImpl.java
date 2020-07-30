package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.FreeMapper;
import com.kosmo.educatch.vo.FreeVO;

@Service
@Transactional
public class FreeServiceImpl implements FreeService {
	private static Logger log = Logger.getLogger(FreeServiceImpl.class);
	
	@Autowired
	private FreeMapper freeMapper;

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

	@Override
	public FreeVO selectFreeBoard(FreeVO param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertFreeBoard(FreeVO param) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateFreeBoard(FreeVO param) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFreeBoard(FreeVO param) {
		// TODO Auto-generated method stub
		return 0;
	}

}
