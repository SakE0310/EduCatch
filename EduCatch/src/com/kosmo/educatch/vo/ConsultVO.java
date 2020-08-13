package com.kosmo.educatch.vo;

public class ConsultVO extends AcademyVO{
	
	private String cbno;
	private String cbsubject;
	private String cbname;
	private String cbcontent;
	private String academy_ano;
	private String member_mno;
	private String cdeleteyn;
	private String cinsertdate;
	private String cupdatedate;
	
	private String pno;
	private String pagesize;
	private String groupsize;
	private String curpage;
	private String totalcount;
	
	// search 변수
	private String keyword;			// 검색어
	private String searchFilter;	// 검색조건
	private String startDate;		// 검색기간 시작일
	private String endDate;			// 검색기간 종료일
	
	public ConsultVO() {
		
	}

	public String getCbno() {
		return cbno;
	}

	public void setCbno(String cbno) {
		this.cbno = cbno;
	}

	public String getCbsubject() {
		return cbsubject;
	}

	public void setCbsubject(String cbsubject) {
		this.cbsubject = cbsubject;
	}

	public String getCbname() {
		return cbname;
	}

	public void setCbname(String cbname) {
		this.cbname = cbname;
	}

	public String getCbcontent() {
		return cbcontent;
	}

	public void setCbcontent(String cbcontent) {
		this.cbcontent = cbcontent;
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

	public String getCdeleteyn() {
		return cdeleteyn;
	}

	public void setCdeleteyn(String cdeleteyn) {
		this.cdeleteyn = cdeleteyn;
	}

	public String getCinsertdate() {
		return cinsertdate;
	}

	public void setCinsertdate(String cinsertdate) {
		this.cinsertdate = cinsertdate;
	}

	public String getCupdatedate() {
		return cupdatedate;
	}

	public void setCupdatedate(String cupdatedate) {
		this.cupdatedate = cupdatedate;
	}
	
	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getPagesize() {
		return pagesize;
	}

	public void setPagesize(String pagesize) {
		this.pagesize = pagesize;
	}

	public String getGroupsize() {
		return groupsize;
	}

	public void setGroupsize(String groupsize) {
		this.groupsize = groupsize;
	}

	public String getCurpage() {
		return curpage;
	}

	public void setCurpage(String curpage) {
		this.curpage = curpage;
	}

	public String getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(String totalcount) {
		this.totalcount = totalcount;
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
