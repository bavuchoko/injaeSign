package com.example.demo.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("PreviligesVO")
@Data
public class PreviligesVO {
	private String auth;
	private String role;
}
