package com.kosmo.educatch.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.NoticeVO;

public class NoticeMapperImpl extends SqlSessionDaoSupport implements NoticeMapper{

	//=============== 공지사항 검색=============================
	@Override
	public List<NoticeVO> searchNotice(NoticeVO param) {
		List<NoticeVO>list = getSqlSession().selectList("searchNotice");
		return list;
	}
	
	//=============== 공지사항 전제조회=============================
	@Override
	public List<NoticeVO> listNotice(NoticeVO param) {
		List<NoticeVO>list = getSqlSession().selectList("listNotice");
		return list;
	}//end of listNotice
	
	//=============== 공지사항 조회=============================
	@Override
	public NoticeVO selectNotice(NoticeVO param) {
		NoticeVO nvo= new NoticeVO();
		nvo=getSqlSession().selectOne("selectNotice");
		return nvo;
	}//end of selectNotice

	//=============== 공지사항 등록 =============================
	@Override
	public int insertNotice(NoticeVO param) {
		int nCnt = getSqlSession().insert("insertNotice");
		return nCnt;
	}//end of insertNotice

	
	//=============== 공지사항 수정 =============================
	@Override
	public int updateNotice(NoticeVO param) {
		int nCnt = getSqlSession().update("updateNotice");
		return nCnt;
	}//end of updateNotice
	
	//=============== 공지사항 삭제 =============================
	@Override
	public int deleteNotice(NoticeVO param) {
		int nCnt = getSqlSession().update("deleteNotice");
		return nCnt;
	}//end of deleteNotice


}
