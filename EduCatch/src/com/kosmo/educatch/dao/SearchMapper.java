package com.kosmo.educatch.dao;

import java.util.List;
import com.kosmo.educatch.vo.SearchVO;

public interface SearchMapper {
	//지역데이터
	public List<SearchVO> searchAreaList(SearchVO param);
}
