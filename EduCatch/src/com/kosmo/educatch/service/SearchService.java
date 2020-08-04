package com.kosmo.educatch.service;

import java.util.List;
import com.kosmo.educatch.vo.SearchVO;

public interface SearchService {
	//지역List
	public List<SearchVO> selectArea(SearchVO param);
	//지역select
	public List<SearchVO> searchAreaList(SearchVO param);
	//전체선택완료
	public List<SearchVO> selectComplete(SearchVO param);
	//카테 list
	public List<SearchVO> searchCateList(SearchVO param);
}
