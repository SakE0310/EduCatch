package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.log4j.Logger;

import com.kosmo.educatch.dao.DetailViewMapper;
import com.kosmo.educatch.vo.DetailViewVO;

@Service
@Transactional
public class DetailViewServiceImpl implements DetailViewService{
	private static Logger log = Logger.getLogger(DetailViewServiceImpl.class);

	@Autowired
	private DetailViewMapper detailViewMapper;
	
	@Override
	public List<DetailViewVO> listDetailView(DetailViewVO param) {
		List<DetailViewVO> list = new ArrayList<DetailViewVO>();
		list = detailViewMapper.detailviewlist(param);
		
		log.info("DetailViewServiceImpl listDetailView >>>> ");
		log.info("DetailViewServiceImpl listDetailView param >>>> " + param);
		
		return list;
	}

}
