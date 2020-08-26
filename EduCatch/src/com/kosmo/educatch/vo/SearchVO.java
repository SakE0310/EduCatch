package com.kosmo.educatch.vo;

public class SearchVO extends ReviewVO{
	//분야
	private String cno;		 //C001
	private String cmajor;	 //언어
	private String cminor;	 //일본어
	//지역
	private String district; //강남구	
	private String city;	 //개포동
	
	private String listcount;// 리스트 개수
	private String rvcount;// 평점 개수
	
	public SearchVO(){
	}
	
	public String getRvcount() {
		return rvcount;
	}
	public void setRvcount(String rvcount) {
		this.rvcount = rvcount;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getCmajor() {
		return cmajor;
	}
	public void setCmajor(String cmajor) {
		this.cmajor = cmajor;
	}
	public String getCminor() {
		return cminor;
	}
	public void setCminor(String cminor) {
		this.cminor = cminor;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getListcount() {
		return listcount;
	}
	public void setListcount(String listcount) {
		this.listcount = listcount;
	}
	
}
