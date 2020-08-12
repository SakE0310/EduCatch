package com.kosmo.educatch.vo;

public class EventVO extends PagingVO{

	private String eno;
	private String esubject;
	private String ename;
	private String eimg;
	private String econtent;
	private String edeleteyn;
	private String einsertdate;
	private String eupdatedate;
	
	// search 변수
	private String keyword;			// 검색어
	private String searchFilter;	// 검색조건
	private String startDate;		// 검색기간 시작일
	private String endDate;			// 검색기간 종료일

	public String getEno() {
		return eno;
	}
	public void setEno(String eno) {
		this.eno = eno;
	}
	public String getEsubject() {
		return esubject;
	}
	public void setEsubject(String esubject) {
		this.esubject = esubject;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEimg() {
		return eimg;
	}
	public void setEimg(String eimg) {
		this.eimg = eimg;
	}
	public String getEcontent() {
		return econtent;
	}
	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}
	public String getEdeleteyn() {
		return edeleteyn;
	}
	public void setEdeleteyn(String edeleteyn) {
		this.edeleteyn = edeleteyn;
	}
	public String getEinsertdate() {
		return einsertdate;
	}
	public void setEinsertdate(String einsertdate) {
		this.einsertdate = einsertdate;
	}
	public String getEupdatedate() {
		return eupdatedate;
	}
	public void setEupdatedate(String eupdatedate) {
		this.eupdatedate = eupdatedate;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSearchFilter() {
		return searchFilter;
	}
	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}

	
}
