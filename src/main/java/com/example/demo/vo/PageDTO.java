package com.example.demo.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("PageDTO")
@Data
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev,next;
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		System.out.println(cri.getPageNum());
		System.out.println(cri.getWord());
		this.cri = cri;
		this.total = total;
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage = endPage-9;
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
