package com.kosmo.educatch.vo;

public class SearchVO {
	//분야
	private String cno;		 //C001
	private String cmajor;	 //언어
	private String cminor;	 //일본어
	//지역
	private String district; //강남구	
	private String city;	 //개포동	

	//학원
	private String ano;		 //학원넘버
	private String aname;	 //학원이름
	private String atel;	 //학원번호
	private String axpoint;  //학원X좌표
	private String aypoint;  //학원Y좌표
	private String aaddrno;  //학원우편번호
	private String aaddr1;   //학원기본주소
	private String aaddr2;   //학원상세주소
	private String alogo;    //학원로고
	private String category_cno;   //카테고리 키번호
	private String adeleteyn;      //학원삭제여부
	private String ainsertdate;	   //학원등록일
	private String aupdatedate;	   //학원수정일
	
	public SearchVO() {
	}
	
	public SearchVO(String cno, String cmajor, String cminor, String district, String city, String ano, String aname,
			String atel, String axpoint, String aypoint, String aaddrno, String aaddr1, String aaddr2, String alogo,
			String category_cno, String adeleteyn, String ainsertdate, String aupdatedate) {
		this.cno = cno;
		this.cmajor = cmajor;
		this.cminor = cminor;
		this.district = district;
		this.city = city;
		this.ano = ano;
		this.aname = aname;
		this.atel = atel;
		this.axpoint = axpoint;
		this.aypoint = aypoint;
		this.aaddrno = aaddrno;
		this.aaddr1 = aaddr1;
		this.aaddr2 = aaddr2;
		this.alogo = alogo;
		this.category_cno = category_cno;
		this.adeleteyn = adeleteyn;
		this.ainsertdate = ainsertdate;
		this.aupdatedate = aupdatedate;
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

	public String getAno() {
		return ano;
	}

	public void setAno(String ano) {
		this.ano = ano;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getAtel() {
		return atel;
	}

	public void setAtel(String atel) {
		this.atel = atel;
	}

	public String getAxpoint() {
		return axpoint;
	}

	public void setAxpoint(String axpoint) {
		this.axpoint = axpoint;
	}

	public String getAypoint() {
		return aypoint;
	}

	public void setAypoint(String aypoint) {
		this.aypoint = aypoint;
	}

	public String getAaddrno() {
		return aaddrno;
	}

	public void setAaddrno(String aaddrno) {
		this.aaddrno = aaddrno;
	}

	public String getAaddr1() {
		return aaddr1;
	}

	public void setAaddr1(String aaddr1) {
		this.aaddr1 = aaddr1;
	}

	public String getAaddr2() {
		return aaddr2;
	}

	public void setAaddr2(String aaddr2) {
		this.aaddr2 = aaddr2;
	}

	public String getAlogo() {
		return alogo;
	}

	public void setAlogo(String alogo) {
		this.alogo = alogo;
	}

	public String getCategory_cno() {
		return category_cno;
	}

	public void setCategory_cno(String category_cno) {
		this.category_cno = category_cno;
	}

	public String getAdeleteyn() {
		return adeleteyn;
	}

	public void setAdeleteyn(String adeleteyn) {
		this.adeleteyn = adeleteyn;
	}

	public String getAinsertdate() {
		return ainsertdate;
	}

	public void setAinsertdate(String ainsertdate) {
		this.ainsertdate = ainsertdate;
	}

	public String getAupdatedate() {
		return aupdatedate;
	}

	public void setAupdatedate(String aupdatedate) {
		this.aupdatedate = aupdatedate;
	}
}
