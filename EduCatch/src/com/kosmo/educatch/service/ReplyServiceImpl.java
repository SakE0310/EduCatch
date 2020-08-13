package com.kosmo.educatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.ReplyMapper;
import com.kosmo.educatch.vo.ReplyVO;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public List<ReplyVO> replyList(ReplyVO rvo) {
		// TODO Auto-generated method stub
		List<ReplyVO> replyList=replyMapper.replyList(rvo);
		
		return replyList;
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return replyMapper.replyInsert(rvo);
	}

	@Override
	public int replyUpdate(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return replyMapper.replyUpdate(rvo);
	}

	@Override
	public int replyDelete(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return replyMapper.replyDelete(rvo);
	}

	@Override
	public List<ReplyVO> creplyList(ReplyVO rvo) {
		// TODO Auto-generated method stub
		List<ReplyVO> creplyList=replyMapper.creplyList(rvo);
		
		return creplyList;
	}

}
