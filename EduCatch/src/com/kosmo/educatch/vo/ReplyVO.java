package com.kosmo.educatch.vo;

public class ReplyVO {

	private String reno;//댓글번호
	private String freeboard_fbno;//자유 게시글 번호
	private String consultboard_cbno;//상담 게시글 번호
	private String reviewboard_rbno;//후기 게시글 번호
	private String resubject;
	private String rewriter;
	private String recontent;//댓글 내용
	private String member_mno;//회원번호
	private String redeleteyn;//댓글 삭제여부
	private String reinsertdate;//댓글 작성일자
	private String reupdatedate;//댓글 수정일자
	
	public ReplyVO() {
		
	}

	public String getReno() {
		return reno;
	}

	public void setReno(String reno) {
		this.reno = reno;
	}

	public String getFreeboard_fbno() {
		return freeboard_fbno;
	}

	public void setFreeboard_fbno(String freeboard_fbno) {
		this.freeboard_fbno = freeboard_fbno;
	}

	public String getConsultboard_cbno() {
		return consultboard_cbno;
	}

	public void setConsultboard_cbno(String consultboard_cbno) {
		this.consultboard_cbno = consultboard_cbno;
	}

	public String getReviewboard_rbno() {
		return reviewboard_rbno;
	}

	public void setReviewboard_rbno(String reviewboard_rbno) {
		this.reviewboard_rbno = reviewboard_rbno;
	}

	public String getResubject() {
		return resubject;
	}

	public void setResubject(String resubject) {
		this.resubject = resubject;
	}

	public String getRewriter() {
		return rewriter;
	}

	public void setRewriter(String rewriter) {
		this.rewriter = rewriter;
	}

	public String getRecontent() {
		return recontent;
	}

	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

	public String getMember_mno() {
		return member_mno;
	}

	public void setMember_mno(String member_mno) {
		this.member_mno = member_mno;
	}

	public String getRedeleteyn() {
		return redeleteyn;
	}

	public void setRedeleteyn(String redeleteyn) {
		this.redeleteyn = redeleteyn;
	}

	public String getReinsertdate() {
		return reinsertdate;
	}

	public void setReinsertdate(String reinsertdate) {
		this.reinsertdate = reinsertdate;
	}

	public String getReupdatedate() {
		return reupdatedate;
	}

	public void setReupdatedate(String reupdatedate) {
		this.reupdatedate = reupdatedate;
	}
	
	
}
