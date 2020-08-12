package com.kosmo.educatch.vo;

public class ReviewVO extends PagingVO{
	
	private String rbno;
	private String rbsubject;
	private String rbname;
	private String rbimg;
	private String rbcontent;
	private String academy_ano;
	private String member_mno;
	private String rbgrade;
	private String rbdeleteyn;
	private String rbinsertdate;
	private String rbupdatedate;
	
	// search 변수
	private String keyword;			// 검색어
	private String searchFilter;	// 검색조건
	private String startDate;		// 검색기간 시작일
	private String endDate;			// 검색기간 종료일
	
	public ReviewVO() {
		
	}


	public String getRbno() {
		return rbno;
	}


	public void setRbno(String rbno) {
		this.rbno = rbno;
	}


	public String getRbsubject() {
		return rbsubject;
	}


	public void setRbsubject(String rbsubject) {
		this.rbsubject = rbsubject;
	}


	public String getRbname() {
		return rbname;
	}


	public void setRbname(String rbname) {
		this.rbname = rbname;
	}


	public String getRbimg() {
		return rbimg;
	}


	public void setRbimg(String rbimg) {
		this.rbimg = rbimg;
	}


	public String getRbcontent() {
		return rbcontent;
	}


	public void setRbcontent(String rbcontent) {
		this.rbcontent = rbcontent;
	}




	public String getAcademy_ano() {
		return academy_ano;
	}


	public void setAcademy_ano(String academy_ano) {
		this.academy_ano = academy_ano;
	}


	public String getMember_mno() {
		return member_mno;
	}


	public void setMember_mno(String member_mno) {
		this.member_mno = member_mno;
	}


	public String getRbgrade() {
		return rbgrade;
	}


	public void setRbgrade(String rbgrade) {
		this.rbgrade = rbgrade;
	}


	public String getRbdeleteyn() {
		return rbdeleteyn;
	}


	public void setRbdeleteyn(String rbdeleteyn) {
		this.rbdeleteyn = rbdeleteyn;
	}


	public String getRbinsertdate() {
		return rbinsertdate;
	}


	public void setRbinsertdate(String rbinsertdate) {
		this.rbinsertdate = rbinsertdate;
	}


	public String getRbupdatedate() {
		return rbupdatedate;
	}


	public void setRbupdatedate(String rbupdatedate) {
		this.rbupdatedate = rbupdatedate;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getSearchFilter() {
		return searchFilter;
	}


	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
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
	
	
	
	

}
