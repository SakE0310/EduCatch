package com.kosmo.educatch.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kosmo.educatch.vo.EventVO;

public class EventMapperImpl extends SqlSessionDaoSupport implements EventMapper{
	
	//=============== 이벤트 전제조회=============================
	@Override
	public List<EventVO> listEvent(EventVO param) {
		List<EventVO> list = getSqlSession().selectList("listEvent");
		return list;
	}//end of listEvent

	//=============== 이벤트 상세조회=============================
	@Override
	public EventVO selectEvent(EventVO param) {
		EventVO evo = new EventVO();
		evo = getSqlSession().selectOne("selectEvent");
		return evo;
	}//end of selectEvent

	//=============== 이벤트 등록=============================
	@Override
	public int insertEvent(EventVO param) {
		int nCnt = getSqlSession().insert("insertEvent");
		return nCnt;
	}//end of insertEvent

}
