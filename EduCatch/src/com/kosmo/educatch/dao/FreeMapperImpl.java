package com.kosmo.educatch.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.FreeVO;

public class FreeMapperImpl extends SqlSessionDaoSupport implements FreeMapper {
	private static Logger log = Logger.getLogger(FreeMapperImpl.class);
	
	
	//상세목록조회
	@Override
	public List<FreeVO> listFreeBoard(FreeVO param) {
		// TODO Auto-generated method stub
		
		List<FreeVO> list = getSqlSession().selectList("listFreeBoard");
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
		int ins =(int)getSqlSession().insert("insertFreeBoard");
		return ins;
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
