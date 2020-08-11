package com.kosmo.educatch.dao;

import java.util.List;

import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.SearchVO;

public interface SearchMapper {
	//지역 대분류
	public List<SearchVO> getDistrict(SearchVO param);
	//지역 소분류
	public List<SearchVO> getCity(SearchVO param);
	//학원 리스트 가져오기
	public List<SearchVO> getAcaList(SearchVO param);
	//평점 가져오기
	public List<SearchVO> getReview(SearchVO param);
}
