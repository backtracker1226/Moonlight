package org.moon.domain;

import java.util.Arrays;
import java.util.Date;

public class MemberVO {
	
	private Integer mno;
	private String mid;
	private String mname;
	private String mpw;
	private String mnick;
	private String mmail;
	private String mhp;
	private Date regdate;
	
	private String[] imgname;
	
	public Integer getMno() {
		return mno;
	}
	public void setMno(Integer mno) {
		this.mno = mno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	public String getMmail() {
		return mmail;
	}
	public void setMmail(String mmail) {
		this.mmail = mmail;
	}
	public String getMhp() {
		return mhp;
	}
	public void setMhp(String mhp) {
		this.mhp = mhp;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String[] getImgname() {
		return imgname;
	}
	public void setImgname(String[] imgname) {
		this.imgname = imgname;
	}
	
	@Override
	public String toString() {
		return "MemberVO [mno=" + mno + ", mid=" + mid + ", mname=" + mname + ", mpw=" + mpw + ", mnick=" + mnick
				+ ", mmail=" + mmail + ", mhp=" + mhp + ", regdate=" + regdate + ", imgname=" + Arrays.toString(imgname)
				+ "]";
	}
		
}
