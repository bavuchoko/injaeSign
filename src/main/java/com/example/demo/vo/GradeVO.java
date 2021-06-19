package com.example.demo.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("GradeVO")
@Data
public class GradeVO {
	private String grade; //code 임
	private String grade_name;
}
