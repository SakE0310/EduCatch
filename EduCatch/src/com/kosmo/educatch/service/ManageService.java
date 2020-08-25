package com.kosmo.educatch.service;

import java.util.List;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.SubjectVO;
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
	public List<AcademyVO> academyManageView(AcademyVO avo);
	public List<SubjectVO> subjectManageView(SubjectVO svo);
	public List<ConvenienceVO> conManageView(ConvenienceVO cvo);
	public int insertSubject(SubjectVO svo);
	public int updateAcademy(AcademyVO avo);
	public int updateAcademyNoImg(AcademyVO avo);
	public int updateConvenience(ConvenienceVO cvo);
	public SubjectVO selectOneSubject(String sno);
	public int updateSubject(SubjectVO svo);
	public int deleteSubject(SubjectVO svo);
	public ConvenienceVO selectOneConvenience(String ano);
	public List<AcademyVO> getAcaListManage(AcademyVO param);
}
