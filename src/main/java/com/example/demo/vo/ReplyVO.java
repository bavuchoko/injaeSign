package com.example.demo.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("ReplyVO")
@Data
public class ReplyVO {
	private int r_num;
	private int b_num;
	private int s_num;
	private String content;
	private Date reg_date;
}
