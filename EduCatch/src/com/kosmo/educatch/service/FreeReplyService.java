package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.ReplyVO;

public interface FreeReplyService {
	// 댓글전체조회 구현 ======================================
	public List<ReplyVO> replyFreeList(ReplyVO param);
	// 댓글쓰기 구현 ======================================
	public int replyFreeInsert(ReplyVO param);
	// 댓글수정 구현 ======================================
	public int replyFreeUpdate(ReplyVO param);
	// 댓글삭제 구현 ======================================
	public int replyFreeDelete(ReplyVO param);

}
