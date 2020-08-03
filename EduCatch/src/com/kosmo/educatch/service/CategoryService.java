package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.SearchVO;

public interface CategoryService {
	public List<SearchVO> getCmajorList();
	public List<SearchVO> getCminorList(SearchVO svo);
}
