package com.kosmo.educatch.dao;

import java.util.List;
import com.kosmo.educatch.vo.SearchVO;

public interface SearchMapper {
	//지역 대분류
	public List<SearchVO> getDistrict(SearchVO param);
	//지역 소분류
	public List<SearchVO> getCity(SearchVO param);
//	public List<SearchVO> selectComplete(SearchVO param);
//	public List<SearchVO> searchCateList(SearchVO param);
//	public List<SearchVO> selectCate(SearchVO param);
}
