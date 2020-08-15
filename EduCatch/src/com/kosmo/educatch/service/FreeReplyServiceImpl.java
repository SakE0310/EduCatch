package com.kosmo.educatch.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.controller.FreeReplyController;
import com.kosmo.educatch.dao.FreeReplyMapper;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.ReplyVO;

@Service
@Transactional
public class FreeReplyServiceImpl implements FreeReplyService {
	private Logger log = LoggerManager.getInstance().getLogger(FreeReplyServiceImpl.class);

	@Autowired
	private FreeReplyMapper freereplymapper;
	
	@Override
	public List<ReplyVO> replyFreeList(ReplyVO param) {
		// TODO Auto-generated method stub
		log.info("replyList서비스 함수 호출");
		
		List<ReplyVO> replyList = freereplymapper.replyFreeList(param);
		
		return replyList;
	}

	@Override
	public int replyFreeInsert(ReplyVO param) {
		// TODO Auto-generated method stub
		log.info("replyInsert서비스 함수 호출");
		
		int result = freereplymapper.replyFreeInsert(param);
		
		return result;
	}

	@Override
	public int replyFreeUpdate(ReplyVO param) {
		// TODO Auto-generated method stub
		log.info("replyFreeUpdate서비스 함수 호출");
		
		int result = freereplymapper.replyFreeUpdate(param);
		
		return result;
	}

	@Override
	public int replyFreeDelete(ReplyVO param) {
		// TODO Auto-generated method stub
		log.info("replyFreeDelete서비스 함수 호출");
		
		int result = freereplymapper.replyFreeDelete(param);
		
		return result;
	}

}
