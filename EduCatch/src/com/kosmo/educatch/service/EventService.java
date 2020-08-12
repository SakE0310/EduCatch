package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.EventVO;

public interface EventService {

	public List<EventVO> listEvent(EventVO param);
	public List<EventVO> searchEvent(EventVO param);
	public EventVO selectEvent(EventVO param);
	public int insertEvent(EventVO param);
	public int updateEvent(EventVO param);
	public int deleteEvent(EventVO param);
}
