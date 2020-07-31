package com.kosmo.educatch.dao;

import java.util.List;

import com.kosmo.educatch.vo.FreeVO;

public interface FreeMapper {
	public List<FreeVO> listFreeBoard(FreeVO param);
	public FreeVO selectFreeBoard(FreeVO param);
	public int insertFreeBoard(FreeVO param);
	public int updateFreeBoard(FreeVO param);
	public int deleteFreeBoard(FreeVO param);
}
