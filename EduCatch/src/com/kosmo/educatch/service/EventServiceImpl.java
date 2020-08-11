package com.kosmo.educatch.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.EventMapper;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.EventVO;

@Service
@Transactional
public class EventServiceImpl implements EventService{
	private Logger log = LoggerManager.getInstance().getLogger(EventServiceImpl.class);

	@Autowired
	private EventMapper eventMapper;
	
	//=============== 이벤트 전제조회=============================
	@Override
	public List<EventVO> listEvent(EventVO param) {
		log.info("EventServiceImpl listEvent 시작>>>");
		
		List<EventVO> list = new ArrayList<EventVO>();
		list = eventMapper.listEvent(param);
		log.info("EventServiceImpl listEvent list.size() >>>"+list.size());
		
		log.info("EventServiceImpl listEvent 끝>>>");
		return list;
	}//end of listEvent

	//=============== 이벤트 상세조회=============================
	@Override
	public EventVO selectEvent(EventVO param) {
		log.info("EventServiceImpl selectEvent 시작>>>");
		log.info("param.getEno()>>>"+param.getEno());
		
		EventVO evo = new EventVO();
		evo = eventMapper.selectEvent(param);
		
		log.info("EventServiceImpl selectEvent 끝>>>");
		return evo;
	}//end of selectEvent

	//=============== 이벤트 등록=============================
	@Override
	public int insertEvent(EventVO param) {
		log.info("EventServiceImpl insertEvent 시작>>>");
		
		int nCnt = eventMapper.insertEvent(param);
		
		log.info("EventServiceImpl insertEvent 끝>>>");
		return nCnt;
	}//end of insertEvent

	//=============== 이벤트 수정=============================
	@Override
	public int updateEvent(EventVO param) {
		log.info("EventServiceImpl updateEvent 시작>>>");
		int nCnt = eventMapper.updateEvent(param);
		log.info("EventServiceImpl updateEvent 끝>>>");
		return nCnt;
	}//end of updateEvent

	//=============== 이벤트 삭제=============================
	@Override
	public int deleteEvent(EventVO param) {
		log.info("EventServiceImpl updateEvent 시작>>>");
		int nCnt = eventMapper.deleteEvent(param);
		log.info("EventServiceImpl updateEvent 끝>>>");
		return nCnt;
	}//end of deleteEvent
	
}
