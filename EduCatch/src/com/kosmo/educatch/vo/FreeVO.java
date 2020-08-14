package com.kosmo.educatch.vo;

public class FreeVO extends PagingVO {
	private String fbno;
	private String fbsubject;
	private String fbname;
	private String fbimg;
	private String fbcontent;
	private String member_mno;
	private String fbdeleteyn;
	private String fbinsertdate;
	private String fbupdatedate;
	
	// search 변수
	private String keyword;			// 검색어
	private String searchFilter;	// 검색조건
	private String startDate;		// 검색기간 시작일
	private String endDate;			// 검색기간 종료일

	
	public FreeVO() {}

	public FreeVO(String fbno, String fbsubject, String fbname, String fbimg, String fbcontent, String member_mno,
			String fbdeleteyn, String fbinsertdate, String fbupdatedate) {
		this.fbno = fbno;
		this.fbsubject = fbsubject;
		this.fbname = fbname;
		this.fbimg = fbimg;
		this.fbcontent = fbcontent;
		this.member_mno = member_mno;
		this.fbdeleteyn = fbdeleteyn;
		this.fbinsertdate = fbinsertdate;
		this.fbupdatedate = fbupdatedate;
	}

	public String getFbno() {
		return fbno;
	}

	public void setFbno(String fbno) {
		this.fbno = fbno;
	}

	public String getFbsubject() {
		return fbsubject;
	}

	public void setFbsubject(String fbsubject) {
		this.fbsubject = fbsubject;
	}

	public String getFbname() {
		return fbname;
	}

	public void setFbname(String fbname) {
		this.fbname = fbname;
	}

	public String getFbimg() {
		return fbimg;
	}

	public void setFbimg(String fbimg) {
		this.fbimg = fbimg;
	}

	public String getFbcontent() {
		return fbcontent;
	}

	public void setFbcontent(String fbcontent) {
		this.fbcontent = fbcontent;
	}

	public String getMember_mno() {
		return member_mno;
	}

	public void setMember_mno(String member_mno) {
		this.member_mno = member_mno;
	}

	public String getFbdeleteyn() {
		return fbdeleteyn;
	}

	public void setFbdeleteyn(String fbdeleteyn) {
		this.fbdeleteyn = fbdeleteyn;
	}

	public String getFbinsertdate() {
		return fbinsertdate;
	}

	public void setFbinsertdate(String fbinsertdate) {
		this.fbinsertdate = fbinsertdate;
	}

	public String getFbupdatedate() {
		return fbupdatedate;
	}

	public void setFbupdatedate(String fbupdatedate) {
		this.fbupdatedate = fbupdatedate;
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
