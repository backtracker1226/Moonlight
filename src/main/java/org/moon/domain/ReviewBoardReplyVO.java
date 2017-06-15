package org.moon.domain;

import java.sql.Timestamp;

public class ReviewBoardReplyVO {
	
	// db 테이블 구조
/*	create table tbl_board_review_reply(
			rno number(30) not null,
			bno number(30) not null,
			uname varchar2(1000) not null,
			regdate date default sysdate,
			updatedate date default sysdate,
			ski number(30),
			constraint PK_reply primary key(rno),
			constraint FK_reply foreign key(bno) references tbl_board_review(bno)
			);*/
	
	private Integer rno;
	private Integer bno;
	private String uname;
	private String replytext;
	private Timestamp regdate;
	private Timestamp updatedate;
	private Integer ski;
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
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
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
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
		return "ReviewBoardReplyVO [rno=" + rno + ", bno=" + bno + ", uname=" + uname + ", replytext=" + replytext
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", ski=" + ski + "]";
	}
	
	
	

}
