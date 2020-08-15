package com.kosmo.educatch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.kosmo.educatch.vo.ReplyVO;

public class FreeReplyMapperImpl extends SqlSessionDaoSupport implements FreeReplyMapper {
	private static Logger log = Logger.getLogger(FreeReplyMapperImpl.class);
	
	@Override
	public List<ReplyVO> replyFreeList(ReplyVO param) {
		// TODO Auto-generated method stub
		
		List<ReplyVO> replyList =getSqlSession().selectList("replyFreeList");
		return replyList;
	}

	@Override
	public int replyFreeInsert(ReplyVO param) {
		// TODO Auto-generated method stub
		int result = getSqlSession().insert("replyFreeInsert");
		return result;
	}

	@Override
	public int replyFreeUpdate(ReplyVO param) {
		// TODO Auto-generated method stub
		int result =getSqlSession().update("replyFreeUpdate");
		return result;
	}

	@Override
	public int replyFreeDelete(ReplyVO param) {
		// TODO Auto-generated method stub
		int result = getSqlSession().update("replyFreeDelete");
		return result;
	}

}
