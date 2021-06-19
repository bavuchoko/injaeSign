package com.example.demo.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("Criteria")
@Data
public class Criteria {
	private int pageNum;
	private int amount;
	
	private int stcount;
	private int edcount;
	
	private String type;
	private String word;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.stcount = (pageNum-1) * amount;
		this.edcount = pageNum * amount;
	}
	
	public String[] getTypeArr() {
		return type == null?new String[] {} : type.split("");
	}
}
