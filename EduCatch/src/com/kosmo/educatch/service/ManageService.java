package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.TimetableVO;

public interface ManageService {
	public List<MemberVO> getAcaAccept(MemberVO vo);
	public int setAcceptAcaMem(MemberVO vo);
	public int delAcaMem(MemberVO vo);
	public List<TimetableVO> selectReservation(MemberVO vo);
	public List<MemberVO> selectMemList(String str1, String str2);
	public int insertTimetable(TimetableVO tvo);
	public int updateTimetable(TimetableVO tvo);
	public int deleteTimetable(TimetableVO tvo);
}
