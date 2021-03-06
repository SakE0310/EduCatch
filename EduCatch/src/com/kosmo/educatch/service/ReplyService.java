package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> replyList(ReplyVO rvo);
	public List<ReplyVO> creplyList(ReplyVO rvo);
	public int replyInsert(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
	public int replyDelete(ReplyVO rvo);

}
