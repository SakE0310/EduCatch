package com.kosmo.educatch.dao;

import java.util.List;
import com.kosmo.educatch.vo.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> listNotice(NoticeVO param);
	public NoticeVO selectNotice(String nno);
	public int insertNotice(NoticeVO param);
	public int updateNotice(NoticeVO param);
	public int deleteNotice(NoticeVO param);
}
