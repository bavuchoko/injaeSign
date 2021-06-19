package com.example.demo.vo;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Alias("NoticeVO")
@Data
public class NoticeVO {
	private int n_num;
	private String title;
	private String content;
	private int view_count;
	private String file;
	private String reg_date;
	private int s_num;
	
   //DB테이블에는 존재하지 않는 컬럼
	private String name;
}
