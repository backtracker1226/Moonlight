package org.moon.domain;

public class Criteria {
	
	// page, pagenum
	private int page, perPageNum;
	private String type, keyword;

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0){
			this.page = 1;
		}
		this.page = page;
	}
	public int getPages(){
		return (this.page - 1) * 10;
		
	}

	public int getPerPageNum() {
		if(perPageNum >= 10 || perPageNum <= 10){
			this.perPageNum = 10;
		}
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", type=" + type + ", keyword=" + keyword
				+ "]";
	}




}
