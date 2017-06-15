package org.moon.domain;

import java.sql.Date;
import java.util.Arrays;

public class RoofTopVO {
	
	private Integer rtid;
	private String rtname;
	private String rtintroduction;
	private String rtemail;
	private String rtphonenumber;
	private String rtaddress;
	private String rtnotes;
	private String rtpurpose;
	private double rtlat;
	private double rtlng;
	public double getRtlat() {
		return rtlat;
	}
	public void setRtlat(double rtlat) {
		this.rtlat = rtlat;
	}
	public double getRtlng() {
		return rtlng;
	}
	public void setRtlng(double rtlng) {
		this.rtlng = rtlng;
	}
	public String getRtnotes() {
		return rtnotes;
	}
	public void setRtnotes(String rtnotes) {
		this.rtnotes = rtnotes;
	}
	public String getRtpurpose() {
		return rtpurpose;
	}
	public void setRtpurpose(String rtpurpose) {
		this.rtpurpose = rtpurpose;
	}
	private int price;
	private int minpeople;
	private int maxpeople;
	private Date regdate;
	private Date updatedate;
	
	private String[] files;
	private String[] hashtags;
	private String[] options;
	public Integer getRtid() {
		return rtid;
	}
	public void setRtid(Integer rtid) {
		this.rtid = rtid;
	}
	public String getRtname() {
		return rtname;
	}
	public void setRtname(String rtname) {
		this.rtname = rtname;
	}
	public String getRtintroduction() {
		return rtintroduction;
	}
	public void setRtintroduction(String rtintroduction) {
		this.rtintroduction = rtintroduction;
	}
	public String getRtemail() {
		return rtemail;
	}
	public void setRtemail(String rtemail) {
		this.rtemail = rtemail;
	}
	public String getRtphonenumber() {
		return rtphonenumber;
	}
	public void setRtphonenumber(String rtphonenumber) {
		this.rtphonenumber = rtphonenumber;
	}
	public String getRtaddress() {
		return rtaddress;
	}
	public void setRtaddress(String rtaddress) {
		this.rtaddress = rtaddress;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMinpeople() {
		return minpeople;
	}
	public void setMinpeople(int minpeople) {
		this.minpeople = minpeople;
	}
	public int getMaxpeople() {
		return maxpeople;
	}
	public void setMaxpeople(int maxpeople) {
		this.maxpeople = maxpeople;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public String[] getHashtags() {
		return hashtags;
	}
	public void setHashtags(String[] hashtags) {
		this.hashtags = hashtags;
	}
	public String[] getOptions() {
		return options;
	}
	public void setOptions(String[] options) {
		this.options = options;
	}
	@Override
	public String toString() {
		return "RoofTopVO [rtid=" + rtid + ", rtname=" + rtname + ", rtintroduction=" + rtintroduction + ", rtemail="
				+ rtemail + ", rtphonenumber=" + rtphonenumber + ", rtaddress=" + rtaddress + ", rtnotes=" + rtnotes
				+ ", rtpurpose=" + rtpurpose + ", rtlat=" + rtlat + ", rtlng=" + rtlng + ", price=" + price
				+ ", minpeople=" + minpeople + ", maxpeople=" + maxpeople + ", regdate=" + regdate + ", updatedate="
				+ updatedate + ", files=" + Arrays.toString(files) + ", hashtags=" + Arrays.toString(hashtags)
				+ ", options=" + Arrays.toString(options) + "]";
	}
	
	

	
	
	
	
	
	

}
