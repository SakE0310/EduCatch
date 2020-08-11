package com.kosmo.educatch.vo;

public class SearchVO extends ReviewVO{
	//분야
	private String cno;		 //C001
	private String cmajor;	 //언어
	private String cminor;	 //일본어
	//지역
	private String district; //강남구	
	private String city;	 //개포동	
	
	
	public SearchVO(){
		
	}
	
	public SearchVO(String cno, String cmajor, String cminor, String district, String city) {
		super();
		this.cno = cno;
		this.cmajor = cmajor;
		this.cminor = cminor;
		this.district = district;
		this.city = city;
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
	
	
}
