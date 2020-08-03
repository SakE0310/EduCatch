package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> listNotice(NoticeVO param);
	public NoticeVO selectNotice(String nno);
	public int insertNotice(NoticeVO param);
	public int updateNotice(NoticeVO param);
}
