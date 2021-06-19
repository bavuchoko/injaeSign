package com.example.demo.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("BoardVO")
@Data
public class BoardVO {
	private String b_num;
	private String s_num;
	
	private String title;
	private String content;
	private String file;
	private String reg_date;
	private int view_count;
	private int reply_count;
	
   //DB테이블에는 존재하지 않는 컬럼
	private String name;
}
