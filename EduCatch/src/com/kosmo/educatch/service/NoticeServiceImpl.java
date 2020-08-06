package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.controller.NoticeController;
import com.kosmo.educatch.dao.NoticeMapper;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.NoticeVO;
import org.apache.log4j.Logger;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {

	private Logger log = LoggerManager.getInstance().getLogger(NoticeServiceImpl.class);
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	//=============== 공지사항 전제조회=============================
	@Override
	public List<NoticeVO> listNotice(NoticeVO param) {
		log.info("NoticeServiceImpl listNotice 시작>>>");
		
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		list = noticeMapper.listNotice(param);
		log.info("NoticeServiceImpl listNotice list.size() >>>"+list.size());
		
		log.info("NoticeServiceImpl listNotice 끝>>>");
		return list;
	}//end of listNotice
	
	//=============== 공지사항 조회=============================
	@Override
	public NoticeVO selectNotice(String nno) {
		log.info("NoticeServiceImpl selectNotice 시작>>>");
		
		log.info("nno>>>"+nno);
		NoticeVO nvo = new NoticeVO();
		nvo = noticeMapper.selectNotice(nno);
		log.info("nvo>>>"+nvo);
		
		log.info("NoticeServiceImpl selectNotice 끝>>>");
		return nvo;
	}
	
	
	//=============== 공지사항 등록=============================
	@Override
	public int insertNotice(NoticeVO param) {
		log.info("NoticeServiceImpl insertNotice 시작>>>");
		
		int nCnt = 0;
		nCnt = noticeMapper.insertNotice(param);
		log.info("nCnt>>>"+nCnt);
		
		log.info("NoticeServiceImpl insertNotice 끝>>>");
		return nCnt;
	}//end of insertNotice

	//=============== 공지사항 수정=============================
	@Override
	public int updateNotice(NoticeVO param) {
		log.info("NoticeServiceImpl updateNotice 시작>>>");
		
		int nCnt =noticeMapper.updateNotice(param);
		log.info("nCnt>>>"+nCnt);
		
		log.info("NoticeServiceImpl updateNotice 끝>>>");
		return nCnt;
	}
	
	//=============== 공지사항 수정=============================
	@Override
	public int deleteNotice(NoticeVO param) {
		log.info("NoticeServiceImpl deleteNotice 시작>>>");
		
		int nCnt =noticeMapper.deleteNotice(param);
		log.info("nCnt>>>"+nCnt);
				
		log.info("NoticeServiceImpl deleteNotice 끝>>>");
		return nCnt;
	}


}
