package org.moon.domain;

import java.sql.Timestamp;

public class BoardVO {
	
	// 데이터 베이스 테이블 입니다.
	
/*	create table tbl_board_review(

			bno number(30) not null,
			uname varchar2(1000) not null,
			title varchar2(1000) not null,
			reviewcon varchar2(2000) not null,
			viewctn number(30),
			  regdate date default sysdate,
			  updatedate date default sysdate,
			  ski number(30)
			);*/
	
	private Integer bno;
	private String uname;
	private String title;
	private String reviewcon;		// 게시글 내용 입니다.
	private Integer viewctn;
	private Timestamp regdate;
	private Timestamp updatedate;
	private Integer ski;			// 좋아용 갯수 입니다!
	
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReviewcon() {
		return reviewcon;
	}
	public void setReviewcon(String reviewcon) {
		this.reviewcon = reviewcon;
	}
	public Integer getViewctn() {
		return viewctn;
	}
	public void setViewctn(Integer viewctn) {
		this.viewctn = viewctn;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}
	public Integer getSki() {
		return ski;
	}
	public void setSki(Integer ski) {
		this.ski = ski;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", uname=" + uname + ", title=" + title + ", reviewcon=" + reviewcon
				+ ", viewctn=" + viewctn + ", regdate=" + regdate + ", updatedate=" + updatedate + ", ski=" + ski + "]";
	}
	
	
	
	
	

	
	
}
