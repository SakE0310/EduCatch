package com.kosmo.educatch.dao;

import java.util.List;
import com.kosmo.educatch.vo.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> listNotice(NoticeVO param);
	public int insertNotice(NoticeVO param);
}
