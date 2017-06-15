package org.moon.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import org.moon.domain.Criteria;

public class PageMaker extends Criteria {
	
	//start, end, tempEnd, current, totalSize(게시물 총 개수), prev, next
	
	private Integer start, end, current, totalSize, size;
	
	private double tempEnd;
	
	private boolean prev, next;
	
	private Criteria cri;


	// 한 페이지에 보여줄 갯수 cri.perPageNum
	
    public PageMaker(Criteria cri, int totalSize){
        
        this.cri = cri;
        this.totalSize = totalSize;
        this.current = cri.getPage();
        this.size = cri.getPerPageNum();
        calcPage();
    }
    
    private void calcPage(){
    	System.out.println("현재 값"+this.current);
        int tempEnd = (int)(Math.ceil(this.current / 10.0) * 10);
        this.start = (int) (tempEnd - 9);
        this.end = tempEnd * size > totalSize ? (int)Math.ceil(totalSize/(double)size):tempEnd;
        
        this.prev = this.start == 1?false:true;
        this.next = this.totalSize > this.end * size? true : false;
    }
    
    // 검색용
    public String makeSearch(Integer page){
    	
    	UriComponents uricompnent = UriComponentsBuilder.newInstance()
    			.queryParam("page", page)
    			.queryParam("perPageNum", cri.getPerPageNum())
    			.queryParam("type", cri.getType())
    			.queryParam("keyword", encoding(cri.getKeyword()))
    			.build();

    	return uricompnent.toUriString();

    }
    
    private String encoding(String keyword){
    	
    	if(keyword== null || keyword.trim().length() == 0){
    		return "";
    	}
    	try{
    		return URLEncoder.encode(keyword,"UTF-8");
    	}catch(UnsupportedEncodingException e){
    		return "";
    	}
    	
    	
    }

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getEnd() {
		return end;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public Integer getCurrent() {
		return current;
	}

	public void setCurrent(Integer current) {
		this.current = current;
	}

	public Integer getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(Integer totalSize) {
		this.totalSize = totalSize;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public double getTempEnd() {
		return tempEnd;
	}

	public void setTempEnd(double tempEnd) {
		this.tempEnd = tempEnd;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMaker [start=" + start + ", end=" + end + ", current=" + current + ", totalSize=" + totalSize
				+ ", size=" + size + ", tempEnd=" + tempEnd + ", prev=" + prev + ", next=" + next + ", cri=" + cri
				+ "]";
	}


	
}
