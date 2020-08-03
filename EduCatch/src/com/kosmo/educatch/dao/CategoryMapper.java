package com.kosmo.educatch.dao;

import java.util.List;

import com.kosmo.educatch.vo.SearchVO;

public interface CategoryMapper {
	public List<SearchVO> getCmajorList();
	public List<SearchVO> getCminorList(SearchVO svo);
}
