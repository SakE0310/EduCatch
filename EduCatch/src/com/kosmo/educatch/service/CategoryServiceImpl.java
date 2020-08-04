package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.CategoryMapper;
import com.kosmo.educatch.vo.SearchVO;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
	
	private static Logger log = Logger.getLogger(CategoryServiceImpl.class);
	
	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public List<SearchVO> getCmajorList() {
		log.info("CategoryServiceImpl getCmajor >>> ");
		List<SearchVO> list = null;
		list = new ArrayList<SearchVO>();
		list = categoryMapper.getCmajorList();
		
		return list;
	}

	@Override
	public List<SearchVO> getCminorList(String major) {
		log.info("CategoryServiceImpl getCminor >>> ");
		List<SearchVO> list = null;
		list = new ArrayList<SearchVO>();
		list = categoryMapper.getCminorList(major);
		
		return list;
	}

}
