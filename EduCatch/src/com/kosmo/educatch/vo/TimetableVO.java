package com.kosmo.educatch.vo;

public class TimetableVO {
	private String ttno;
	private String academy_ano;
	private String ttdate;
	private String tttime;
	private String ttpeople;
	
	public TimetableVO() {
	
	}

	public TimetableVO(String ttno, String academy_ano, String ttdate, String tttime, String ttpeople) {
		this.ttno = ttno;
		this.academy_ano = academy_ano;
		this.ttdate = ttdate;
		this.tttime = tttime;
		this.ttpeople = ttpeople;
	}

	public String getTtno() {
		return ttno;
	}

	public void setTtno(String ttno) {
		this.ttno = ttno;
	}

	public String getAcademy_ano() {
		return academy_ano;
	}

	public void setAcademy_ano(String academy_ano) {
		this.academy_ano = academy_ano;
	}

	public String getTtdate() {
		return ttdate;
	}

	public void setTtdate(String ttdate) {
		this.ttdate = ttdate;
	}

	public String getTttime() {
		return tttime;
	}

	public void setTttime(String tttime) {
		this.tttime = tttime;
	}

	public String getTtpeople() {
		return ttpeople;
	}

	public void setTtpeople(String ttpeople) {
		this.ttpeople = ttpeople;
	}
	
	
}
