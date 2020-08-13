package com.kosmo.educatch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.educatch.vo.ReplyVO;


public class ReplyMapperImpl extends SqlSessionDaoSupport implements ReplyMapper{

	@Override
	public List<ReplyVO> replyList(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("replyList");
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return getSqlSession().insert("replyInsert");
	}

	
}
