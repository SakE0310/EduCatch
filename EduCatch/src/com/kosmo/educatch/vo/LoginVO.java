package com.kosmo.educatch.vo;

public class LoginVO {

		//로그인
		private String mid;
		private String mpw;
		private String mname;
		private String mtel;
		private String maddrno;
		private String maddr1;
		private String maddr2;
		private String mauth;
		private String memailchk;
		private String mdeleteyn;
		private String mupdatedate;
		



		public LoginVO(String mid, String mpw, String mname, String mtel, String maddrno, String maddr1, String maddr2,
				String mauth, String memailchk, String mdeleteyn, String mupdatedate) {
			this.mid = mid;
			this.mpw = mpw;
			this.mname = mname;
			this.mtel = mtel;
			this.maddrno = maddrno;
			this.maddr1 = maddr1;
			this.maddr2 = maddr2;
			this.mauth = mauth;
			this.memailchk = memailchk;
			this.mdeleteyn = mdeleteyn;
			this.mupdatedate = mupdatedate;
		}



		public String getMid() {
			return mid;
		}



		public void setMid(String mid) {
			this.mid = mid;
		}



		public String getMpw() {
			return mpw;
		}



		public void setMpw(String mpw) {
			this.mpw = mpw;
		}



		public String getMname() {
			return mname;
		}



		public void setMname(String mname) {
			this.mname = mname;
		}



		public String getMtel() {
			return mtel;
		}



		public void setMtel(String mtel) {
			this.mtel = mtel;
		}



		public String getMaddrno() {
			return maddrno;
		}



		public void setMaddrno(String maddrno) {
			this.maddrno = maddrno;
		}



		public String getMaddr1() {
			return maddr1;
		}



		public void setMaddr1(String maddr1) {
			this.maddr1 = maddr1;
		}



		public String getMaddr2() {
			return maddr2;
		}



		public void setMaddr2(String maddr2) {
			this.maddr2 = maddr2;
		}



		public String getMauth() {
			return mauth;
		}



		public void setMauth(String mauth) {
			this.mauth = mauth;
		}



		public String getMemailchk() {
			return memailchk;
		}



		public void setMemailchk(String memailchk) {
			this.memailchk = memailchk;
		}



		public String getMdeleteyn() {
			return mdeleteyn;
		}



		public void setMdeleteyn(String mdeleteyn) {
			this.mdeleteyn = mdeleteyn;
		}



		public String getMupdatedate() {
			return mupdatedate;
		}



		public void setMupdatedate(String mupdatedate) {
			this.mupdatedate = mupdatedate;
		}
		
}
		
		
		

