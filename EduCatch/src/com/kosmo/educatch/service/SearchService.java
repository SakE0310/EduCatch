package com.kosmo.educatch.service;

import java.util.List;
import com.kosmo.educatch.vo.SearchVO;

public interface SearchService {

	public List<SearchVO> searchAreaList(SearchVO param);
}
