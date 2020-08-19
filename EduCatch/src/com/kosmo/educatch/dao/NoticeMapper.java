package com.kosmo.educatch.dao;

import java.util.List;
import com.kosmo.educatch.vo.NoticeVO;
import com.kosmo.educatch.vo.EventVO;

public interface NoticeMapper {

	public List<NoticeVO> listNotice(NoticeVO param);
	public List<NoticeVO> searchNotice(NoticeVO param);
	public NoticeVO selectNotice(NoticeVO param);
	public int insertNotice(NoticeVO param);
	public int updateNotice(NoticeVO param);
	public int deleteNotice(NoticeVO param);
	
	public List<EventVO> eventPop(EventVO param);
}
