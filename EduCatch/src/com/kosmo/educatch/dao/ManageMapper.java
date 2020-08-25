package com.kosmo.educatch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.SubjectVO;
import com.kosmo.educatch.vo.TimetableVO;

public interface ManageMapper {
	public List<MemberVO> getAcaAccept(MemberVO vo);
	public int setAcceptAcaMem(MemberVO vo);
	public int delAcaMem(MemberVO vo);
	public List<TimetableVO> selectReservation(MemberVO vo);
	public List<MemberVO> selectMemList(@Param("ttno")String str1, @Param("ano")String str2);
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
}
