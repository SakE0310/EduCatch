package com.kosmo.educatch.dao;

import java.util.List;

import com.kosmo.educatch.vo.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> replyList(ReplyVO rvo);
	public int replyInsert(ReplyVO rvo);

}
