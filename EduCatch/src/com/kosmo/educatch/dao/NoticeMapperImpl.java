package com.kosmo.educatch.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.NoticeVO;

public class NoticeMapperImpl extends SqlSessionDaoSupport implements NoticeMapper{

	//=============== 공지사항 전제조회=============================
	@Override
	public List<NoticeVO> listNotice(NoticeVO param) {
		List<NoticeVO>list = getSqlSession().selectList("listNotice");
		return list;
	}//end of listNotice
	
	//=============== 공지사항 등록 =============================
	@Override
	public int insertNotice(NoticeVO param) {
		int nCnt = getSqlSession().insert("insertNotice");
		return nCnt;
	}//end of insertNotice

}
