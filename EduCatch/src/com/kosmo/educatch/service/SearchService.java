package com.kosmo.educatch.service;

import java.util.List;
import com.kosmo.educatch.vo.SearchVO;

public interface SearchService {
	//지역List
	public List<SearchVO> selectArea(String district);
	//지역select
	public List<SearchVO> searchAreaList(SearchVO param);
	//전체선택완료
	public List<SearchVO> selectComplete(SearchVO param);
	//카테 list
	public List<SearchVO> searchCateList(SearchVO param);
	//카테 select
	public List<SearchVO> selectCate(SearchVO param);
}
