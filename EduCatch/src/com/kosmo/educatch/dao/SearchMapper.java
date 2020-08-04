package com.kosmo.educatch.dao;

import java.util.List;
import com.kosmo.educatch.vo.SearchVO;

public interface SearchMapper {
	//지역 list
	public List<SearchVO> selectArea(SearchVO param);
	//District조건문 데이터
	public List<SearchVO> searchAreaList(SearchVO param);
	//전체선택완료
	public List<SearchVO> selectComplete(SearchVO param);
	//카테 list
	public List<SearchVO> searchCateList(SearchVO param);
}
